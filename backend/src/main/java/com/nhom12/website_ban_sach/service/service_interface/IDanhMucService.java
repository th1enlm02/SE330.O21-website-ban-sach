package com.nhom12.website_ban_sach.service.service_interface;

import com.nhom12.website_ban_sach.dto.dto_entity.DanhMucDTO;
import com.nhom12.website_ban_sach.entity.DanhMuc;

import java.util.List;
import java.util.Optional;

public interface IDanhMucService {
    public Optional<DanhMuc> getDanhMucById(Long id);
    public DanhMucDTO createDanhMuc(String tenDanhMuc);
    public List<DanhMucDTO> getAllDanhMuc();
    public DanhMucDTO updateDanhMuc(Long id, DanhMucDTO danhMucDTO);
}
