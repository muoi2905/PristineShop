package com.devpro.shop16.controller.quantrivien;

import com.devpro.shop16.controller.BaseController;
import com.devpro.shop16.dto.UserSearchModel;
import com.devpro.shop16.entities.User;
import com.devpro.shop16.service.PagerData;
import com.devpro.shop16.service.UserService;

import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Controller
public class AdminUserController extends BaseController{

	private final UserService userService;

	public AdminUserController(UserService userService) {
		this.userService = userService;
	}

	@RequestMapping(value = { "/admin/user/list","/admin/user" }, method = RequestMethod.GET)
	public String adminProductList(final Model model, final HttpServletRequest request,
			final HttpServletResponse response) throws IOException {
		
		UserSearchModel searchModel = new UserSearchModel();
		searchModel.keyword = request.getParameter("keyword");
		searchModel.setPage(getCurrentPage(request));
		searchModel.roleId = super.getInteger(request, "roleId");
		PagerData<User> users = userService.search(searchModel);
		users.getData().forEach(user -> user.setRole());
		model.addAttribute("userWithPaging", users);
		model.addAttribute("searchModel", searchModel);
		
		return "quantrivien/user";
	}

	

}
