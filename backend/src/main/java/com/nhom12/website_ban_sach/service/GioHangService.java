package com.nhom12.website_ban_sach.service;

import com.nhom12.website_ban_sach.mapper.ChiTietGioHangMapper;
import com.nhom12.website_ban_sach.repository.GioHangRepository;
import com.nhom12.website_ban_sach.repository.SachRepository;
import com.nhom12.website_ban_sach.repository.TaiKhoanRepository;
import com.nhom12.website_ban_sach.service.service_interface.IGioHangService;
import com.nhom12.website_ban_sach.dto.dto_entity.ChiTietGioHangDTO;
import com.nhom12.website_ban_sach.dto.request.AddToCartRequest;
import com.nhom12.website_ban_sach.dto.request.ChiTietGioHangRequest;
import com.nhom12.website_ban_sach.entity.TaiKhoan;
import com.nhom12.website_ban_sach.entity.Sach;
import com.nhom12.website_ban_sach.entity.ChiTietGioHang;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class GioHangService implements IGioHangService {
    @Autowired
    private GioHangRepository gioHangRepository;

    @Autowired
    private TaiKhoanRepository taiKhoanRepository;

    @Autowired
    private SachRepository sachRepository;

    public ChiTietGioHangDTO addToCart(AddToCartRequest request) {
        Optional<ChiTietGioHang> optionalChiTietGioHang = gioHangRepository.findByTaiKhoanIdAndSachId(request.getTaiKhoanId(), request.getSachId());
        ChiTietGioHang chiTietGioHang;
        Sach b = sachRepository.findById(request.getSachId()).orElseThrow(() -> new IllegalArgumentException("Sách không tồn tại"));
        if (optionalChiTietGioHang.isPresent()) {
            chiTietGioHang = optionalChiTietGioHang.get();
            chiTietGioHang.setSoLuong(chiTietGioHang.getSoLuong() + request.getSoLuong());
        } else {
            chiTietGioHang = new ChiTietGioHang();
            chiTietGioHang.setSoLuong(request.getSoLuong());
            TaiKhoan taiKhoan = taiKhoanRepository.findById(request.getTaiKhoanId()).orElseThrow(() ->
                    new IllegalArgumentException("User không tồn tại"));
            if(b.getSoLuong() < request.getSoLuong()) {
                throw new IllegalArgumentException("Số lượng sản phẩm trong kho không đủ");
            }
            chiTietGioHang.setSach(b);
            chiTietGioHang.setTaiKhoan(taiKhoan);
        }
        b.setSoLuong(b.getSoLuong() - request.getSoLuong());
        return ChiTietGioHangMapper.mapToChiTietGioHangDTO(gioHangRepository.save(chiTietGioHang));
    }

    public ChiTietGioHangDTO updateGioHang(Long id, ChiTietGioHangRequest chiTietGioHangRequest) {
        ChiTietGioHang chiTietGioHang = gioHangRepository.findById(id).get();
        chiTietGioHang.setSach(sachRepository.findById(
                chiTietGioHangRequest.getSachId()).get()
        );
        chiTietGioHang.setSoLuong(chiTietGioHangRequest.getSoLuong());
        chiTietGioHang.setTaiKhoan(
                taiKhoanRepository.findById(chiTietGioHangRequest.getTaiKhoanId()).get()
        );
        return ChiTietGioHangMapper
                .mapToChiTietGioHangDTO(gioHangRepository.save(chiTietGioHang));
    }

    public List<ChiTietGioHangDTO> getAllGioHang(Long accountId) {
        List<ChiTietGioHangDTO> chiTietGioHangDTOList = new ArrayList<>();
        List<ChiTietGioHang> chiTietGioHangList = gioHangRepository.findAll();
        for(ChiTietGioHang ctgh : chiTietGioHangList){
            if(ctgh.getTaiKhoan().getId() == accountId)
                chiTietGioHangDTOList.add(ChiTietGioHangMapper.mapToChiTietGioHangDTO(ctgh));
        }
        return chiTietGioHangDTOList;
    }

    public void deleteChiTietGioHang(Long ctghId){
        gioHangRepository.deleteById(ctghId);
    }
}
