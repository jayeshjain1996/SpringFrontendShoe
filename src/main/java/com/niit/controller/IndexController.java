package com.niit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class IndexController
{
  @RequestMapping(value = {"","/","/home"})
  public String home()
  {
	  return "index";
  }
  
  @RequestMapping("/aboutus")
  public String aboutus()
  {
	  return "aboutus";
  }
  
  @RequestMapping("/contactus")
  public String contactus()
  {
	  return "contactus";
  }
  
}
