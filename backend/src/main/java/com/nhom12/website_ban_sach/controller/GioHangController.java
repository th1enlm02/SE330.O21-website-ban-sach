package com.nhom12.website_ban_sach.controller;

import com.nhom12.website_ban_sach.dto.dto_entity.ChiTietGioHangDTO;
import com.nhom12.website_ban_sach.dto.request.AddToCartRequest;
import com.nhom12.website_ban_sach.dto.request.ChiTietGioHangRequest;
import com.nhom12.website_ban_sach.service.GioHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/cart")
public class GioHangController {
    @Autowired
    private GioHangService gioHangService;

    @GetMapping("/getgiohang/{id}")
    public List<ChiTietGioHangDTO> GetAllGioHang(@PathVariable("id") Long id){
        return gioHangService.getAllGioHang(id);
    }

    @PostMapping("/addtocart")
    public ChiTietGioHangDTO AddToCart(@RequestBody AddToCartRequest request){
        ChiTietGioHangDTO chiTietGioHangDTO = gioHangService.addToCart(request);
        return chiTietGioHangDTO;
    }

    @PutMapping("/update/{id}")
    public ChiTietGioHangDTO CapNhatGioHang(
            @PathVariable("id") Long id,
            @RequestBody ChiTietGioHangRequest chiTietGioHangRequest
    ){
        return gioHangService.updateGioHang(id, chiTietGioHangRequest);
    }

    @PostMapping("/delete/{id}")
    public void xoaCTGH(@PathVariable("id") Long id){
        gioHangService.deleteChiTietGioHang(id);
    }
}
