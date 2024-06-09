package com.nhom12.website_ban_sach.dto.request;

import com.nhom12.website_ban_sach.dto.dto_entity.DanhMucDTO;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Getter
@Setter
@AllArgsConstructor
public class SachUpdateReq {
    private Long id;
    private String tieuDe;
    private BigDecimal gia;
    private Integer soLuong;
    private String photoURL;
    private String moTa;
    private LocalDateTime ngayTao;
    private DanhMucDTO danhMuc;
    private Long tacGiaId;
}

