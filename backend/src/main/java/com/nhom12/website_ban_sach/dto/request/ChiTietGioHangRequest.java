package com.nhom12.website_ban_sach.dto.request;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChiTietGioHangRequest {
    private Long id;
    private Long taiKhoanId;
    private Long sachId;
    private Integer soLuong;
}
