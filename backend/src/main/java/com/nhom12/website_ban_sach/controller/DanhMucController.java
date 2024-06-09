package com.nhom12.website_ban_sach.controller;

import com.nhom12.website_ban_sach.dto.dto_entity.DanhMucDTO;
import com.nhom12.website_ban_sach.mapper.DanhMucMapper;
import com.nhom12.website_ban_sach.service.DanhMucService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/danhmuc")
public class DanhMucController {
    @Autowired
    private DanhMucService danhMucService;

    @PostMapping("/createdanhmuc")
    public DanhMucDTO createDanhMuc(@RequestBody DanhMucDTO danhMucDTO){
        return danhMucService.createDanhMuc(danhMucDTO.getTenDanhMuc());
    }

    @GetMapping("/getalldanhmuc")
    public List<DanhMucDTO> getAllDanhMuc(){
        return danhMucService.getAllDanhMuc();
    }

    @GetMapping("/getdanhmucbyid/{id}")
    public DanhMucDTO getDanhMucById(@PathVariable("id") Long id){
        return DanhMucMapper.mapToDanhMucDTO(danhMucService.getDanhMucById(id).get());
    }

    @PutMapping("/update/{id}")
    public DanhMucDTO updateDanhMuc(@PathVariable("id") Long id, @RequestBody DanhMucDTO danhMucDTO){
        return danhMucService.updateDanhMuc(id, danhMucDTO);
    }
}
