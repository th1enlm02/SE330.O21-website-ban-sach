package com.nhom12.website_ban_sach.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
public class AddToCartRequest {
    private Long taiKhoanId;
    private Long sachId;
    private Integer soLuong;
}
