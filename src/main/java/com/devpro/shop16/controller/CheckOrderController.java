package com.devpro.shop16.controller;

import com.devpro.shop16.Constants.MyConstants;
import com.devpro.shop16.dto.OrderSearchModel;
import com.devpro.shop16.entities.SaleorderProducts;
import com.devpro.shop16.repository.ProductRepository;
import com.devpro.shop16.service.ProductService;
import com.devpro.shop16.service.SaleorderProductsService;
import com.devpro.shop16.service.SaleorderService;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Controller
public class CheckOrderController extends  BaseController{

	private final SaleorderProductsService saleorderProductsService;
	private final SaleorderService saleorderService;
	private final ProductRepository productRepository;

	public CheckOrderController(SaleorderProductsService saleorderProductsService, SaleorderService saleorderService, ProductRepository productRepository) {
		this.saleorderProductsService = saleorderProductsService;
		this.saleorderService = saleorderService;
		this.productRepository = productRepository;
	}

	@RequestMapping(value = { "/checkOrder" }, method = RequestMethod.GET)
	public String checkOrder(final Model model, final HttpServletRequest request) {
		OrderSearchModel searchModel = new OrderSearchModel();
		searchModel.keyword = request.getParameter("email");
		searchModel.setPage(getCurrentPage(request));
		model.addAttribute("orderWithPaging", saleorderProductsService.search(searchModel.keyword));
		model.addAttribute("searchModel", searchModel);
		return "khachhang/checkOrder";
	}
	
	@RequestMapping(value = { "/orders/update-status/{orderId}" }, method = RequestMethod.GET)
	public String updateOrderStatus(final Model model, @PathVariable("orderId") Integer orderId, final HttpServletRequest request) {
		Integer status = Integer.parseInt(request.getParameter("status"));
		String email = request.getParameter("email");
		saleorderService.findById(orderId).map(s -> {
			if (status == MyConstants.OrderStatus.CANCELLED) {
				productRepository.saveAll(s.getSaleOrderProducts().stream().map(so -> {
					so.getProduct().setSoldQuantity(so.getProduct().getSoldQuantity() - so.getQuality());
					return so.getProduct();
				}).toList());
			}
			s.setOrderStatus(status);
			return saleorderService.saveOrUpdate(s);
		});
		return "redirect:/checkOrder?email=" + email;
	}
	
	@RequestMapping(value = { "/admin/orders/update-status/{orderId}" }, method = RequestMethod.GET)
	public String approveOrder(final Model model, @PathVariable("orderId") Integer orderId, final HttpServletRequest request) {
		saleorderService.findById(orderId).map(s -> {
			s.setOrderStatus(MyConstants.OrderStatus.DELIVERING);
			return saleorderService.saveOrUpdate(s);
		});
		return "redirect:/admin/order";
	}

}
