package com.kgw.app.schedule;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

@Component
@EnableScheduling
public class ScheduleTest {
	
	
	@Scheduled(cron = "50 * * * * *")
	public void s3() {
		System.out.println("반복");
	}
	
	
	//@Scheduled(fixedDelay = 1000 , initialDelay = 1000)
	public void s1() {
		System.out.println("일정간격으로 반복");
	}
	
	//@Scheduled(fixedRate = 2000 , initialDelay = 2000)
	public void s2() {
		System.out.println("고정간격으로 반복");
	}
	
}
