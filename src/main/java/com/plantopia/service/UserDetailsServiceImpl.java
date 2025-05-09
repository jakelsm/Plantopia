package com.plantopia.service;

import com.plantopia.dao.IUserDao;
import com.plantopia.dto.CustomUserDetails;
import com.plantopia.dto.UserDto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.*;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private IUserDao iuserdao;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserDto user = iuserdao.findByUserId(username);

        if (user == null) {
            throw new UsernameNotFoundException("User not found: " + username);
        }

        return new CustomUserDetails(user);
    }
}

