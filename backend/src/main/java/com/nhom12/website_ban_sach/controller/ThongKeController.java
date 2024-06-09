package com.nhom12.website_ban_sach.controller;

import com.nhom12.website_ban_sach.service.DonHangService;
import com.nhom12.website_ban_sach.service.SachService;
import com.nhom12.website_ban_sach.service.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/thongke")
public class ThongKeController {
    @Autowired
    private TaiKhoanService taiKhoanService;
    @Autowired
    private SachService sachService;
    @Autowired
    private DonHangService donHangService;

    @GetMapping("/gettotalsach")
    public long getTotalSach(){
        return sachService.getTotalSach();
    }

    @GetMapping("/gettotaldonhang")
    public long getTotalDonHang(){
        return donHangService.getTotalDonHang();
    }

    @GetMapping("/gettotaltaikhoan")
    public long getTotalTaiKhoan(){
        return taiKhoanService.getTotalTaiKhoan();
    }

    @GetMapping("/gettotaltongtien")
    public Long getTotalTongTien() {
        return donHangService.getTotalTongTien();
    }
}
