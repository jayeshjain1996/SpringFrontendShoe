package com.niit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.niit.model.Shoe;
import com.niit.service.ShoeService;
import com.sun.org.apache.regexp.internal.recompile;

@Controller
@RequestMapping("/shoe")
public class ShoeController 
{
  @Autowired
  ShoeService shoeService;
  
  @RequestMapping(value = {"/add"})
  public String shoeAdd(ModelMap map)
  {
	  map.addAttribute("shoe",new Shoe());
	  return "addshoe";
  }
  
  @RequestMapping(value = {"/add"},method = RequestMethod.POST)
  public String shoeAdd(@ModelAttribute("shoe") Shoe s)
  {
	  shoeService.addShoe(s);
	  return "redirect:/shoe/display";
  }
  
  @RequestMapping("/display")
  public String displayShoes(ModelMap map)
  {
	  map.addAttribute("shoes",shoeService.displayAll()); 
	  return "displayshoes";
  }
  
  @RequestMapping("/display/{shoeid}")
  public String displayShoe(@PathVariable("shoeid") int shoeid,ModelMap map)
  {
	  Shoe s=shoeService.displayByShoeid(shoeid);
	  map.addAttribute("shoe",s);
	  return "displayshoe";	  
  }
  
  @RequestMapping("/delete/{shoeid}")
  public String deleteShoe(@PathVariable("shoeid") int shoeid)
  {
	  shoeService.deleteShoe(shoeid);
	  return "redirect:/shoe/display";
  }
  
  @RequestMapping("/edit/{shoeid}")
  public String editShoe(@PathVariable("shoeid") int shoeid,ModelMap map)
  {
	  Shoe s=shoeService.displayByShoeid(shoeid);
	  map.addAttribute("s",s);
	  return "addshoe";
  }
  
  @RequestMapping(value = {"/update"},method = RequestMethod.POST )
  public String updateShoe(@ModelAttribute("s") Shoe s)
  {
	  shoeService.updateShoe(s);
	  return "redirect:/shoe/display";
  }
}
