package com.plantopia.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.plantopia.dao.IProfileDao;
import com.plantopia.dto.ProfileDto;

@Service
public class ProfileService {
    @Autowired
    private IProfileDao profileDao;

    public ProfileDto getByUserNum(int userNum) {
        return profileDao.selectProfileByUserNum(userNum);
    }
    
    // 회원가입 후 프로필 생성
    public void createProfile(int userNum) {
        profileDao.insertProfile(userNum);
    }
    
    // 이 사용자가 받은 평균 별점 조회
    public Double getAverageRatingByUserNum(int userNum) {
        return profileDao.selectAverageRatingByUserNum(userNum);
    }
}
