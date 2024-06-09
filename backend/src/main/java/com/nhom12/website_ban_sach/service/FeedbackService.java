package com.nhom12.website_ban_sach.service;

import com.nhom12.website_ban_sach.repository.FeedbackRepository;
import com.nhom12.website_ban_sach.repository.SachRepository;
import com.nhom12.website_ban_sach.repository.TaiKhoanRepository;
import com.nhom12.website_ban_sach.dto.dto_entity.FeedbackDTO;
import com.nhom12.website_ban_sach.dto.request.CreateFeedbackReq;
import com.nhom12.website_ban_sach.dto.response.FeedbackResponse;
import com.nhom12.website_ban_sach.entity.Feedback;
import com.nhom12.website_ban_sach.mapper.FeedbackMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class FeedbackService {
    @Autowired
    private FeedbackRepository feedbackRepository;
    @Autowired
    private TaiKhoanRepository taiKhoanRepository;
    @Autowired
    private SachRepository sachRepository;

    public FeedbackDTO taoFeedback(CreateFeedbackReq fbDTO, Long userId, Long sachId) {
        Feedback fb = new Feedback();
        fb.setNoiDung(fbDTO.getNoiDung());
        fb.setSoSao(fbDTO.getSoSao());
        fb.setSach(sachRepository.findById(sachId).get());
        fb.setTaiKhoan(taiKhoanRepository.findById(userId).get());
        fb.setNgayFeedback(Timestamp.valueOf(LocalDateTime.now()));
        return FeedbackMapper.mapToFeedbackDTO(feedbackRepository.save(fb));
    }

    public List<FeedbackResponse> getAllFeedbackBySach(Long id){
        List<FeedbackResponse> res = new ArrayList<>();
        List<Feedback> dsFb = feedbackRepository.findAllBySachId(id);
        for(Feedback fb: dsFb){
            res.add(new FeedbackResponse(fb.getId(), fb.getTaiKhoan().getUsername(),
                    fb.getSach().getId(), fb.getNoiDung(),
                    fb.getSoSao(),
                    fb.getNgayFeedback()));
        }
        return res;
    }

    public List<FeedbackResponse> getAllFeedback() {
        List<FeedbackResponse> res = new ArrayList<>();
        List<Feedback> dsFb = feedbackRepository.findAll();
        for(Feedback fb: dsFb){
            res.add(new FeedbackResponse(fb.getId(), fb.getTaiKhoan().getUsername(),
                    fb.getSach().getId(), fb.getNoiDung(),
                    fb.getSoSao(),
                    fb.getNgayFeedback()));
        }
        return res;
    }
}