package com.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.dto.MemberDTO;

public class MemberValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		
		return MemberDTO.class.equals("arg0");
	}

	@Override
	public void validate(Object obj, Errors e) {
		
		MemberDTO mDTO = (MemberDTO)obj;

		if(mDTO.getUserid().length() < 3 || mDTO.getUserid().length() > 15
		  || mDTO.getUserid().length() ==0) {
			e.rejectValue("userid", "idChk");
		}else if(mDTO.getPasswd().length() < 3 || mDTO.getPasswd().length() == 0){
			e.rejectValue("passwd", "pwChk");
		}else if(mDTO.getUsername().length() == 0){
			e.rejectValue("username", "nameChk");
		}else if(mDTO.getEmail().length() == 0){
			e.rejectValue("email", "emailChk");
		}else if(mDTO.getBirthday().length() == 0){
			e.rejectValue("birthday", "birthChk");
		}else if(mDTO.getPost1().length() == 0 || mDTO.getPost2().length() == 0){
			e.rejectValue("post", "postChk");
		}else if(mDTO.getAddr1().length() == 0 || mDTO.getAddr2().length() == 0){
			e.rejectValue("addr", "addrChk");
		}else if(mDTO.getPhone().length() == 0 || mDTO.getPhone().length() >= 11
				|| mDTO.getPhone().length() < 10){
			e.rejectValue("phone", "phoneChk");
		}
	}

}
