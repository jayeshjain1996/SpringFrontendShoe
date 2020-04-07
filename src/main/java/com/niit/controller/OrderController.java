package com.niit.controller;

import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.instamojo.wrapper.api.ApiContext;
import com.instamojo.wrapper.api.Instamojo;
import com.instamojo.wrapper.api.InstamojoImpl;
import com.instamojo.wrapper.model.PaymentOrder;
import com.instamojo.wrapper.model.PaymentOrderResponse;
import com.niit.model.Shoe;
import com.niit.service.ShoeService;

@Controller
@RequestMapping("/order")
public class OrderController 
{
	@Autowired
	ShoeService shoeService;
	
	@RequestMapping("/{sid}")
	public void m1(@PathVariable("sid") int shoeid,HttpServletResponse resp)
	{
		  Shoe s=shoeService.displayByShoeid(shoeid);
		  try 
	       {
	           ApiContext context = ApiContext.create("GLuVv9cvTn2zFm8vgzDbeoB3AtRFEqtmoqJJbRjC", "prFvpQMdFqI1gO9FUC9aU99H90LwXEVr6Cjansikh9Dg951CUEtvH22W9zJ78cKR8EBIlR6rLROi3ys324VYDJJ6dv8DbNDXIEKJM2rlSiAHpB2GeAb6zZxyLvlDK5nQ", ApiContext.Mode.LIVE);
	           Instamojo api = new InstamojoImpl(context);

	           PaymentOrder order = new PaymentOrder();
	           order.setName("jayeshjazz7");
	           order.setEmail("jayeshjazz7@gmail.com");
	           order.setPhone("8898617911");
	           order.setCurrency("INR");
	           order.setAmount((double)s.getPrice());
	           order.setDescription(s.getShoemodel());
	           order.setRedirectUrl("https://www.google.com");
	           order.setWebhookUrl("https://www.google.com");
	           order.setTransactionId(UUID.randomUUID().toString());

	           PaymentOrderResponse paymentOrderResponse = api.createPaymentOrder(order);
	           resp.sendRedirect(paymentOrderResponse.getPaymentOptions().getPaymentUrl());
	       }
	       catch (Exception e) 
	       {
	           System.out.println(e);
	       }
	}
}