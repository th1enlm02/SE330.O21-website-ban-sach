package com.nhom12.website_ban_sach.service.service_interface;

import com.nhom12.website_ban_sach.dto.dto_entity.ChiTietTacGiaDTO;
import com.nhom12.website_ban_sach.dto.dto_entity.TacGiaDTO;
import com.nhom12.website_ban_sach.entity.TacGia;

import java.util.List;
import java.util.Optional;

public interface ITacGiaService {
    public List<Optional<TacGia>> getAuthorByIds(List<Long> ids);
    public TacGiaDTO saveTacGia(TacGiaDTO tg);
    public List<TacGiaDTO> getAllTacGia();
    ChiTietTacGiaDTO getTacGia(Long id);
    public TacGiaDTO updateTacGia(Long id, TacGiaDTO tacGiaDTO);
}
