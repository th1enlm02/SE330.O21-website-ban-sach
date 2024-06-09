package com.nhom12.website_ban_sach.dto.response;

import com.nhom12.website_ban_sach.dto.dto_entity.DanhMucDTO;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
public class DoanhThuTheoTuan {
    DanhMucDTO danhMuc;
    public BigDecimal[] doanhThu = new BigDecimal[7];
    public DoanhThuTheoTuan(DanhMucDTO dm){
        danhMuc = dm;
        for(int i = 0; i < 7; i++){
            doanhThu[i] = BigDecimal.valueOf(0);
        }
    }
}
