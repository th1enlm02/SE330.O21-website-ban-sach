package com.nhom12.website_ban_sach.controller;

import com.nhom12.website_ban_sach.dto.dto_entity.SachDTO;
import com.nhom12.website_ban_sach.dto.request.CreateSachRequest;
import com.nhom12.website_ban_sach.dto.request.SachUpdateReq;
import com.nhom12.website_ban_sach.dto.response.SachPhanTrang;
import com.nhom12.website_ban_sach.service.SachService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/sach")
public class SachController {
    @Autowired
    private SachService sachService;

    @GetMapping("/getallsach")
    public ResponseEntity<List<SachDTO>> getAllSachs(){
        List<SachDTO> sachs = sachService.getAllSachs();
        return ResponseEntity.ok(sachs);
    }

    @PostMapping("/saveone")
    public SachDTO createsach(@RequestBody CreateSachRequest createSachRequest){
        SachDTO sach = sachService.save(createSachRequest.getSachDTO(), createSachRequest.getDanhMucId(), createSachRequest.getTacGiaIds());
        return sach;
    }

    @PutMapping("/update/{id}")
    public SachDTO updateSach(@PathVariable("id") Long id, @RequestBody SachUpdateReq sachUpdateDto){
        return sachService.updateSach(id, sachUpdateDto);
    }

    @GetMapping("/getbydanhmuc/{id}")
    public List<SachDTO> getByDanhMuc(@PathVariable("id") Long id){
        return sachService.getByDanhMuc(id);
    }

    @GetMapping("/getbydanhmucphantrang/{id}/{page}")
    public SachPhanTrang getByDanhMucPhanTrang(@PathVariable("id") Long id, @PathVariable("page") Integer page){
        return sachService.getSachByDanhMucPhanTrang(id, page);
    }

    @DeleteMapping("/delete/{id}")
    public void deleteSach(@PathVariable("id") Long id){
        sachService.deleteSach(id);
        return;
    }

    @GetMapping("/getsachphantrang/{page}")
    public SachPhanTrang getSachPhanTrang(@PathVariable("page") Integer page){
        return sachService.getSachTheoPhanTrang(page);
    }

    @GetMapping("/getsachmoi")
    public List<SachDTO> getSachMoi(){
        return sachService.getSachMoi();
    }

    @GetMapping("/loctheogia/{min}-{max}/{id}")
    public List<SachDTO> locTheoGia(@PathVariable("min") Integer min, @PathVariable("max") Integer max, @PathVariable("id") Long id){
        return sachService.locTheoGia(min, max, id);
    }

    @GetMapping("/getsachbyid/{id}")
    public SachDTO getSachById(@PathVariable("id") Long id){
        return sachService.getSachById(id);
    }

    @GetMapping("/getsachbytacgia/{id}")
    public List<SachDTO> getSachByTacGia(@PathVariable("id") Long id){
        return sachService.getSachByTacGia(id);
    }

    @GetMapping("/timsachtheotieude/{tieude}")
    public List<SachDTO> timSachTheoTieuDe(@PathVariable("tieude") String tieuDe){
        return sachService.timSachTheoTieuDe(tieuDe);
    }

}
