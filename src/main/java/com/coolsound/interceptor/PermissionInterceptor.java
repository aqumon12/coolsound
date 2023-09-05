package com.coolsound.interceptor;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Component
public class PermissionInterceptor implements HandlerInterceptor {
private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws IOException {
		
		String uri = request.getRequestURI();
		logger.info("[$$$$$$$] preHandle uri:{}", uri);
		
		HttpSession session = request.getSession();
		Integer userId = (Integer)session.getAttribute("userId");
		
		if (userId == null && uri.startsWith("/user/u")) {
			response.sendRedirect("/user/sign_in_view");
			return false;
		}
		
		if (userId == null && uri.startsWith("/shop/o")) {
			response.sendRedirect("/user/sign_in_view");
			return false;
		}
		
		if (userId != null && uri.startsWith("/user/s")) {
			 response.sendRedirect("/shop/main_view"); 
			 return false;
		}
		 
		Integer adminId = (Integer)session.getAttribute("adminId");
		 
		if (adminId == null && uri.startsWith("/admin/a")) {
			response.sendRedirect("/admin/sign_in_view");
			return false;
		}
		
		if (adminId != null && uri.startsWith("/admin/s")) {
			 response.sendRedirect("/admin/a/main_view"); 
			 return false;
		}
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView mav) {
		
		logger.info("[##############] postHandle");
	}
	
	@Override
	public void afterCompletion(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			Exception ex) {
		
		logger.info("[@@@@@@@@@@@] afterCompletion");
	}
}
