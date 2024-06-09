package com.nhom12.website_ban_sach.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CreateDonHangRequest {
    private Long taiKhoanId;
    private String diaChi;
    private String tenNguoiNhan;
    private String soDienThoai;
}
