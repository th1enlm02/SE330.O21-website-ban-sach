package com.nhom12.website_ban_sach.mapper;

import com.nhom12.website_ban_sach.dto.dto_entity.FeedbackDTO;
import com.nhom12.website_ban_sach.entity.Feedback;

public class FeedbackMapper {
    public static Feedback mapToFeedback(FeedbackDTO fbDTO){
        return new Feedback(
                fbDTO.getId(),
                TaiKhoanMapper.mapToTaiKhoan(fbDTO.getTaiKhoan()),
                SachMapper.mapToSach(fbDTO.getSach()),
                fbDTO.getNoiDung(),
                fbDTO.getSoSao(),
                fbDTO.getNgayFeedback());
    }

    public static FeedbackDTO mapToFeedbackDTO(Feedback fb){
        return new FeedbackDTO(
                fb.getId(),
                TaiKhoanMapper.mapToTaiKhoanDTO(fb.getTaiKhoan()),
                SachMapper.mapToSachDTO(fb.getSach()),
                fb.getNoiDung(),
                fb.getSoSao(),
                fb.getNgayFeedback()
        );
    }
}
