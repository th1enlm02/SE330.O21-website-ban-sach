package com.nhom12.website_ban_sach.entity;

import lombok.*;

import jakarta.persistence.*;

import java.math.BigDecimal;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "ChiTietDonHang")
public class ChiTietDonHang {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "DonHangId")
    private DonHang donHang;

    @ManyToOne
    @JoinColumn(name = "SachId")
    private Sach sach;

    private Integer soLuong;
    private BigDecimal gia;
}

