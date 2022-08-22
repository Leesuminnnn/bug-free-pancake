package com.prjt.lsm;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Locale;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonObject;

import nl.captcha.Captcha;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		
		
		return "home";
	}
	@RequestMapping(value = "/home.do", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		
		
		return "home";
	}
	@PostMapping(value="/uploadSummernoteImageFile", produces = "application/json; charset=utf8")
	@ResponseBody
	public String uploadSummernoteImageFile(@RequestParam("file") MultipartFile multipartFile, HttpServletRequest request )  {
		JsonObject jsonObject = new JsonObject();
		
        /*
		 * String fileRoot = "C:\\summernote_image\\"; // 외부경로로 저장을 희망할때.
		 */
		
		// 내부경로로 저장
		String contextRoot = new HttpServletRequestWrapper(request).getRealPath("/");
		String fileRoot = contextRoot+"resources/fileupload/";
		
		String originalFileName = multipartFile.getOriginalFilename();	//오리지날 파일명
		String extension = originalFileName.substring(originalFileName.lastIndexOf("."));	//파일 확장자
		String savedFileName = UUID.randomUUID() + extension;	//저장될 파일 명
		
		File targetFile = new File(fileRoot + savedFileName);	
		try {
			InputStream fileStream = multipartFile.getInputStream();
			FileUtils.copyInputStreamToFile(fileStream, targetFile);	//파일 저장
			jsonObject.addProperty("url", "/lsm/resources/fileupload/"+savedFileName); // contextroot + resources + 저장할 내부 폴더명
			// 톰캣에 올릴때 경로 수정해주기
			jsonObject.addProperty("responseCode", "success");
				
		} catch (IOException e) {
			FileUtils.deleteQuietly(targetFile);	//저장된 파일 삭제
			jsonObject.addProperty("responseCode", "error");
			e.printStackTrace();
		}
		String a = jsonObject.toString();
		return a;
	}
	
	// 페이지 매핑
		@GetMapping("/captcha.do")
		public String Captcha() {
			return "captcha";
		}	

		// captcha 이미지 가져오는 메서드
		@GetMapping("/captchaImg.do")
		@ResponseBody
		public void captchaImg(HttpServletRequest req, HttpServletResponse res) throws Exception{
			new CaptchaUtil().getImgCaptCha(req, res);
		}

		// 전달받은 문자열로 음성 가져오는 메서드
		@GetMapping("/captchaAudio.do")
		@ResponseBody
		public void captchaAudio(HttpServletRequest req, HttpServletResponse res) throws Exception{
			Captcha captcha = (Captcha) req.getSession().getAttribute(Captcha.NAME);
			String getAnswer = captcha.getAnswer();
			new CaptchaUtil().getAudioCaptCha(req, res, getAnswer);
		}

		// 사용자가 입력한 보안문자 체크하는 메서드
		@PostMapping("/chkAnswer.do")
		@ResponseBody
		public String chkAnswer(HttpServletRequest req, HttpServletResponse res) {
			String result = "";
			Captcha captcha = (Captcha) req.getSession().getAttribute(Captcha.NAME);
			String ans = req.getParameter("answer");
			if(ans!=null && !"".equals(ans)) {
				if(captcha.isCorrect(ans)) {
					req.getSession().removeAttribute(Captcha.NAME);
					result = "200";
				}else {
					result = "300";
				}
			}
			return result;
		}
	
	
	
}
