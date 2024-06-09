package com.nhom12.website_ban_sach.dto.dto_entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class TaiKhoanDTO {
    private Long id;
    private String username;
    private String password;
    private String role;
    private String email;
    private String gioiTinh;
}
