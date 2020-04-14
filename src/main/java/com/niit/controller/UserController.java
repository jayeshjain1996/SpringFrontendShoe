package com.niit.controller;

import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.niit.model.User;
import com.niit.others.Email;
import com.niit.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController
{
	@Autowired
	UserService userService;
	
	User u;
 @RequestMapping("/login")
 public String login()
 {
	 return "login";
 }
 
 
 @RequestMapping("/register")
 public String register(ModelMap map)
 {
	 map.addAttribute("user",new User());
	 return "register";
 }
 
 @RequestMapping(value = {"/register"},method = RequestMethod.POST)
 public String register(@ModelAttribute("user") User u,ModelMap map)
 {
	 userService.addUser(u);
	 map.addAttribute("msg","User Registered Successfully");
	 //working here i think s is lowercase 
	 map.addAttribute("type","success");
	 map.addAttribute("pagename","/user/login");
	 return "popup";
 }
 
 @RequestMapping("/forgot")
 public String forgot(@RequestParam("username") String username,ModelMap map)
 {
	 u=userService.displayByUsername(username);
	 Random r=new Random();
	 int random=r.nextInt(89999)+10000;
	 Email email=new Email(u.getEmail(),"Reset Password","OTP: "+random);
	 email.sendEmail(); 
	 
	 map.addAttribute("otp",random);
	 return "conformotp";
 }
 
 @RequestMapping("/checkotp")
 public String checkotp(@RequestParam("userotp") int userotp,@RequestParam("otp") int otp)
 {
	 if (userotp==otp) 
	 {
		return "changepassword";
	 }
	 else
	 {
		return "conformotp";
	 }
 }
 
 @RequestMapping("/enterusername")
 public String enterusername()
 {
	 return "enterusername";
 }
 
 @RequestMapping("/password")
 public String password(@RequestParam("password") String password,@RequestParam("cpassword") String cpassword)
 {
	 if(password.equals(cpassword))
	 {
		password=new BCryptPasswordEncoder().encode(password);
		u.setPassword(password);
		userService.updateUser(u);
		return "redirect:/user/login";
	 }
	 else
	 {
		 return "changepassword";
	 }
	 
 }
}
