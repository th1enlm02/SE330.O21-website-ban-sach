package com.nhom12.website_ban_sach.dto.response;

import com.nhom12.website_ban_sach.dto.dto_entity.DanhMucDTO;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
public class DoanhThuTheoThang {
    DanhMucDTO danhMuc;
    public BigDecimal[] soLuongSach = new BigDecimal[12];
    public DoanhThuTheoThang(DanhMucDTO dm){
        danhMuc = dm;
        for(int i = 0; i < 12; i++){
            soLuongSach[i] = BigDecimal.valueOf(0);
        }
    }
}
