package com.nhom12.website_ban_sach.mapper;

import com.nhom12.website_ban_sach.dto.dto_entity.SachDTO;
import com.nhom12.website_ban_sach.entity.Sach;

public class SachMapper {
    public static SachDTO mapToSachDTO(Sach b) {
        return new SachDTO(
                b.getId(),
                b.getTieuDe(),
                b.getGia(),
                b.getSoLuong(),
                b.getPhotoURL(),
                b.getMoTa(),
                b.getNgayTao(),
                DanhMucMapper.mapToDanhMucDTO(b.getDanhMuc()),
                TacGiaMapper.mapToTacGiaDTO(b.getTacGias().get(0))
        );
    }

    public static Sach mapToSach(SachDTO b) {
        return new Sach(b.getTieuDe(), b.getGia(), b.getSoLuong(), b.getPhotoURL(), b.getMoTa(), b.getNgayTao());
    }
}
