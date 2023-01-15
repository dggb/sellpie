package com.teamnameled.sellpie.common;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import com.teamnameled.sellpie.admin.model.service.AdminService;
import com.teamnameled.sellpie.member.model.service.MemberService;
import com.teamnameled.sellpie.member.model.vo.Member;

   

public class Interceptor extends HandlerInterceptorAdapter {
	
	@Autowired
	MemberService service;
	@Autowired
	AdminService adminService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handle){ 

		
		
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("user");
			try {
				if(null==obj){
					Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
					if(loginCookie!=null){
						String sessionId = loginCookie.getValue();
						System.out.println(sessionId);
						Member member = service.checkUserSessionKey(sessionId);
						if(member!=null){
							session.setAttribute("user", member);
							int result = adminService.insertCount(member.getEmail());
							System.out.println("카운트를 넣을꺼에요" + result);

							response.sendRedirect("/sellpie/signIn.do");
							return true;
						}
					}else if(request.getRequestURI().equals("/sellpie/signIn.do")){
						return true;
					}else if(request.getRequestURI().equals("/sellpie/signUp.do")){
						return true;
					}else if(request.getRequestURI().equals("/sellpie/login.do")){
						return true;
					}else if(request.getRequestURI().equals("/sellpie/memberJoin.do")){
						return true;
					}else if(request.getRequestURI().equals("/sellpie/getName.do")){
						return true;
					}else if(request.getRequestURI().equals("/sellpie/getGender.do")){
						return true;
					}else if(request.getRequestURI().equals("/sellpie/getPhone.do")){
						return true;
					}else if(request.getRequestURI().equals("/sellpie/getBirth.do")){
						return true;
					}else if(request.getRequestURI().equals("/sellpie/checkEmail.do")){
						return true;
					}else if(request.getRequestURI().equals("/sellpie/changePwdAu.do")){
						return true;
					}else if(request.getRequestURI().equals("/sellpie/changePwd.do")){
						return true;
					}else if(request.getRequestURI().equals("/sellpie/userLogin.do")){
						return true;
					}else if(request.getRequestURI().equals("/sellpie/changeUserPwd.do")){
						return true;
					}else if(request.getRequestURI().equals("/sellpie/updateMember.do")){
						return true;
					}else if(request.getRequestURI().equals("/sellpie/updateUserPwd.do")){
						return true;
					}else if(request.getRequestURI().equals("/sellpie/applyAdForm.do")) {
						return true;
					}else if(request.getRequestURI().equals("/sellpie/insertBoard.do")) {
						System.out.println("세션값 존재 X, loginCookie ==null");
						return true;
					}else{
						System.out.println("나머지 페이지들 처리");
						response.sendRedirect("/sellpie/errorPage.do");
						return false;
					}
				}
			} catch (IOException e) {
				System.out.println("??에러찍음?");
				e.printStackTrace();
			}
			
			return true;
	}
	@Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
            ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
        /*int prevent = (int)request.getSession().getAttribute("prevent");
        System.out.println(prevent);*/
    }



}
