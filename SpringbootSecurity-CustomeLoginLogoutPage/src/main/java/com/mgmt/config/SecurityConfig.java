package com.mgmt.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class SecurityConfig {
	
	/*
	 * @Autowired
	 * public CustomeAuthSuccessHandler successHandler;
	 */
	
	@Autowired
	private CustomeFailureHandler failureHandler;
	
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		
		return new BCryptPasswordEncoder();
		
	}
	
	@Bean
	public UserDetailsService  userDetailsService() {
		
		return new CustomeUserDetailsService();
		
	}
	
	@Bean
	public AuthenticationSuccessHandler authenticationSuccessHandler() {
		 return new CustomeAuthSuccessHandler();
	}
	
	@Bean
	public DaoAuthenticationProvider authenticationProvider() {
		
		DaoAuthenticationProvider authenticationProvider = new DaoAuthenticationProvider();
		authenticationProvider.setUserDetailsService(userDetailsService());
		authenticationProvider.setPasswordEncoder(passwordEncoder());
		
		return authenticationProvider;
		
	}
	
	
	@Bean
	public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {

        //springboot security provided login page
        /*
         * http.csrf(csrf -> csrf.disable()) .authorizeHttpRequests(request ->
         * request.requestMatchers("/").permitAll().anyRequest().authenticated())
         * .formLogin(withDefaults());
         */
        
        //custome login pag e
         /*http.csrf(csrf -> csrf.disable())
         
        // .authorizeHttpRequests(request -> request.requestMatchers("/").permitAll() ) //= allow to access without authentication
         
        // .authorizeHttpRequests(request -> request.requestMatchers("/user/**").authenticated() ) //afetr user url whatever url page come it will be authenticated
                 
         .authorizeHttpRequests(request -> request.requestMatchers("/") 
                 .permitAll().anyRequest().authenticated()) //only access index page to access other than this page it will automaticali redirect to login page
         
         .formLogin(login -> login.loginPage("/login")//showing custome login page url
                 .loginProcessingUrl("/formlogin") //login form submit /action url
                 .defaultSuccessUrl("/user/home").permitAll()//afetr login success this page shown
                 //.failureUrl("/invalid")    //if any error occured in form page this pahe will redirect
                 .permitAll());
                 
                 */
        
			
			  http.csrf(csrf -> csrf.disable()) .authorizeHttpRequests(request ->
			  request.requestMatchers("/user/**").hasRole("USER")
			  .requestMatchers("/admin/**").hasRole("ADMIN")
			  .requestMatchers("/**").permitAll()) .formLogin(login ->
			  login.loginPage("/login") .loginProcessingUrl("/formlogin")
			  .failureHandler(failureHandler) //cfgs the CustomeFailureHandler class
			  .successHandler(authenticationSuccessHandler()) ) //we can use CustomeAuthSuccessHandler by creating bean or by @Autowired
			  
			  .logout(logout -> logout.permitAll());
			 
		
		
			/*
			 * http.csrf(csrf -> csrf.disable()) .authorizeHttpRequests(request ->
			 * request.requestMatchers("/user/**").hasRole("USER")
			 * .requestMatchers("/admin/**").hasRole("ADMIN")
			 * .requestMatchers("/**").permitAll()) .formLogin(login ->
			 * login.loginPage("/login") .loginProcessingUrl("/formlogin")
			 * .successHandler(successHandler) ) //we can use CustomeAuthSuccessHandler by
			 * creating bean or by @Autowired
			 * 
			 * .logout(logout -> logout.permitAll());
			 */
		
		
		return http.build();
		
	}


}
