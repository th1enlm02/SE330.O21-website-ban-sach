package com.nhom12.website_ban_sach.entity;

import lombok.*;

import jakarta.persistence.*;

import java.util.List;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "TacGia")
public class TacGia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String tenTacGia;

    private String image;

    @ManyToMany
    @JoinTable(
            name = "tacgia_sach",
            joinColumns = @JoinColumn(name = "tacgia_id"),
            inverseJoinColumns = @JoinColumn(name = "sach_id"))
    private List<Sach> saches;
}

