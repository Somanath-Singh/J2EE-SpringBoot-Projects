package com.smart.entity;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "USER")
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@NotBlank(message = "Name field must be required ! ! ")
	@Size(min = 2, max = 20, message = "min 2 and max 20 characters are allowed ! ! ")
	private String name;
	
	@NotBlank(message = "Qualification must be required ! ! ")
	private String qualification;
	
	@NotBlank(message = "Email field must be required ! ! ")
	private String email;
	
	@Column(length = 300)
	@NotNull
	@Size(min = 8, max = 200)
	private String password;
	
	@NotBlank(message = "Please Specify your gender ! ! ")
	private String gender;
	
	@NotBlank(message = "Address field must be required ! ! ")
	private String address;
	
	private String role;
	

}
