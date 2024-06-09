package com.nhom12.website_ban_sach.dto.response;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter
@Setter
@AllArgsConstructor
public class FeedbackResponse {
    private Long id;
    private String tenTaiKhoan;
    private Long sachId;
    private String noiDung;
    private Integer soSao;
    private Date ngayFeedback;
}
