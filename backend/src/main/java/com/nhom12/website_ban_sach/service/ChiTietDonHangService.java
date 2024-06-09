package com.nhom12.website_ban_sach.service;

import com.nhom12.website_ban_sach.repository.ChiTietDonHangRepository;
import com.nhom12.website_ban_sach.dto.dto_entity.ChiTietDonHangDTO;
import com.nhom12.website_ban_sach.entity.ChiTietDonHang;
import com.nhom12.website_ban_sach.mapper.ChiTietDonHangMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ChiTietDonHangService {
    @Autowired
    private ChiTietDonHangRepository chiTietDonHangRepository;
    public List<ChiTietDonHangDTO> getAllChiTietDonHang(Long id) {
        List<ChiTietDonHangDTO> listDTO = new ArrayList<>();
        List<ChiTietDonHang> listDH = chiTietDonHangRepository.findAllByDonHangId(id);
        for(ChiTietDonHang dh:listDH){
            listDTO.add(ChiTietDonHangMapper.mapToChiTietDonHangDTO(dh));
        }
        return listDTO;
    }
}
