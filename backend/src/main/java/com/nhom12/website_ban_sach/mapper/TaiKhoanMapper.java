package com.nhom12.website_ban_sach.mapper;

import com.nhom12.website_ban_sach.dto.dto_entity.TaiKhoanDTO;
import com.nhom12.website_ban_sach.entity.TaiKhoan;

public class TaiKhoanMapper {
    public static TaiKhoanDTO mapToTaiKhoanDTO(TaiKhoan taiKhoan){
        return new TaiKhoanDTO(taiKhoan.getId(),
                taiKhoan.getUsername(),
                taiKhoan.getPassword(),
                taiKhoan.getRole(),
                taiKhoan.getEmail(),
                taiKhoan.getGioiTinh());
    }

    public static TaiKhoan mapToTaiKhoan(TaiKhoanDTO aDTO){
        return new TaiKhoan(aDTO.getId(),
                aDTO.getUsername(),
                aDTO.getPassword(),
                aDTO.getRole(),
                aDTO.getEmail(),
                aDTO.getGioiTinh());
    }
}
