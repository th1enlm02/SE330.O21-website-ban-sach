package com.nhom12.website_ban_sach.dto.request;

import com.nhom12.website_ban_sach.dto.dto_entity.SachDTO;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class CreateSachRequest {
    SachDTO sachDTO;
    Long danhMucId;
    List<Long> tacGiaIds;
}
