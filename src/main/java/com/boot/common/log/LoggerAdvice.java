package com.boot.common.log;

import java.util.Arrays;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
//import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.AfterThrowing;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.util.StopWatch;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
@Aspect
public class LoggerAdvice {
	
	/* execution(@execution) 메서드를 기준으로 Pointcut을 설정 
	@Before("execution(* com.spring..*Impl.*(..))")
	public void printLogging() {
		log.info("--------------------------------");
		log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
		log.info("--------------------------------");
	}*/
	
	/*@Before("execution(* com.spring..*Impl.*(..)) && args(bvo)")
	public void printLogging(BoardVO bvo) {
		log.info("--------------------------------");
		log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
		log.info("--------------------------------");
		log.info("BoardVO 타입의 bvo 파라미터 값 : " + bvo);
	}*/
	
	@Before("execution(* com.boot..*Impl.*(..))")
	public void printLogging(JoinPoint jp) {
		log.info("--------------------------------");
		log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
		// getArgs() : 전달되는 모든 파라미터들을 Object의 배열로 가져온다.
		// getSignature() : 실행되는 대상 객체의 대한 정보를 알아낼 때 사용
		log.info("[호출 메서드명]" + jp.getSignature().getName());
		log.info("[호출 메서드의 파라미터 값]" + Arrays.toString(jp.getArgs()));
		log.info("--------------------------------");
	}
	
	@AfterThrowing(pointcut="execution(* com.boot..*Impl.*(..))", throwing="exception")
	public void printLogging(JoinPoint jp, Throwable exception) {
		log.info("-------------------------------------");
		log.info("[예외발생] ");
		log.info("[예외발생 메서드명] " + jp.getSignature().getName());
		//exception.printStackTrace();
		log.info("[예외 메시지] " + exception);
		log.info("-------------------------------------");
	}
	
	/* 비즈니스 로직 메서드가 정상적으로 수행 된 후  동작 
	@AfterReturning(pointcut="execution(* com.spring..service.*Impl.*(..))", returning="returnValue")
	public void afterReturningMethod(JoinPoint jp, Object returnValue) {
		log.info("--------------------------------");
		log.info("[공통 로그 Log] 비즈니스 로직 수행 후 동작");
		log.info("afterReturningMethod() called...." + jp.getSignature().getName());
		log.info("[리턴 결과]" + returnValue);
		log.info("---------------------------------");
	}*/
	
	@Around("execution(* com.boot..*Impl.*(..))")
	public Object timeLogging(ProceedingJoinPoint pjp) throws Throwable{
		log.info("--------------------------------");
		log.info("[공통 로그 Log] 비즈니스 로직 수행 전 동작");
		
		//long startTime = System.currentTimeMillis();
		StopWatch watch = new StopWatch();
		watch.start();
		log.info("[호출 메서드의 파라미터 값]" + Arrays.toString(pjp.getArgs()));
		
		Object result = null;
		// proceed(): 실제 target 객체의 메서드를 실행하는 기능
		result = pjp.proceed();
		
		// long endTime = System.currentTimeMillis();
		watch.stop();
		
		log.info("[Class] " + pjp.getTarget().getClass());
		
		log.info("[호출 메서드명] " + pjp.getSignature().getName());
		log.info("[소요시간] " + watch.getTotalTimeSeconds() + "ms");
		log.info("[리턴 결과] " + result);
		log.info("[공통 로그 Log] 비즈니스 로직 수행 후 동작");
		log.info("----------------------------------");
		
		return result;
	}
}
