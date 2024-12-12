package com.onlinebookstore.OnlineBookStore.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.onlinebookstore.OnlineBookStore.models.User;
import com.onlinebookstore.OnlineBookStore.services.BookCategoryService;
import com.onlinebookstore.OnlineBookStore.services.BookService;
import com.onlinebookstore.OnlineBookStore.services.CartService;
import com.onlinebookstore.OnlineBookStore.services.userService;
import com.onlinebookstore.OnlineBookStore.models.Book;
import com.onlinebookstore.OnlineBookStore.models.BookCategory;
import com.onlinebookstore.OnlineBookStore.models.Cart;
import com.onlinebookstore.OnlineBookStore.models.Order;

import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {
	
//	Inject Dependencies for Book, User, Book Category, and Cart Services
	@Autowired
    private BookService bookService;
	@Autowired
    private userService userService;
	@Autowired
    private BookCategoryService bookCategoryService;
	@Autowired
    private CartService cartService;
	
//--------------------------------------------------------------------------------------------------------------------------------------	

//  Display User Profile Information
	  @GetMapping("/profile")
	  public String showUserProfile(Model model, HttpSession session) {
	      User sessionUser = (User) session.getAttribute("user");
	      if (sessionUser == null) {
	          return "redirect:/login";
	      }
	      User user = userService.findByUsername(sessionUser.getUsername());
	      if (user == null) {
	          return "redirect:/login";
	      }
	      model.addAttribute("user", user);
	      return "userProfile";
	  }
	  
//	Update User Profile Information
	@PostMapping("/updateProfile")
	public String updateUser(@ModelAttribute("user") User formUser, HttpSession session, Model model) {
	    User sessionUser = (User) session.getAttribute("user");
	    if (sessionUser == null) {
	        return "redirect:/login";
	    }
	    formUser.setId(sessionUser.getId());	    
	    try {
	        userService.updateUser(formUser); 
	        session.setAttribute("user", userService.getUserById(sessionUser.getId()));
	        model.addAttribute("message", "Profile updated successfully!");
	    } catch (RuntimeException e) {
	        model.addAttribute("error", e.getMessage()); 
	        return "userProfile";
	    }

	    return "redirect:/user/profile"; // Redirect to avoid form resubmission
	}
	
//	Display User Home Page with Book Categories
	@GetMapping("/home")
	public String userHome(HttpSession session, Model model, @RequestParam(value = "category_id", required = false) Long categoryId) {
	    User user = (User) session.getAttribute("user");
	    if (user != null) {
	    	List<Book> books = (categoryId != null && categoryId > 0) ? bookService.findBooksByCategoryId(categoryId) : bookService.getAllBooks();
	        List<BookCategory> categories = bookCategoryService.listAllCategories();
	        model.addAttribute("books", books);
	        model.addAttribute("categories", categories);
	        model.addAttribute("selectedCategoryId", categoryId);
        return "userHome";
	    }
	    return "redirect:/user-login";
    }
	
//	Add Book to User's Cart
	@PostMapping("/addToCart/{bookId}")
    public String addToCart(
        HttpSession session,
        @PathVariable Long bookId,
        RedirectAttributes redirectAttributes) {

        User user = (User) session.getAttribute("user");
        if (user != null) {
            try {
                cartService.addBookToCart(user.getId(), bookId, 1); // assuming quantity is always 1 for simplicity
                redirectAttributes.addFlashAttribute("successMessage", "Book added to cart successfully!");
            } catch (Exception e) {
                redirectAttributes.addFlashAttribute("errorMessage", "There was a problem adding the book to the cart.");
            }
            return "redirect:/user/home";
        }
        return "redirect:/user-login";
    }
	
//	Display User's Shopping Cart
	@GetMapping("/cart")
	public String showCart(Model model, HttpSession session) {
	    User user = (User) session.getAttribute("user");  // Fetch the user from session
	    if (user == null) {
	        return "redirect:/login"; // Not logged in or session expired
	    }
	    Cart cart = cartService.getCurrentCart(user.getId());
	    if (cart == null) {
	        return "redirect:/error"; // No cart found for the user
	    }
	    model.addAttribute("cart", cart);
	    model.addAttribute("cartTotalCost", cartService.calculateTotal(cart));
	    return "Cart";
	}
	
//	Remove Book from Shopping Cart
	@PostMapping("/removeBookFromCart")
	public String removeBookFromCart(@RequestParam("cartBookId") Long cartBookId, RedirectAttributes redirectAttributes) {
	    try {
	        cartService.removeBookFromCart(cartBookId);
	        redirectAttributes.addFlashAttribute("successMessage", "Book removed from cart successfully!");
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("errorMessage", "Failed to remove book from cart.");
	    }
	    return "redirect:/user/cart";
	}
	
//	Process Cart Checkout and Place Order
	@PostMapping("/checkout")
    public String checkout(HttpSession session, RedirectAttributes redirectAttributes) {
        User user = (User) session.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }
        try {
            cartService.checkout(user.getId());
            redirectAttributes.addFlashAttribute("successMessage", "Order placed successfully!");
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "Failed to place order: " + e.getMessage());
        }
        return "redirect:/user/cart";
    }

//	Display Orders Placed by User
	@GetMapping("/orders")
	public String showUserOrders(Model model, HttpSession session) {
	    User user = (User) session.getAttribute("user");
	    if (user == null) {
	        return "redirect:/login";
	    }
	    List<Order> userOrders = cartService.getOrdersByUsername(user.getUsername());
	    model.addAttribute("userOrders", userOrders);
	    return "MyOrders";
	}

//	Log Out User and Invalidate Session
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/user-login";
    }
   


}
