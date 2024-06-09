package com.nhom12.website_ban_sach.entity;

import jakarta.persistence.*;
import lombok.*;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Data
public class ChiTietGioHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "TaiKhoanId")
    private TaiKhoan taiKhoan;

    @ManyToOne
    @JoinColumn(name = "SachId")
    private Sach sach;

    private Integer soLuong;
}