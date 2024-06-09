package com.nhom12.website_ban_sach.entity;

import lombok.*;

import jakarta.persistence.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "DonHang")
public class DonHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private LocalDateTime ngayDatHang;

    @ManyToOne
    @JoinColumn(name = "TaiKhoanId")
    private TaiKhoan taiKhoan;

    private String diaChi;
    private BigDecimal tongTien;
    private Boolean daThanhToan;
    private String tenNguoiNhan;
    private String soDienThoai;
}

