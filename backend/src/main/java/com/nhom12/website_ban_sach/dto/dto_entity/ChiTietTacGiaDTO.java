package com.nhom12.website_ban_sach.dto.dto_entity;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@AllArgsConstructor
public class ChiTietTacGiaDTO {
    private Long id;
    private String tenTacGia;
    private String image;

    private List<SachDTO> sachDTOList;
}
