package com.nhom12.website_ban_sach.entity;

import jakarta.persistence.*;
import lombok.*;

import java.util.Date;

@Data
@Entity
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "Feedback")
public class Feedback {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "TaiKhoanId")
    private TaiKhoan taiKhoan;

    @ManyToOne
    @JoinColumn(name = "SachId")
    private Sach sach;

    private String noiDung;
    private Integer soSao;
    private Date ngayFeedback;
}

