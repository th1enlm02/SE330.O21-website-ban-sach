package com.nhom12.website_ban_sach.dto.dto_entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class ChiTietGioHangDTO {
    private Long id;
//    private TaiKhoanDTO taiKhoan;
    private Long taiKhoanId;
    private SachDTO sach;
    private Integer soLuong;
}
