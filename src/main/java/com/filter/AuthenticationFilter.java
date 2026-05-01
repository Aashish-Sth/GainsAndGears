package com.filter;

import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.model.UserModel;
import com.services.LoginService;
import com.utils.CookieUtil;
import com.utils.SessionUtil;
import java.io.IOException;

/**
 * Servlet Filter implementation class AuthenticationFilter
 */
@WebFilter("/*")
public class AuthenticationFilter extends HttpFilter implements Filter {
       
	private static final String LOGIN = "/login";
	private static final String SIGNUP = "/signUp";
	private static final String HOME = "/home";
	private static final String GAINS = "/gains/*";
	private static final String GEARS = "/gears/*";
	private static final String EXPLORE = "/explore";
	private static final String GAINDETAILS ="/gainDetails";
	private static final String GEARDETAILS ="/gearDetails";
	private static final String ABOUT = "/about";
	private static final String CONTACTUS = "/contact";
	private static final String REVIEW = "/review";
	
	
	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}
	

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		  String uri = req.getRequestURI();
	      String contextPath = req.getContextPath(); 
	      
	      String path = uri.substring(contextPath.length()); //extracting servelet path
	      
	      if (path.startsWith("/resources/") || path.endsWith(".css")  || path.endsWith(".svg") || path.endsWith(".js") || path.endsWith(".png") || path.endsWith(".jpg")   || path.startsWith("/WEB-INF")  || path.startsWith("/uploads/")) {
	            chain.doFilter(request, response);
	            return;
	        }
	      
	      Object user = SessionUtil.getAttribute(req, "user_email");
	      
	      if(user == null) {
	    	  Cookie cookie = CookieUtil.getCookie(req, "user_email");
	    	  if(cookie != null) {
	    	  String  emailFromCookie = cookie.getValue();
	    	  if(emailFromCookie != null) {
	    		 try {
	    			 LoginService service = new LoginService();
	    			 UserModel sessionUser = service.getUserByEmail(emailFromCookie);
	    			 if(sessionUser != null) {
	    				 SessionUtil.setAttribute(req, "user_email", emailFromCookie);
	    				 SessionUtil.setAttribute(req, "loggedInUser", sessionUser);
	    				 user = emailFromCookie;
	    			 }
	    		 }
	    		 catch (Exception e) {
	    	            e.printStackTrace();
	    	        }
	    	  }
	    	  }
	      }
	      
	      boolean isLoggedIn = (user != null);
	      
		
		
		boolean isPublic =
		        path.equals(LOGIN) ||
		        path.equals(SIGNUP) ||
		        path.equals(HOME) ||
		        path.startsWith("/gains/") ||
		        path.startsWith("/gears/") ||
		        path.equals(EXPLORE) ||
		        path.equals(GAINDETAILS) ||
		        path.equals(GEARDETAILS) ||
		        path.equals(ABOUT) ||
		        path.equals(CONTACTUS) ||
		        path.equals(REVIEW);
		
		   if (!isLoggedIn) {
	            if (isPublic) {
	                chain.doFilter(request, response);
	            } else {
	                res.sendRedirect(contextPath + LOGIN);
	            }
	        } else {
	            if ( path.equals(LOGIN) ||  path.equals(SIGNUP)) {
	                res.sendRedirect(contextPath + "/home");
	            } else {
	                chain.doFilter(request, response);
	            }
	        }	
	}
	@Override
	public void destroy() {
	}


}
