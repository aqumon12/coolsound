package com.coolsound.aop;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

@Aspect // 부가기능 정의(advice) + 어디에 적용(pointcut) // singleton객체
@Component
public class TimeAop {
	
	private Logger logger  = LoggerFactory.getLogger(this.getClass());
	
	// 어디에 적용?(pointcut)
	//@Around("excution(* com.coolsound.user.*(..))")
	@Around("@annotation(TimeTrace)") // TimeTrace 어노테이션이 붙어있는 곳은 AOP 수행
	public Object execute(ProceedingJoinPoint joinPoint) throws Throwable {
		// method가 수행되는데에 걸리는 시간 측정
		StopWatch sw = new StopWatch();
		sw.start();
		
		// 원본 메소드 수행
		Object obj = joinPoint.proceed();
		
		sw.stop();
		
		logger.info("### 실행 시간(ms):" + sw.getTotalTimeMillis());
		logger.info(sw.prettyPrint());
		return obj;
	}
}
