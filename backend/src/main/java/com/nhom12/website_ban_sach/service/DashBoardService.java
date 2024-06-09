package com.nhom12.website_ban_sach.service;

import com.nhom12.website_ban_sach.repository.DonHangRepository;
import com.nhom12.website_ban_sach.dto.dto_entity.ChiTietDonHangDTO;
import com.nhom12.website_ban_sach.dto.dto_entity.DanhMucDTO;
import com.nhom12.website_ban_sach.dto.response.DoanhThuTheoThang;
import com.nhom12.website_ban_sach.dto.response.DoanhThuTheoTuan;
import com.nhom12.website_ban_sach.entity.DonHang;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.temporal.WeekFields;
import java.util.ArrayList;
import java.util.List;

@Service
public class DashBoardService {
    @Autowired
    private ChiTietDonHangService chiTietDonHangService;

    @Autowired
    private DonHangRepository donHangRepository;
    @Autowired
    private DanhMucService danhMucService;

    public List<DoanhThuTheoThang> getSoSachBanTheoDanhMuc(){
        List<DoanhThuTheoThang> res = new ArrayList<>();
        List<DanhMucDTO> dsDanhMuc = danhMucService.getAllDanhMuc();
        for(DanhMucDTO dm: dsDanhMuc){
            DoanhThuTheoThang dttt = new DoanhThuTheoThang(dm);
            res.add(dttt);
        }
        List<DonHang> dsdh = donHangRepository.findAll();
        for(DonHang dh : dsdh) {
            if(dh.getNgayDatHang().getYear() != LocalDateTime.now().getYear()){
                continue;
            }

            List<ChiTietDonHangDTO> ds_ctdh = chiTietDonHangService.getAllChiTietDonHang(dh.getId());
            int thang = dh.getNgayDatHang().getMonth().getValue();
            for(ChiTietDonHangDTO ctdh: ds_ctdh){
                Long dmid = ctdh.getSach().getDanhMuc().getId();
                for(DoanhThuTheoThang dttt : res){
                    if(dttt.getDanhMuc().getId() == dmid){
                        dttt.soLuongSach[thang-1] = dttt.soLuongSach[thang-1].add(BigDecimal.valueOf(ctdh.getSoLuong()));
                        break;
                    }
                }
            }
        }
        return res;
    }

    public List<DoanhThuTheoTuan> getDoanhThuTuanHienTai(){
        List<DoanhThuTheoTuan> res = new ArrayList<>();
        List<DanhMucDTO> dsDanhMuc = danhMucService.getAllDanhMuc();
        for(DanhMucDTO dm: dsDanhMuc){
            DoanhThuTheoTuan dttt = new DoanhThuTheoTuan(dm);
            res.add(dttt);
        }
        List<DonHang> dsdh = donHangRepository.findAll();
        for(DonHang dh : dsdh) {
            if (isSameWeek(dh.getNgayDatHang())) {
                int ngayTrongTuan = dh.getNgayDatHang().getDayOfWeek().getValue() - 1;
                List<ChiTietDonHangDTO> ds_ctdh = chiTietDonHangService.getAllChiTietDonHang(dh.getId());
                for(ChiTietDonHangDTO ctdh: ds_ctdh){
                    Long dmid = ctdh.getSach().getDanhMuc().getId();
                    for(DoanhThuTheoTuan dttt : res){
                        if(dttt.getDanhMuc().getId() == dmid){
                            dttt.doanhThu[ngayTrongTuan] = dttt.doanhThu[ngayTrongTuan].add(ctdh.getGia());
                            break;
                        }
                    }
                }
            }
        }
        return res;
    }

    public List<DoanhThuTheoTuan> getDoanhThuTuanTruoc(){
        List<DoanhThuTheoTuan> res = new ArrayList<>();
        List<DanhMucDTO> dsDanhMuc = danhMucService.getAllDanhMuc();
        for(DanhMucDTO dm: dsDanhMuc){
            DoanhThuTheoTuan dttt = new DoanhThuTheoTuan(dm);
            res.add(dttt);
        }
        List<DonHang> dsdh = donHangRepository.findAll();
        for(DonHang dh : dsdh) {
            if (isPreviousWeek(dh.getNgayDatHang())) {
                int ngayTrongTuan = dh.getNgayDatHang().getDayOfWeek().getValue() - 1;
                List<ChiTietDonHangDTO> ds_ctdh = chiTietDonHangService.getAllChiTietDonHang(dh.getId());
                for(ChiTietDonHangDTO ctdh: ds_ctdh){
                    Long dmid = ctdh.getSach().getDanhMuc().getId();
                    for(DoanhThuTheoTuan dttt : res){
                        if(dttt.getDanhMuc().getId() == dmid){
                            dttt.doanhThu[ngayTrongTuan] = dttt.doanhThu[ngayTrongTuan].add(ctdh.getGia());
                            break;
                        }

                    }
                }
            }
        }
        return res;
    }

    public static boolean isSameWeek(LocalDateTime dateToCheck) {
        LocalDate currentDate = LocalDate.now();
        LocalDate targetDate = dateToCheck.toLocalDate();

        WeekFields weekFields = WeekFields.of(DayOfWeek.MONDAY, 4);
        int currentWeek = currentDate.get(weekFields.weekOfWeekBasedYear());
        int currentYear = currentDate.get(weekFields.weekBasedYear());
        int targetWeek = targetDate.get(weekFields.weekOfWeekBasedYear());
        int targetYear = targetDate.get(weekFields.weekBasedYear());

        return currentWeek == targetWeek && currentYear == targetYear;
    }
    public static boolean isPreviousWeek(LocalDateTime dateToCheck) {
        LocalDate currentDate = LocalDate.now();
        LocalDate targetDate = dateToCheck.toLocalDate();

        WeekFields weekFields = WeekFields.of(DayOfWeek.MONDAY, 4);

        int currentWeek = currentDate.get(weekFields.weekOfWeekBasedYear());
        int currentYear = currentDate.get(weekFields.weekBasedYear());

        int targetWeek = targetDate.get(weekFields.weekOfWeekBasedYear());
        int targetYear = targetDate.get(weekFields.weekBasedYear());
        if (currentWeek == 1) {
            return (targetYear == currentYear - 1) && (targetWeek == targetDate.with(weekFields.weekOfWeekBasedYear(), 1).minusWeeks(1).get(weekFields.weekOfWeekBasedYear()));
        } else {
            return (targetYear == currentYear) && (targetWeek == currentWeek - 1);
        }
    }

}
