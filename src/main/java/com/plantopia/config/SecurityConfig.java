package com.plantopia.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.plantopia.service.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private UserDetailsServiceImpl userDetailsService;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();  // 암호화 알고리즘
    }

    @Bean
    public AuthenticationManager authenticationManager(
        AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf().disable()
            .authorizeHttpRequests()
            	// 관리자 전용 페이지, 스토어 게시판 제품 추가, 수정, 삭제 가능
                .requestMatchers("/accountList", "/addStore", "/StoreUpdate",
                        "/StoreDelete").hasRole("admin")
                // 로그인·회원가입·프로필·로그아웃는 모두 허용
                .requestMatchers("/", "/login", "/loginProc", "/logout",
                        "/accountForm", "/accountWrite",
                        "/profile", "/profile/**", "/StoreMain", "/StoreDetail", "/StoreSearch").permitAll()
                // 나머지는 인증만 필요(user 권한)
                .anyRequest().permitAll()
            .and()
            .formLogin()
                .loginPage("/login")  // 사용자 정의 로그인 페이지
                .loginProcessingUrl("/loginProc")  // form action
                .failureUrl("/login?error") // 로그인 실패 시 /login?error 로 리다이렉트
                .defaultSuccessUrl("/loginTest", true)  // 로그인 성공 시
                .permitAll()
            .and()
            .logout(logout -> logout
                    // 로그아웃 URL을 /logout으로 설정
                    .logoutUrl("/logout")
                    // 로그아웃 성공 시 바로 /login으로 리다이렉트
                    .logoutSuccessUrl("/login")
                    .permitAll()
            	);
        return http.build();
    }
}
