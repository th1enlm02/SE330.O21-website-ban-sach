package com.nhom12.website_ban_sach.mapper;

import com.nhom12.website_ban_sach.entity.DonHang;
import com.nhom12.website_ban_sach.dto.dto_entity.DonHangDTO;

public class DonHangMapper {
    public static DonHang mapToDonHang(DonHangDTO donHangDTO){
        return new DonHang(donHangDTO.getId(),
                donHangDTO.getNgayDat(),
                null,
                donHangDTO.getDiaChi(),
                donHangDTO.getTongTien(),
                donHangDTO.getDaThanhToan(),
                donHangDTO.getTenNguoiNhan(),
                donHangDTO.getSoDienThoai());
    }
    public static DonHangDTO mapToDonHangDTO(DonHang dh){
        return new DonHangDTO(dh.getId(),
                dh.getNgayDatHang(),
                dh.getTaiKhoan().getId(),
                dh.getDiaChi(),
                dh.getTongTien(),
                dh.getDaThanhToan(),
                dh.getTenNguoiNhan(),
                dh.getSoDienThoai());
    }
}
