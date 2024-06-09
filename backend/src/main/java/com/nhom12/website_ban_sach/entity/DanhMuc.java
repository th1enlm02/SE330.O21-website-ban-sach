package com.nhom12.website_ban_sach.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;


@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Danhmuc")
public class DanhMuc {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String tenDanhMuc;

    @OneToMany(mappedBy = "danhMuc", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<Sach> saches;

    public DanhMuc(Long id, String tenDanhMuc) {
        this.id = id;
        this.tenDanhMuc = tenDanhMuc;
    }
}
