package com.nhom12.website_ban_sach.entity;

import jakarta.persistence.*;
import lombok.*;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Sach")
public class Sach {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String tieuDe;
    private BigDecimal gia;
    private Integer soLuong;
    private String photoURL;
    private String moTa;
    private LocalDateTime ngayTao;

    @ManyToOne
    @JoinColumn(name = "DanhMucId")
    private DanhMuc danhMuc;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(
            name = "tacgia_sach",
            joinColumns = @JoinColumn(name = "sach_id"),
            inverseJoinColumns = @JoinColumn(name = "tacgia_id")
    )
    private List<TacGia> tacGias;

    public Sach(String tieuDe, BigDecimal gia, Integer soLuong, String photoURL, String moTa, LocalDateTime ngayTao) {
        this.tieuDe = tieuDe;
        this.gia = gia;
        this.soLuong = soLuong;
        this.photoURL = photoURL;
        this.moTa = moTa;
        this.ngayTao = ngayTao;
    }
}