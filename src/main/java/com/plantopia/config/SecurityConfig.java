package com.plantopia.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

import com.plantopia.service.UserDetailsServiceImpl;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true)
public class SecurityConfig {

    @Autowired
    private UserDetailsServiceImpl userDetailsService;
    private final CustomAccessDeniedHandler accessDeniedHandler;
    
    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();  // 암호화 알고리즘
    }

    @Bean
    public AuthenticationManager authenticationManager(
        AuthenticationConfiguration configuration) throws Exception {
        return configuration.getAuthenticationManager();
    }
    
    public SecurityConfig(CustomAccessDeniedHandler accessDeniedHandler) {
        this.accessDeniedHandler = accessDeniedHandler;
    }

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
        http
            .csrf().disable()
            .authorizeHttpRequests()
            	// 관리자 전용 페이지, 스토어 게시판 제품 추가, 수정, 삭제 가능
                .requestMatchers("/accountList", "/addStore", "/StoreUpdate",
                        "/StoreDelete", "/addNotice", "/addNoticeProcess", "/updateNotice",
                        "/updateNoticeProcess", "/deleteNotice").hasRole("admin")
                // 로그인·회원가입·프로필·로그아웃는 모두 허용
                .requestMatchers("/", "/login", "/loginProc", "/logout",
                        "/accountForm", "/accountWrite",
                        "/profile", "/profile/**",
                        "/StoreMain", "/StoreDetail", "/StoreSearch",
                        "/getCartList", "/addCart", "/CartUpdate", "/CartDelete",
                        "/Plant/plantList", "/Plant/plantDetail").permitAll()
                
                // - 로그인한 user 또는 admin이 가능한 동작—
                .requestMatchers("/Plant/plantWrite", "/plantWriteProc",
                        "/Plant/plantList/comment").hasAnyRole("user","admin")
                
                //  수정/삭제 URL 자체는 인증된 user/admin
                //     실제 권한(본인 or admin) 검사는 컨트롤러에서 수행
                .requestMatchers(
                    "/Plant/plantUpdate", "/Plant/plantUpdateProc",
                    "/Plant/plantdelete",
                    "/Plant/plantList/comment/update", "/Plant/plantList/comment/updateProc",
                    "/Plant/plantList/comment/delete"
                ).hasAnyRole("user","admin")
                
                // 수정/삭제는 로그인만 하면 라우팅은 열어두고, 실제 권한은 컨트롤러에서 소유자 검사
                .requestMatchers("/Plant/plantUpdate", "/Plant/plantDelete")
                  .hasAnyRole("user","admin")
                
                // 나머지는 인증만 필요(user 권한)
                .anyRequest().permitAll()
            .and()
            .exceptionHandling(ex -> ex.accessDeniedHandler(accessDeniedHandler))
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
