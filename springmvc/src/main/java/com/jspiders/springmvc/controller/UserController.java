package com.jspiders.springmvc.controller;

import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.jspiders.springmvc.dto.UserDTO;
import com.jspiders.springmvc.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/login", method= RequestMethod.GET)
	protected String getLogInPage() {
		return "login";
	}
	
	@RequestMapping("/signup")
	protected String getSignUpPage() {
		return "signup";
	}
	
	@RequestMapping(value ="/users", method= RequestMethod.POST)
	protected String addUser(@RequestParam(name = "username") String userName, @RequestParam(name = "email") String email,
			@RequestParam(name = "mobile") long mobile, @RequestParam(name = "password") String password, 
			@RequestParam(name="role") String role, ModelMap modelMap) {
		
		UserDTO addedUser = userService.addUser(userName, email, mobile, role, password);
		
		if (addedUser != null) {
			modelMap.addAttribute("message", "User added..");
			return "login";
		} else {
			modelMap.addAttribute("message", "Something went wrong..");
			return "signup";
		}
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	protected String login(@RequestParam(name="email") String email, @RequestParam(name="password")
	String password, ModelMap modelMap, HttpSession httpSession) {
		
		UserDTO user = userService.login(email, password);
		if(user != null) {
			if(user.isBlocked()) {
				modelMap.addAttribute("message","User is Blocked");
				return "login";
			}else {
			httpSession.setAttribute("user", user);
			httpSession.setMaxInactiveInterval(3*24*60*60); // 3 Days
			
				
			modelMap.addAttribute("user", user);
			return "home";
			}
		} else {
			modelMap.addAttribute("message", "Invalid Email or Password");
			return "login";
		}
		
	}
	
	@RequestMapping(value="/resetpassword", method= RequestMethod.GET)
	protected String resetPassword() {
		return "resetpassword";
	}
	
	@RequestMapping(value="/logout", method=RequestMethod.GET)
	protected String logout(HttpSession httpSession ) {
		httpSession.invalidate();
		return "login";
	}
	
	@RequestMapping(value = "/home", method = RequestMethod.GET)
	protected String getHomePage(HttpSession httpSession, ModelMap modelMap) {
		UserDTO user = (UserDTO) httpSession.getAttribute("user");
		if (user != null) {
			modelMap.addAttribute("user", user);
			return "home";
		} else {
			return "login";
		}
	}
	
	@RequestMapping(value="/update", method=RequestMethod.GET)
	protected String getUpdatePage(HttpSession httpSession, ModelMap map) {
		UserDTO user = (UserDTO) httpSession.getAttribute("user");
		if(user != null) {
			map.addAttribute("user", user);
			return "updateuser";
		} else {
			return "home";
		}
	}
	
	@RequestMapping(value="/update-user", method=RequestMethod.POST)
	protected String updateUser(@RequestParam(name = "id") long id, @RequestParam(name = "username") String username,
			@RequestParam(name = "email") String email, @RequestParam(name = "mobile") long mobile,
			@RequestParam(name = "password") String password, ModelMap modelMap) {
		
		UserDTO updatedUser = userService.updateUser(id, username, email, mobile, password);
		if(updatedUser != null) {
			modelMap.addAttribute("message", "User Updated Successfully");
			
		} else {
			modelMap.addAttribute("message", "Something went wrong..");
		}
		return "home";
	}
	
	@RequestMapping(value="/delete", method=RequestMethod.GET)
	protected String deleteUser(HttpSession httpSession, ModelMap modelMap) {
		UserDTO user = (UserDTO) httpSession.getAttribute("user");
		if(user != null) {
			userService.deleteUser(user.getId());
			httpSession.invalidate();
			modelMap.addAttribute("message", "Account Deleted Successfully!");
		}
		return "login";
	}
	
	@RequestMapping(value="/users", method=RequestMethod.GET)
	protected String findAllUsers(HttpSession httpSession, ModelMap modelMap) {
		UserDTO user = (UserDTO) httpSession.getAttribute("user");
		if(user != null) {
		 List<UserDTO> users = userService.findAllUsers();
		 modelMap.addAttribute("users", users);
		 return "all-users";
		} else {
		return "login";
		}
	}
	
	@RequestMapping(value = "/block-user", method=RequestMethod.GET)
	protected String blockOrUnblockUser(@RequestParam(name = "id") long id, HttpSession httpSession, ModelMap modelMap) {
		UserDTO user = (UserDTO) httpSession.getAttribute("user");
		
		if(user != null) {
			UserDTO blockUser = userService.blockOrUnblockUser(id);
			
			if(blockUser != null) {
				List<UserDTO> users = userService.findAllUsers();
				modelMap.addAttribute("users", users);
			}
			return "all-users";
		} else {
			return "login";
		}
	}
}








