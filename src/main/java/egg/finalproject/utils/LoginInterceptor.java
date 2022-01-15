package egg.finalproject.utils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception{
		
		System.out.println("인터셉터 preHandle 실행됨");

		if(request.getSession().getAttribute("loginSession")==null) {
			System.out.println("로그인페이지로 이동");
			response.sendRedirect("/toLogin.do"); 
			return false;
		}
		return true;
	}
}
