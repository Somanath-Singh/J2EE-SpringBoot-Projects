package com.security.config;

import static org.springframework.security.config.Customizer.withDefaults;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.provisioning.InMemoryUserDetailsManager;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true)
public class SecurityConfig {
	
	//inmemory authorize and authentication
	@Bean
	public UserDetailsService userDetailsService() {
		
		UserDetails user = User.withUsername("user").password(passwordEncoder().encode("1234")).roles("USER").build();
		
		UserDetails admin = User.withUsername("admin").password(passwordEncoder().encode("1234")).roles("ADMIN").build();
		
		return new InMemoryUserDetailsManager(user , admin);
		
	}
	
	@Bean
	public PasswordEncoder passwordEncoder() {
		
		return new BCryptPasswordEncoder();
		
	}
	
	@Bean
	public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        http.csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(requests -> requests
                        .anyRequest()
                        .authenticated())
                .formLogin(withDefaults());
        
//        http.csrf(csrf -> csrf.disable())
//                .authorizeHttpRequests(requests -> requests
//                        .anyRequest()
//                        .authenticated())
//                .httpBasic(withDefaults());
		
		return http.build();
		
	}

}
