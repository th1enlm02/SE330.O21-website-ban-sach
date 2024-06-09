package com.nhom12.website_ban_sach.mapper;

import com.nhom12.website_ban_sach.dto.dto_entity.ChiTietGioHangDTO;
import com.nhom12.website_ban_sach.entity.ChiTietGioHang;

public class ChiTietGioHangMapper {
    public static ChiTietGioHangDTO mapToChiTietGioHangDTO(ChiTietGioHang c){
        return new ChiTietGioHangDTO(c.getId(),
                c.getTaiKhoan().getId(),
                SachMapper.mapToSachDTO(c.getSach()),
                c.getSoLuong());
    }

    public static ChiTietGioHang mapToChiTietGioHang(ChiTietGioHangDTO cdto){
        return new ChiTietGioHang(cdto.getId(),
                null,
                SachMapper.mapToSach(cdto.getSach()),
                cdto.getSoLuong());
    }
}
