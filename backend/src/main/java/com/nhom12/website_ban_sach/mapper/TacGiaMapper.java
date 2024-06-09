package com.nhom12.website_ban_sach.mapper;

import com.nhom12.website_ban_sach.dto.dto_entity.TacGiaDTO;
import com.nhom12.website_ban_sach.entity.TacGia;

public class TacGiaMapper {
    public static TacGiaDTO mapToTacGiaDTO(TacGia tacGia){
        return new TacGiaDTO(tacGia.getId(), tacGia.getTenTacGia(), tacGia.getImage());
    }

    public static TacGia mapToTacGia(TacGiaDTO tacGiaDTO){
        return new TacGia(tacGiaDTO.getId(), tacGiaDTO.getTenTacGia(), tacGiaDTO.getImage(), null);
    }
}
