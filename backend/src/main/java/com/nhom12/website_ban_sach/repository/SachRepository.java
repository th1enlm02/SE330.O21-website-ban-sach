package com.nhom12.website_ban_sach.repository;

import com.nhom12.website_ban_sach.entity.Sach;
import org.springframework.data.domain.Page;
import org.springframework.data.jpa.repository.JpaRepository;

import org.springframework.data.domain.Pageable;
import java.util.List;

public interface SachRepository extends JpaRepository<Sach, Long> {
     public List<Sach> findAllByDanhMucId(Long id);
     public Page<Sach> findAllByDanhMucId(Long id, Pageable pageable);

     public List<Sach> findByTieuDeContaining(String tieuDe);
}
