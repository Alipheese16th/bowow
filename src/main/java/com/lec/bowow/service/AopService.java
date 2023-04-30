package com.lec.bowow.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import com.lec.bowow.dao.CartDao;
import com.lec.bowow.model.Member;

@Aspect
@Component
public class AopService {
	
	@Autowired
	private CartDao cartDao;
	
	@Around("execution(* com.lec.bowow.controller..*.*(..))")
	public Object aroundAdvice(ProceedingJoinPoint joinPoint) throws Throwable {
		Object object = joinPoint.proceed(); // 핵심 기능 실행
		HttpServletRequest request = ((ServletRequestAttributes)(RequestContextHolder.currentRequestAttributes())).getRequest();
		HttpSession session = ((ServletRequestAttributes)(RequestContextHolder.currentRequestAttributes())).getRequest().getSession();
		if(session != null) {
			Member member = (Member) session.getAttribute("member");
			if(member != null) {
				if(request != null) {
					int totCntCart = cartDao.totCntCart(member.getMemberId());
					request.setAttribute("totCntCart", totCntCart);
				}
			}
		}
		return object;
	}
	
}
