package org.gasan.controller;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.gasan.domain.MemberVO;
import org.gasan.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@AllArgsConstructor
@RequestMapping("/*")
public class CommonController {

	@Setter(onMethod_ = @Autowired)
	private CommonService commonService;


	//시큐리티 에러 문구
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {

		log.info("access Denied: " + auth);

		model.addAttribute("msg", "Access Denied");

	}
	
	
	//로그인
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {

		log.info("error: " + error);
		log.info("logout: " + logout);

		if (error != null) {
			model.addAttribute("error", "Login Error Check Your Account");
		}

		if (logout != null) {
			model.addAttribute("logout", "Logout!!");
		}

	}

	
	//로그아웃 겟 방식
	@GetMapping("/customLogout")
	public void logoutGET() {

		log.info("custom logout");
	}
	
	//로그아웃 포스트 방식
	@PostMapping("/customLogout")
	public void logoutPost () {

		log.info("post custom logout");
	}



	//회원가입 폼 접근
	@GetMapping("/customSignup")
	public void signupGET() {

		log.info("회원가입 폼");
	}


	//회원가입 
	@PostMapping("/customSignup")
	public String signupPOST(MemberVO vo, RedirectAttributes rttr, HttpServletRequest request) throws Exception {
		log.info(vo);

		// 아이디 체크 
		int result = commonService.idChk(vo);

		//회원가입 
		try {

			if(result ==1) {
				return "/customSignup";
			}else if (result == 0) {

				commonService.customSignup(vo);
				rttr.addFlashAttribute("result", vo.getUserName());
			}

		} catch (Exception e) {
			
			throw new RuntimeException();
		}


		return "redirect:/";
	}


	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.GET)
	public int idChk(MemberVO vo) throws Exception {
		int result = commonService.idChk(vo);
		return result;
	}
	
	// 이메일 인증
	@RequestMapping(value = "/emailConfirm", method = RequestMethod.GET)
	public String emailConfirm(String userEmail, Model model) throws Exception { // 이메일 인증 확인창
			commonService.userAuth(userEmail);
			model.addAttribute("userEmail", userEmail);

			return "/emailConfirm"; // emailConfirm.jsp
	}
	
	//회원 정보 페이지
	@RequestMapping(value="/myPage_info", method = RequestMethod.GET)
	public String registerUpdateView() throws Exception{
		
		return "/myPage_info";
	}
	


	//회원 정보 수정 실행 매핑
	@RequestMapping(value="/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception{
		log.info(vo.getUserpw());
		commonService.memberUpdate(vo);
		
//		session.invalidate();
		
		return "redirect:/";
	}
		
	
	// 회원 탈퇴 get
		@RequestMapping(value="/memberDeleteView", method = RequestMethod.GET)
		public String memberDeleteView() throws Exception{
			return "/memberDeleteView";
		}
		
		// 회원 탈퇴 post
		@RequestMapping(value="/memberDelete", method = RequestMethod.POST)
		public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
			
			// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
			MemberVO member = (MemberVO) session.getAttribute("member");
			// 세션에있는 비밀번호
			String sessionPass = member.getUserpw();
			// vo로 들어오는 비밀번호
			String voPass = vo.getUserpw();
			
			if(!(sessionPass.equals(voPass))) {
				rttr.addFlashAttribute("msg", false);
				return "redirect:/memberDeleteView";
			}
			commonService.memberDelete(vo);
			//session.invalidate();
			return "redirect:/";
		}
	
	
   


}


