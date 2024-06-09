package com.nhom12.website_ban_sach.service;

import com.nhom12.website_ban_sach.repository.ChiTietDonHangRepository;
import com.nhom12.website_ban_sach.repository.ChiTietGioHangRepository;
import com.nhom12.website_ban_sach.repository.DonHangRepository;
import com.nhom12.website_ban_sach.repository.TaiKhoanRepository;
import com.nhom12.website_ban_sach.dto.dto_entity.DonHangDTO;
import com.nhom12.website_ban_sach.dto.request.CreateDonHangRequest;
import com.nhom12.website_ban_sach.entity.ChiTietDonHang;
import com.nhom12.website_ban_sach.entity.ChiTietGioHang;
import com.nhom12.website_ban_sach.entity.DonHang;
import com.nhom12.website_ban_sach.entity.TaiKhoan;
import com.nhom12.website_ban_sach.mapper.DonHangMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class DonHangService {
    @Autowired
    private DonHangRepository donHangRepository;
    @Autowired
    private ChiTietDonHangRepository chiTietDonHangRepository;
    @Autowired
    private ChiTietGioHangRepository chiTietGioHangRepository;
    @Autowired
    private TaiKhoanRepository taiKhoanRepository;

    public DonHangDTO taoDonHang(CreateDonHangRequest createDonHangRequest) {
        //tạo mới đơn hàng
        DonHang dh = new DonHang();
        dh.setNgayDatHang(LocalDateTime.now());
        dh.setDiaChi(createDonHangRequest.getDiaChi());
        dh.setSoDienThoai(createDonHangRequest.getSoDienThoai());
        dh.setTenNguoiNhan(createDonHangRequest.getTenNguoiNhan());
        dh.setDaThanhToan(true);
        BigDecimal tongTien = BigDecimal.valueOf(0);

        TaiKhoan tk = taiKhoanRepository.findById(createDonHangRequest.getTaiKhoanId()).get();
        dh.setTaiKhoan(tk);
        donHangRepository.save(dh);
        //tạo các chi tiết đơn hàng từ chi tiết giỏ hàng + tính tổng tiền của đơn hàng
        List<ChiTietGioHang> chiTietGioHangList = chiTietGioHangRepository.findAllByTaiKhoanId(createDonHangRequest.getTaiKhoanId());
        List<ChiTietDonHang> chiTietDonHangList = new ArrayList<>();

        for (ChiTietGioHang ctgh : chiTietGioHangList) {
            ChiTietDonHang ctdh = new ChiTietDonHang(
                    ctgh.getId(),
                    dh,
                    ctgh.getSach(),
                    ctgh.getSoLuong(),
                    ctgh.getSach().getGia().multiply(BigDecimal.valueOf(ctgh.getSoLuong()))
            );
            chiTietDonHangList.add(ctdh);
            tongTien = tongTien.add(ctdh.getGia());
        }

        dh.setTongTien(tongTien);
        chiTietDonHangRepository.saveAll(chiTietDonHangList);
        //xoá các chi tiết giỏ hàng
        chiTietGioHangRepository.deleteAll(chiTietGioHangList);
        return DonHangMapper.mapToDonHangDTO(dh);
    }

    public long getTotalDonHang() {
        return donHangRepository.count();
    }

    public Long getTotalTongTien() {
        return donHangRepository.sumTongTien();
    }

    public List<DonHangDTO> getAllDonHang(){
        List<DonHang> dsDH = donHangRepository.findAll();
        List<DonHangDTO> dsDH_DTO = new ArrayList<>();
        for (DonHang dh:dsDH){
            dsDH_DTO.add(DonHangMapper.mapToDonHangDTO(dh));
        }
        return dsDH_DTO;
    }

    public List<DonHangDTO> getAllDonHangByAccountId(Long accountId) {
        List<DonHang> dsDH = donHangRepository.findAll();
        List<DonHangDTO> dsDH_DTO = new ArrayList<>();
        for (DonHang dh : dsDH) {
            if (dh.getTaiKhoan().getId() == accountId)
                dsDH_DTO.add(DonHangMapper.mapToDonHangDTO(dh));
        }
        return dsDH_DTO;
    }

    public DonHangDTO getThongTinDonHang(Long orderId) {
        return DonHangMapper.mapToDonHangDTO(donHangRepository.findById(orderId).get());
    }
}
