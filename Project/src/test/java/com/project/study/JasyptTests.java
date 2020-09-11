package com.project.study;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@ContextConfiguration(locations ="classpath:app-context.xml")
public class JasyptTests {
	@Test
	public void jasypt() {

		StandardPBEStringEncryptor pbeEnc = new StandardPBEStringEncryptor();

		pbeEnc.setAlgorithm("PBEWithMD5AndDES");
		pbeEnc.setPassword("key");
		
		String username =pbeEnc.encrypt("root");
		String pw = pbeEnc.encrypt("1234");
		
		System.out.println(username);
		System.out.println(pw);
	}

}
