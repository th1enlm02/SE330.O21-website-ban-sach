package com.nhom12.website_ban_sach.controller;

import com.nhom12.website_ban_sach.dto.response.DoanhThuTheoThang;
import com.nhom12.website_ban_sach.dto.response.DoanhThuTheoTuan;
import com.nhom12.website_ban_sach.service.DashBoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/dashboard")
public class DashBoardController {

    @Autowired
    private DashBoardService dashBoardService;
    @GetMapping("/doanh_thu_theo_thang")
    public List<DoanhThuTheoThang> getDoanhThu(){
        return dashBoardService.getSoSachBanTheoDanhMuc();
    }

    @GetMapping("/doanh_thu_tuan_ht")
    public List<DoanhThuTheoTuan> getDoanhThuTuanHienTai(){
        return dashBoardService.getDoanhThuTuanHienTai();
    }

    @GetMapping("/doanh_thu_tuan_truoc")
    public List<DoanhThuTheoTuan> getDoanhThuTuanTruoc(){
        return dashBoardService.getDoanhThuTuanTruoc();
    }
}
