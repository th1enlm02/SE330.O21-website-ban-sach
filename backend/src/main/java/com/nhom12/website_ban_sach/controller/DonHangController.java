package com.nhom12.website_ban_sach.controller;

import com.nhom12.website_ban_sach.dto.dto_entity.DonHangDTO;
import com.nhom12.website_ban_sach.dto.request.CreateDonHangRequest;
import com.nhom12.website_ban_sach.service.DonHangService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/donhang")
public class DonHangController {
    @Autowired
    private DonHangService donHangService;

    @PostMapping("/createdonhang")
    public DonHangDTO taoDonHang(@RequestBody CreateDonHangRequest createDonHangRequest) {
        return donHangService.taoDonHang(createDonHangRequest);
    }

    @GetMapping("/getalldonhang")
    public List<DonHangDTO> getTatCaDonHang(){
        return donHangService.getAllDonHang();
    }

    @GetMapping("/getalldonhang/{id}")
    public List<DonHangDTO> getAllDonHangByAccountId(@PathVariable("id") Long id) {
        return donHangService.getAllDonHangByAccountId(id);
    }

    @GetMapping("/getthongtindonhang/{id}")
    public DonHangDTO getThongTinDonHang(@PathVariable("id") Long id){
        return donHangService.getThongTinDonHang(id);
    }
}
