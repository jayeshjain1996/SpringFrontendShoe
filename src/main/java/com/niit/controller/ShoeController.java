package com.niit.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.nio.file.DirectoryStream;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.niit.model.Shoe;
import com.niit.service.ShoeService;


@Controller
@RequestMapping("/shoe")
public class ShoeController 
{
	
  String path1;
  
  @Autowired
  ShoeService shoeService;
  
  @RequestMapping(value = {"/add"})
  public String shoeAdd(ModelMap map)
  {
	  map.addAttribute("shoe",new Shoe());
	  return "addshoe";
  }
  
  @RequestMapping(value = {"/add"},method = RequestMethod.POST)
  public String shoeAdd(@ModelAttribute("shoe") Shoe s,@RequestParam("image") MultipartFile shoeimage)
  {
	    shoeService.addShoe(s);
	    path1="C:\\Users\\HP\\Desktop\\JUnit testing\\SpringFrontendShoe\\src\\main\\webapp\\WEB-INF\\images\\";
		Path p=Paths.get(path1+s.getShoebrand());
		if (!Files.exists(p))
		{    
			try
			{
				Files.createDirectory(p);
				System.out.println("Directory created");
			}
			catch (Exception e) 
			{
				System.out.println(e);
			}
        }
		
		
        List<String> files=displayImage(s.getShoebrand());
		
		String path2=String.valueOf(p.toString()+"\\"+(files.size()+1)+".jpg");
		System.out.println(path2);
		File imageFile=new File(path2);
		
		if(!shoeimage.isEmpty())
		{
			try
			{
				byte buffer[]=shoeimage.getBytes();
				FileOutputStream fos=new FileOutputStream(imageFile);
				BufferedOutputStream bos=new BufferedOutputStream(fos);
				bos.write(buffer);
				bos.close();
			}
			catch (Exception e) 
			{
				System.out.println(e);
			}
		}
		return "redirect:/";
  }
  
  public List<String> displayImage(String shoebrand)
	{

		List<String> images=new ArrayList<String>();
		
		try
		{
			String path="C:\\Users\\HP\\Desktop\\JUnit testing\\SpringFrontendShoe\\src\\main\\webapp\\WEB-INF\\images\\";
			Path p=Paths.get(path+shoebrand);
			DirectoryStream<Path> files=Files.newDirectoryStream(p,"*.*");
			
			for(Path file:files)
			{
//				FileInputStream fis=new FileInputStream(file.toString());
//				byte[] arr=new byte[fis.available()];
//				fis.read(arr);
				
				images.add(file.getFileName().toString());
			}
			
		}
		catch (Exception e) 
		{
			System.out.println(e);
		}
		return images;
	}
  
  @RequestMapping("/display")
  public String displayShoes(ModelMap map)
  {
	  List<Shoe> shoes=new ArrayList<Shoe>();
		for(Shoe s:shoeService.displayAll())//Nike,Puma
		{
			List<String> im=displayImage(s.getShoebrand());
			if(!im.isEmpty())
			s.setShoeimage(im.get(0));
			shoes.add(s);
		}
	  map.addAttribute("shoes",shoes); 
	  return "displayshoes";
  }
  
  @RequestMapping("/display/{shoeid}")
  public String displayShoe(@PathVariable("shoeid") int shoeid,ModelMap map)
  {
	  Shoe s=shoeService.displayByShoeid(shoeid);
	  List<String> images=displayImage(s.getShoebrand());
	  s.setShoeimage(images.get(0));
	  map.addAttribute("shoe",s);
	  return "displayshoe";	  
  }
  
  @RequestMapping("/delete/{shoeid}")
  public String deleteShoe(@PathVariable("shoeid") int shoeid)
  {
	  Shoe s=shoeService.displayByShoeid(shoeid);
	  List<String> images=displayImage(s.getShoebrand());
	  String img=s.getShoebrand()+"\\"+images.get(0);
	  try 
	  {
		  Path p=Paths.get(path1+img);		  
		  Files.delete(p);
		  Path p1=Paths.get(path1+s.getShoebrand());
		  Files.delete(p1);
		  System.out.println("Folder deleted successfully");
	  } 
	  catch (Exception e) 
	  {
		System.out.println(e);
	  }
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
  
  @RequestMapping("/hightolow")
  public String hightolow(ModelMap map)
  {
	  List<Shoe> shoes=new ArrayList<Shoe>();
	  for (Shoe shoe :shoeService.displayHighToLow()) 
	  {
		List<String> im=displayImage(shoe.getShoebrand());
		if(!im.isEmpty())
		shoe.setShoeimage(im.get(0));
		shoes.add(shoe);
	  }
	  
	  map.addAttribute("shoes",shoes);
	  return "displayshoes";
  }
  
  @RequestMapping("/lowtohigh")
  public String lowtohigh(ModelMap map)
  {
	  List<Shoe> shoes=new ArrayList<Shoe>();
	  for (Shoe shoe : shoeService.displayLowToHigh()) 
	  {
	 	List<String> im=displayImage(shoe.getShoebrand());
	 	if(!im.isEmpty())
	 	shoe.setShoeimage(im.get(0));
	 	shoes.add(shoe);
	  }
	  
	  map.addAttribute("shoes",shoes);
	  return "displayshoes";
  }
  
  @RequestMapping("/search")
  public String displayBySearch(@RequestParam("search") String search,ModelMap map)
  {
	  List<Shoe> shoes=new ArrayList<Shoe>();
	  for (Shoe shoe : shoeService.displayBySearch(search)) 
	  {
	 	List<String> im=displayImage(shoe.getShoebrand());
	 	if(!im.isEmpty())
	 	shoe.setShoeimage(im.get(0).toString());
	 	shoes.add(shoe);
	  }
	  
	  map.addAttribute("shoes",shoes);
	  return "displayshoes";
  }
    
}
