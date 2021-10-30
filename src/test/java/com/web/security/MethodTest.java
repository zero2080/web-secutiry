package com.web.security;

import static org.junit.Assert.assertEquals;

import org.junit.Test;


public class MethodTest {
	
	@Test
	public void test() {
		int totalCount=2;
		int pageSize=20;
		int result = (int)Math.round(Math.ceil((float)totalCount/pageSize));
		System.out.println((float)totalCount/pageSize);
		System.out.println(result);
		assertEquals(result, 1);
		
	}

}
