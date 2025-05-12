package com.plantopia.dto;

import java.util.Collection;
import java.util.Collections;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails extends UserDto implements UserDetails {

    public CustomUserDetails(UserDto dto) {
        super.setUser_num(dto.getUser_num());
        super.setUser_id(dto.getUser_id());
        super.setUser_passwd(dto.getUser_passwd());
        super.setUser_authority(dto.getUser_authority());
        super.setUser_nickname(dto.getUser_nickname()); // 닉네임 추가

    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return Collections.singleton(() -> "ROLE_" + getUser_authority());
    }

    @Override
    public String getPassword() {
        return getUser_passwd();
    }

    @Override
    public String getUsername() {
        return getUser_id();
    }

    @Override
    public boolean isAccountNonExpired() { return true; }

    @Override
    public boolean isAccountNonLocked() { return true; }

    @Override
    public boolean isCredentialsNonExpired() { return true; }

    @Override
    public boolean isEnabled() { return true; }
}