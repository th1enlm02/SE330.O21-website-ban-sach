package com.nhom12.website_ban_sach.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class CreateFeedbackReq {
    private String noiDung;
    private Integer soSao;
}
