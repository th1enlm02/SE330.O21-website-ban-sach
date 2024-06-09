package com.nhom12.website_ban_sach.dto.dto_entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
public class FeedbackDTO {
    private Long id;
    private TaiKhoanDTO taiKhoan;
    private SachDTO sach;
    private String noiDung;
    private Integer soSao;
    private Date ngayFeedback;
}
