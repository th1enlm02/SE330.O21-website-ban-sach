package com.nhom12.website_ban_sach.dto.dto_entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
public class ChiTietDonHangDTO {
    private Long id;
//    private DonHangDTO donHangDTO;
    private Long donHangId;
    private SachDTO sach;
    private Integer soLuong;
    private BigDecimal gia;
}
