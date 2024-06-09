package com.nhom12.website_ban_sach.controller;

import com.nhom12.website_ban_sach.dto.dto_entity.ChiTietTacGiaDTO;
import com.nhom12.website_ban_sach.dto.dto_entity.TacGiaDTO;
import com.nhom12.website_ban_sach.service.TacGiaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/tacgia")
public class TacGiaController {
    @Autowired
    TacGiaService tacGiaService;

    @GetMapping("/getalltacgia")
    public ResponseEntity<List<TacGiaDTO>> getAllTacGia(){
        List<TacGiaDTO> tacGiaDTOList = tacGiaService.getAllTacGia();
        return ResponseEntity.ok(tacGiaDTOList);
    }

    @PostMapping("/createtacgia")
    public ResponseEntity<TacGiaDTO> createTacGia(@RequestBody TacGiaDTO tacGia){
        return ResponseEntity.ok(tacGiaService.saveTacGia(tacGia));
    }

    @GetMapping("/get10tacgia")
    public List<TacGiaDTO> get10TacGia(){
        return tacGiaService.get10TacGia();
    }

    @GetMapping("/getTacGia/{id}")
    public ChiTietTacGiaDTO getChiTietTacGia(@PathVariable("id") Long id){
        return tacGiaService.getTacGia(id);
    }

    @PutMapping("/update/{id}")
    public TacGiaDTO updateTacGia(@PathVariable("id") Long id, @RequestBody TacGiaDTO tacGiaDTO){
        return tacGiaService.updateTacGia(id, tacGiaDTO);
    }
}
