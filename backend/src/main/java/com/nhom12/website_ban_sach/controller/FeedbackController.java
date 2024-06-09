package com.nhom12.website_ban_sach.controller;

import com.nhom12.website_ban_sach.dto.dto_entity.FeedbackDTO;
import com.nhom12.website_ban_sach.dto.request.CreateFeedbackReq;
import com.nhom12.website_ban_sach.dto.response.FeedbackResponse;
import com.nhom12.website_ban_sach.service.FeedbackService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@CrossOrigin("*")
@RequestMapping("/api/feedback")
public class FeedbackController {
    @Autowired
    private FeedbackService feedbackService;

    @PostMapping("/taofeedback/{userid}/{sachid}")
    public FeedbackDTO taoFeedback(@RequestBody CreateFeedbackReq fb, @PathVariable("userid") Long userId, @PathVariable("sachid") Long sachId){
        return feedbackService.taoFeedback(fb, userId, sachId);
    }

    @GetMapping("/layfeedbacktheosach/{id}")
    public List<FeedbackResponse> layFeedbackTheoSach(@PathVariable("id") Long id){
        return feedbackService.getAllFeedbackBySach(id);
    }

    @GetMapping("/laytatcafeedback")
    public List<FeedbackResponse> layTatCaFeedback(){
        return feedbackService.getAllFeedback();
    }
}
