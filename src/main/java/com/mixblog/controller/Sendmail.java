package com.mixblog.controller;

import com.mixblog.pojo.MailUtil;

public class Sendmail {
	private static final long serialVersionUID = 1L;
	 
	public static void main(String[] args) {
		String text="11111";
		MailUtil.sendMail("592583156@qq.com", "来自ldtutu.com",text);
		/*
		 * System.out.println("发送成功1"); MailUtil.sendMail("1364411370@qq.com",
		 * "来自ldtutu.com",text); System.out.println("发送成功2");
		 * MailUtil.sendMail("604219226@qq.com", "来自ldtutu.com",text);
		 * System.out.println("发送成功3"); MailUtil.sendMail("704926823@qq.com",
		 * "来自ldtutu.com",text); System.out.println("发送成功4");
		 * MailUtil.sendMail("1285190509@qq.com", "来自ldtutu.com",text);
		 * System.out.println("发送成功5"); MailUtil.sendMail("2129239066@qq.com",
		 * "来自ldtutu.com",text); System.out.println("发送成功6");
		 * MailUtil.sendMail("974515741@qq.com", "来自ldtutu.com",text);
		 * System.out.println("发送成功7"); MailUtil.sendMail("639788020@qq.com",
		 * "来自ldtutu.com",text); System.out.println("发送成功8");
		 * MailUtil.sendMail("1554581497@qq.com", "来自ldtutu.com",text);
		 * System.out.println("发送成功9"); MailUtil.sendMail("1203571831@qq.com",
		 * "来自ldtutu.com",text); System.out.println("发送成功10");
		 */
		MailUtil.sendMail("1832654908@qq.com", "来自ldtutu.com",text);
		System.out.println("发送成功11");
		
	}
}
