package com.nhom12.website_ban_sach.controller;

import com.nhom12.website_ban_sach.dto.dto_entity.TaiKhoanDTO;
import com.nhom12.website_ban_sach.dto.request.LoginRequest;
import com.nhom12.website_ban_sach.entity.TaiKhoan;
import com.nhom12.website_ban_sach.service.TaiKhoanService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/auth")
public class TaiKhoanController {
    @Autowired
    private TaiKhoanService taiKhoanService;

    @PostMapping("/register")
    public TaiKhoan register(@RequestBody TaiKhoan taiKhoan){
        return taiKhoanService.register(taiKhoan);
    }

    @PostMapping("/login")
    public ResponseEntity<?> login(@RequestBody LoginRequest loginRequest){
        TaiKhoanDTO account = taiKhoanService.login(loginRequest);
        if(account != null) return ResponseEntity.ok(account);
        else return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Login fail");
    }

    @GetMapping("/getalltaikhoan")
    public List<TaiKhoanDTO> getAllTaiKhoan(){
        return taiKhoanService.getAllTaiKhoan();
    }
}
