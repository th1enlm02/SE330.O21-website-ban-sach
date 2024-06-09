package com.nhom12.website_ban_sach.dto.dto_entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
public class DonHangDTO {
    private Long id;
    private LocalDateTime ngayDat;
//    private TaiKhoanDTO taiKhoan;
    private Long taiKhoanId;
    private String diaChi;
    private BigDecimal tongTien;
    private Boolean daThanhToan;
    private String tenNguoiNhan;
    private String soDienThoai;
}
