package com.devpro.shop16.controller.quantrivien;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.devpro.shop16.repository.OrderRepository;
import com.devpro.shop16.repository.UserRepository;

import lombok.RequiredArgsConstructor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class AdminController {
	
	private final OrderRepository orderRepository;
	private final UserRepository userRepository;

	public AdminController(OrderRepository orderRepository, UserRepository userRepository) {
		this.orderRepository = orderRepository;
		this.userRepository = userRepository;
	}

	
	@RequestMapping(value = {"/admin","/admin/home"},
				method = RequestMethod.GET)
	public String home(final Model model, final HttpServletRequest request,final HttpServletResponse response )
		throws IOException{
		long totalOrder = orderRepository.countOrder();
		long totalActiveUser = userRepository.countActiveUser();
		long totalSalePrices = orderRepository.calculateTotalSalePrices();
		model.addAttribute("totalOrder", totalOrder);
		model.addAttribute("totalActiveUser", totalActiveUser);
		model.addAttribute("totalSalePrices", totalSalePrices);
		model.addAttribute("recentOrders", orderRepository.getRecentOrders());
		return "quantrivien/home";
	}

}
