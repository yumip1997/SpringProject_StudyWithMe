package com.project.study.member.auth;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import com.project.study.member.dao.IMemberService;
import com.project.study.member.model.MemberVO;

public class MemberAuthenticationProvider implements AuthenticationProvider{
	
	@Autowired
	IMemberService memberService;
	
	@Autowired
	BCryptPasswordEncoder bpe;
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		// TODO Auto-generated method stub
		
		//입력된 아이디가 null일 경우
		if(authentication.getPrincipal() == null){ 
			return null;
		}
		
		//입력된 비밀번호가 null일 경우
		if(authentication.getCredentials() == null) {
			return null;
		}
		
		//Form에서 name태그 설정이 id, pw로 되어있는 값들을 각각 가져와 userId, password에 저장
		String userId = (String)authentication.getPrincipal();
		String password = (String)authentication.getCredentials();
		
		//데이터베이스에서 password를 가져옴
		String dbpw = memberService.getPassword(userId);
		
		if(dbpw==null) {
			throw new InternalAuthenticationServiceException("아이디가 존재하지 않습니다.");
		}
		
		if(!bpe.matches(password, dbpw)) {
			throw new BadCredentialsException("비밀번호가 다릅니다.");
		}
		
		MemberVO member= memberService.getMember(userId);
		
		if(!(member.isEnabled())) {
			throw new DisabledException("정지당한 계정입니다. 관리자에게 문의하세요.");
		}
		UsernamePasswordAuthenticationToken result = new UsernamePasswordAuthenticationToken(userId,
				password, member.getAuthorities());
		result.setDetails(member);
		return result;
				
	}

	@Override
	public boolean supports(Class<?> authentication) {
		// TODO Auto-generated method stub
		return authentication.equals(UsernamePasswordAuthenticationToken.class);
	}

}
