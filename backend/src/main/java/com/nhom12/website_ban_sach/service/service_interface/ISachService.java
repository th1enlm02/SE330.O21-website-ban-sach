package com.nhom12.website_ban_sach.service.service_interface;

import com.nhom12.website_ban_sach.dto.dto_entity.SachDTO;
import com.nhom12.website_ban_sach.dto.request.SachUpdateReq;
import com.nhom12.website_ban_sach.dto.response.SachPhanTrang;

import java.util.List;

public interface ISachService {
    public List<SachDTO> getAllSachs();
    public SachDTO save(SachDTO sachDTO, Long danhMucId, List<Long> authorIds);
    public List<SachDTO> getByDanhMuc(Long id);
    public SachPhanTrang getSachByDanhMucPhanTrang(Long dmid, Integer page);
    public SachDTO updateSach(Long id, SachUpdateReq sachDTO);
    public void deleteSach(Long id);
    SachDTO getSachById(Long id);
    public SachPhanTrang getSachTheoPhanTrang(Integer page);
    public List<SachDTO> getSachMoi();
    public List<SachDTO> locTheoGia(Integer min, Integer max, Long id);
    public long getTotalSach();
    public List<SachDTO> getSachByTacGia(Long id);
    public List<SachDTO> timSachTheoTieuDe(String tieuDe);
}
