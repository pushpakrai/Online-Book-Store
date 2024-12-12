package com.onlinebookstore.OnlineBookStore.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onlinebookstore.OnlineBookStore.models.User;
import com.onlinebookstore.OnlineBookStore.services.userService;

import org.springframework.ui.Model;


@Controller
public class HomeController {
	
//	Autowire User Service for Dependency Injection
	@Autowired
    private userService userService;
	
//--------------------------------------------------------------------------------------------------------------------------------------	
    
//	Display the Home Page
    @GetMapping("/")
    public String home(Model model) {
        return "index";
    }
    
//  Show User Login Form
    @GetMapping("/user-login")
    public String userLogin() {
        return "user-login";
    }

//  Show Admin Login Form
    @GetMapping("/admin-login")
    public String adminLogin() {
        return "admin-login";
    }
    
//  Display User Registration Form
    @GetMapping("/registration")
    public String registration(Model model) {
        model.addAttribute("user", new User());
        return "registration";
    }

//    Process User Registration
    @PostMapping("/registration")
    public String registrationSubmit(@ModelAttribute("user") User user, Model model) {
        try {
            userService.saveUser(user, "ROLE_USER"); // Save user with ROLE_USER
            return "redirect:/user-login?registrationSuccess";
        } catch (RuntimeException e) {
        	return "redirect:/registration?registrationError=true&message=" + e.getMessage();
        }
    }

//    Authenticate User and Initialize Session
    @PostMapping("/login/user")
    public String userLoginSubmit(@RequestParam String username, @RequestParam String password, HttpSession session, RedirectAttributes redirectAttributes) {
        User user = userService.checkLogin(username, password);
        if (user != null && user.getRole().equals("ROLE_USER")) {
            session.setAttribute("user", user); // Store user in session
            redirectAttributes.addFlashAttribute("user", user);
            
            return "redirect:/user/home"; // Redirect to a dedicated mapping for user home
        }
        return "redirect:/user-login?error"; // Handle login error
    }

//    Authenticate Admin and Direct to Admin Home Page
    @PostMapping("/login/admin")
    public String adminLoginSubmit(@RequestParam String username, @RequestParam String password, Model model) {
        User user = userService.checkLogin(username, password);
        if (user != null && user.getRole().equals("ROLE_ADMIN")) {
            return "adminHome";
        }
        return "redirect:/admin-login?error"; // Handle login error
    }
    

}
