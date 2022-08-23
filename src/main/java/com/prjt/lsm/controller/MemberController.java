package com.prjt.lsm.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.prjt.lsm.service.MemberService;
import com.prjt.lsm.vo.MemberVo;

@RequestMapping(value = "/member/*")
@Controller
public class MemberController {

	private MemberService memberService;
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	@Autowired
	public MemberController(MemberService memberService) {

		this.memberService = memberService;
	}

	
	
	@RequestMapping("Join.do")
	public String Join() {

		return "member/Join";
	}

	@RequestMapping("JoinProcess.do")
	public String JoinProcess(MemberVo vo) {
		

		memberService.joinProcess(vo);
		return "redirect:/member/Login.do";
	}

	@RequestMapping("Login.do")
	public String Login() {

		return "member/Login";
	}

	@RequestMapping("LoginProcess.do")
	public ModelAndView LoginProcess(MemberVo vo, HttpSession session, ModelAndView mav) {

		String name = memberService.login(vo);

		if (name != null) {
			session.setAttribute("userid", vo.getMember_id());
			System.out.println("userid=" + vo.getMember_id());
			session.setAttribute("name", name);
			System.out.println("name=" + name);
			mav.setViewName("redirect:/");

		} else {
			mav.setViewName("member/Login");
		}
		return mav;
	}

	@RequestMapping("Logout.do")

	public ModelAndView logout(HttpSession session, ModelAndView mav) {

		session.invalidate();
		mav.setViewName("redirect:/");
		return mav;

	}

	@RequestMapping("Info.do")

	public ModelAndView info(HttpSession session, ModelAndView mav) {

		mav.setViewName("member/Info");
		return mav;

	}
}
