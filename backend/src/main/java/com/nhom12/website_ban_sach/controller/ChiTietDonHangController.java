package com.nhom12.website_ban_sach.controller;

import com.nhom12.website_ban_sach.dto.dto_entity.ChiTietDonHangDTO;
import com.nhom12.website_ban_sach.service.ChiTietDonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/chitietdonhang")
public class ChiTietDonHangController {
    @Autowired
    private ChiTietDonHangService chiTietDonHangService;

    @GetMapping("/getall/{id}")
    public List<ChiTietDonHangDTO> getAllChiTietDonHang(@PathVariable("id") Long id){
        return chiTietDonHangService.getAllChiTietDonHang(id);
    }
}
