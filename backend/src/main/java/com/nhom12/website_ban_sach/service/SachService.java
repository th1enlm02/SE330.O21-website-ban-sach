package com.nhom12.website_ban_sach.service;

import com.nhom12.website_ban_sach.repository.DanhMucRepository;
import com.nhom12.website_ban_sach.repository.SachRepository;
import com.nhom12.website_ban_sach.repository.TacGiaRepository;
import com.nhom12.website_ban_sach.service.service_interface.ISachService;
import com.nhom12.website_ban_sach.dto.dto_entity.SachDTO;
import com.nhom12.website_ban_sach.dto.request.SachUpdateReq;
import com.nhom12.website_ban_sach.dto.response.SachPhanTrang;
import com.nhom12.website_ban_sach.entity.DanhMuc;
import com.nhom12.website_ban_sach.entity.Sach;
import com.nhom12.website_ban_sach.entity.TacGia;
import com.nhom12.website_ban_sach.mapper.DanhMucMapper;
import com.nhom12.website_ban_sach.mapper.SachMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.*;

@Service
public class SachService implements ISachService {
    Comparator<SachDTO> compareByNgayTao = new Comparator<SachDTO>() {
        @Override
        public int compare(SachDTO o1, SachDTO o2) {
            return o2.getNgayTao().compareTo(o1.getNgayTao());
        }
    };
    @Autowired
    private SachRepository sachRepository;
    @Autowired
    private DanhMucRepository danhMucRepository;
    @Autowired
    private DanhMucService danhMucService;
    @Autowired
    private TacGiaService tacGiaService;
    @Autowired
    private TacGiaRepository tacGiaRepository;


    public List<SachDTO> getAllSachs() {
        List<Sach> sachList = sachRepository.findAll();
        List<SachDTO> sachDTOList = new ArrayList<>();
        for (Sach sach : sachList) {
            sachDTOList.add(SachMapper.mapToSachDTO(sach));
        }
        return sachDTOList;
    }

    public SachDTO save(SachDTO sachDTO, Long danhMucId, List<Long> authorIds) {
        Sach sach = SachMapper.mapToSach(sachDTO);

        Optional<DanhMuc> danhMuc = danhMucService.getDanhMucById(danhMucId);
        sach.setDanhMuc(danhMuc.get());
        sach.setNgayTao(LocalDateTime.now());

        List<Optional<TacGia>> authorsOptional = tacGiaService.getAuthorByIds(authorIds);

        List<TacGia> tacGias = new ArrayList<>();
        for (Optional<TacGia> authorOptional : authorsOptional) {
            authorOptional.ifPresent(tacGias::add);
        }

        sach.setTacGias(tacGias);
        return SachMapper.mapToSachDTO(sachRepository.save(sach));
    }

    public List<SachDTO> getByDanhMuc(Long id) {
        List<Sach> sachList = sachRepository.findAllByDanhMucId(id);
        List<SachDTO> sachDTOList = new ArrayList<>();
        for (Sach s : sachList) {
            sachDTOList.add(SachMapper.mapToSachDTO(s));
        }
        return sachDTOList;
    }

    public SachPhanTrang getSachByDanhMucPhanTrang(Long dmid, Integer page){
        Pageable pageable = PageRequest.of(page - 1, 12);
        List<SachDTO> sachDTOPage = new ArrayList<>();
        Page<Sach> sachPage = this.sachRepository.findAllByDanhMucId(dmid, pageable);
        Integer totalPage = sachPage.getTotalPages();
        for (Sach s : sachPage) {
            sachDTOPage.add(SachMapper.mapToSachDTO(s));
        }
        SachPhanTrang sachPhanTrang = new SachPhanTrang(sachDTOPage, totalPage);
        return sachPhanTrang;
    }

    public SachDTO updateSach(Long id, SachUpdateReq sachDTO) {
        Sach sach = sachRepository.findById(id).get();
        sach.setDanhMuc(DanhMucMapper.mapToDanhMuc(sachDTO.getDanhMuc()));
        sach.setGia(sachDTO.getGia());
        sach.setMoTa(sachDTO.getMoTa());
        sach.setSoLuong(sachDTO.getSoLuong());
        sach.setTieuDe(sachDTO.getTieuDe());
        sach.setPhotoURL(sachDTO.getPhotoURL());
        sach.setNgayTao(sachDTO.getNgayTao());
        List<TacGia> tg = new ArrayList<>();
        tg.add(tacGiaRepository.findById(sachDTO.getTacGiaId()).get());
        sach.setTacGias(tg);
        return SachMapper.mapToSachDTO(sachRepository.save(sach));
    }

    public void deleteSach(Long id) {
        sachRepository.deleteById(id);
    }

    @Override
    public SachDTO getSachById(Long id) {
        return SachMapper.mapToSachDTO(sachRepository.findById(id).get());
    }

    public SachPhanTrang getSachTheoPhanTrang(Integer page) {
        Pageable pageable = PageRequest.of(page - 1, 12);
        List<SachDTO> sachDTOPage = new ArrayList<>();
        Page<Sach> sachPage = this.sachRepository.findAll(pageable);
        Integer totalPage = sachPage.getTotalPages();
        for (Sach s : sachPage) {
            sachDTOPage.add(SachMapper.mapToSachDTO(s));
        }
        SachPhanTrang sachPhanTrang = new SachPhanTrang(sachDTOPage, totalPage);
        return sachPhanTrang;
    }

    public List<SachDTO> getSachMoi() {
        List<Sach> sachList = sachRepository.findAll();
        List<SachDTO> sachDTOList = new ArrayList<>();
        for (Sach sach : sachList) {
            sachDTOList.add(SachMapper.mapToSachDTO(sach));
        }
        Collections.sort(sachDTOList, compareByNgayTao);

        if (sachDTOList.size() > 10) return sachDTOList.subList(0, 12);
        else return sachDTOList;
    }

    public List<SachDTO> locTheoGia(Integer min, Integer max, Long id) {
        List<Sach> sachList = sachRepository.findAll();
        List<SachDTO> sachDTOList = new ArrayList<>();
        for (Sach sach : sachList) {
            if (sach.getGia().compareTo(BigDecimal.valueOf(max)) != 1 && sach.getGia().compareTo(BigDecimal.valueOf(min)) != -1)
            {
                if(sach.getDanhMuc().getId() == id){
                    sachDTOList.add(SachMapper.mapToSachDTO(sach));
                }
            }
        }

        return sachDTOList;
    }

    public long getTotalSach() {
        return sachRepository.count();
    }

    public List<SachDTO> getSachByTacGia(Long id) {
        TacGia tg = tacGiaRepository.findById(id).get();
        List<Sach> dsSach = tg.getSaches();
        List<SachDTO> res = new ArrayList<>();
        for(Sach s: dsSach){
            res.add(SachMapper.mapToSachDTO(s));
        }
        return res;
    }

    public List<SachDTO> timSachTheoTieuDe(String tieuDe){
        List<Sach> dsSach = sachRepository.findByTieuDeContaining(tieuDe);
        List<SachDTO> res = new ArrayList<>();
        for (Sach s : dsSach){
            res.add(SachMapper.mapToSachDTO(s));
        }
        return res;
    }
}
