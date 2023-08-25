package com.coolsound;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;

import com.coolsound.test.PayType;
import com.coolsound.test.Status;

public class EnumTest {

	Status getStatus() {
		return Status.Y;
	}
	
	@Test
	void pay테스트1() {
		// given
		String payMethod = "KAKAO";
		
		// when
		// 결제 수단(예:카카오페이)에 대한 결제 종류(예:현금 또는 카드)가 무엇인가?
		PayType payType = PayType.findByPayMethod(payMethod);
		
		// then
		assertEquals(PayType.CARD, payType);
	}
	
	//@Test
	void Status테스트() {
		// given - 준비
		Status status = getStatus();  // Y
		
		// when - 실행
		int v1 = status.getValue1();
		boolean v2 = status.isValue2(); // 필드의 타입이 boolean이면 get이 아닌 is
		
		// then - 검증
		assertEquals(v1, 1);
		assertEquals(v2, true);
		assertEquals(status, Status.Y);
		
	}
}
