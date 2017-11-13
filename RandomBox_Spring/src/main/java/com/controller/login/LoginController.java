package com.controller.login;

import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.dto.MemberDTO;
import com.service.MemberService;

@Controller
public class LoginController {

	@Autowired
	MemberService service;
	
	//form 관련 controller
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "loginForm";
	}
	
	@RequestMapping("/findUserIdForm")
	public String findUserIdForm() {
		return "findUserIdForm";
	}
	
	@RequestMapping("/findPasswdForm")
	public String findPasswdForm() {
		return "findPasswdForm";
	}
	
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public String login(@RequestParam Map<String,String> map, Model m,
			  HttpSession session) throws Exception{
		System.out.println(map);
		MemberDTO dto = service.searchMember(map);
		
		if(dto==null) {
			m.addAttribute("mesg", "아이디/비번 확인하세요");
		}else {
			session.setAttribute("login", dto);
			m.addAttribute("login", "로그인 성공");
		}
		return "home";
	}
	
	@RequestMapping(value="/findUserId", method=RequestMethod.POST)
	public String findUserId(@RequestParam Map<String,String> map, Model m) throws Exception{
		System.out.println(map.get("username")+map.get("email"));
		String userid = service.findUserId(map);
		System.out.println(userid);
		if(userid==null) {
			m.addAttribute("mesg", "이름/전화번호를 확인하세요");
		}else {
			
			m.addAttribute("userid", userid);
		}
		return "findUserIdForm";
	}
	
	@RequestMapping(value="/findPasswd", method=RequestMethod.POST)
	public String findPasswd(@RequestParam Map<String,String> map, HttpServletRequest request, Model m) throws Exception{

		String passwd = service.findPasswd(map);
		String email = map.get("email");
		
		if(passwd==null) {
			m.addAttribute("mesg", "아이디/email을 확인하세요");
		}else {
			m.addAttribute("mesg","가입하신 이메일로 발송되었습니다.");
			request.setAttribute("passwd", passwd);
			request.setAttribute("email", email);

		}
		return "forward:/navermailtest";
	}
	
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		
		session.invalidate();
		
		
		return "loginForm";
	}
	
	@RequestMapping(value="/navermailtest")
    public String navermailtest(HttpServletRequest request, ModelMap mo) throws Exception{
         
        // 메일 관련 정보
        String host = "smtp.naver.com";
        final String username = "ghon0913";       //네이버 이메일 주소중 @ naver.com앞주소만 기재합니다.
        final String password = "asdhuy88";   //네이버 이메일 비밀번호를 기재합니다.
        int port=465;
         
        // 메일 내용
        String recipient = (String) request.getAttribute("email") ;    //메일을 발송할 이메일 주소를 기재해 줍니다.
        String subject = "네이버를 사용한 발송 테스트입니다.";
        
        String body = "비밀번호는 "+(String) request.getAttribute("passwd")+"입니다.";
         
        Properties props = System.getProperties();
          
        
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", port);
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.trust", host);
           
        Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
            String un=username;
            String pw=password;
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(un, pw);
            }
        });
        session.setDebug(true); //for debug
           
        Message mimeMessage = new MimeMessage(session);
        mimeMessage.setFrom(new InternetAddress("ghon0913@naver.com"));
        mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
        mimeMessage.setSubject(subject);
        mimeMessage.setText(body);
        Transport.send(mimeMessage);
        
        return "loginForm";
 
    }

	
}



