package com.nhom12.website_ban_sach.repository;

import com.nhom12.website_ban_sach.entity.ChiTietGioHang;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;

public interface GioHangRepository extends JpaRepository<ChiTietGioHang, Long> {
    Optional<ChiTietGioHang> findByTaiKhoanIdAndSachId(Long taiKhoanId, Long sachId);
}
