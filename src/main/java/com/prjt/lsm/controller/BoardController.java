package com.prjt.lsm.controller;

import java.io.File;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.prjt.lsm.service.BoardService;
import com.prjt.lsm.vo.BoardVo;
import com.prjt.lsm.vo.CriteriaBoard;
import com.prjt.lsm.vo.PagingBoard;

@RequestMapping(value = "/board/*")
@Controller
public class BoardController {

	private BoardService boardService;
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Autowired
	public BoardController(BoardService boardService) {

		this.boardService = boardService;
	}

	@RequestMapping(value = "List.do", method = RequestMethod.GET)
	public ModelAndView list(Locale locale, ModelAndView mav, BoardVo vo,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "type", defaultValue = "") String type, CriteriaBoard cri, HttpSession session)
			throws Exception {

		System.out.println("cri = " + cri);
		System.out.println("####################type : " + cri.getType());
		System.out.println("####################keyword : " + cri.getKeyword());

		String member_id = (String) session.getAttribute("userid");
		if (member_id == null) {
			member_id = "";
		}
		int BoardCnt = boardService.BoardListCnt(cri);
		cri.setMember_id(member_id);
		PagingBoard pageMaker = new PagingBoard();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(BoardCnt);

		List<Map<String, Object>> list = boardService.Boardlist(cri);

		mav.addObject("list", list);
		mav.addObject("pageMaker", pageMaker);
		mav.addObject("type", type);
		mav.addObject("keyword", keyword);
		mav.setViewName("/board/List");
		System.out.println("list : " + list);

		return mav;
	}

	@RequestMapping(value = "Write.do", method = RequestMethod.GET)
	public ModelAndView write(Locale locale, ModelAndView mav, BoardVo vo, HttpServletRequest request) {

		mav.setViewName("/board/Write");

		return mav;
	}

	@RequestMapping(value = "WriteProcess.do", method = RequestMethod.POST)
	public String WriteProcess(Locale locale, BoardVo vo, MultipartHttpServletRequest request) throws Exception {

		String filename = "-";
		if (!vo.getFiles().isEmpty()) {
			filename = vo.getFiles().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				System.out.println("path =" + path);

				new File(path).mkdir();
				vo.getFiles().transferTo(new File(path + filename));
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		vo.setFilename(filename);
		boardService.insert(vo);

		return "redirect:/board/List.do";
	}

	// 게시물 상세보기
	@RequestMapping(value = "View.do/{bidx}")
	public String View(@PathVariable("bidx") Integer bidx, BoardVo vo, Model mav, CriteriaBoard cri,
			@RequestParam(value = "keyword", defaultValue = "") String keyword,
			@RequestParam(value = "type", defaultValue = "") String type,
			@RequestParam(value = "PerPageNum", defaultValue = "10") Integer PerPageNum,
			@RequestParam(value = "page", defaultValue = "1") Integer page) {

		int BoardCnt = boardService.BoardListCnt(cri);
		PagingBoard pageMaker = new PagingBoard();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(BoardCnt);
		pageMaker.getCri().setPerPageNum(PerPageNum);
		pageMaker.getCri().setPage(page);

		mav.addAttribute("vo", boardService.View(vo));
		mav.addAttribute("pageMaker", pageMaker);
		mav.addAttribute("type", cri.getType());
		mav.addAttribute("keyword", cri.getKeyword());
		System.out.println("filename : " + vo.getFilename());
		System.out.println("file1 : " + vo.getFiles());

		return "board/View";

	}
	
	//게시물 수정하기
	@RequestMapping("Modify.do/{bidx}")
	public String Modify(@PathVariable("bidx") Integer bidx,BoardVo vo, Model mav, HttpServletRequest request) {
		
		
		System.out.println("######################수정페이지");
		
		
		mav.addAttribute("vo", boardService.View(vo));
		
		
		return "board/Modify";
		
	}

	@RequestMapping("Update.do")
	public String update(BoardVo vo, HttpServletRequest request) {
	 
		System.out.println("######################수정 처리 페이지");
	
		
		// ---파일 업로드 관련 --
		
		String filename = "-";
		if(!vo.getFiles().isEmpty()) {
			filename = vo.getFiles().getOriginalFilename();
			try {
				ServletContext application = request.getSession().getServletContext();
				String path = application.getRealPath("/resources/images/");
				System.out.println("path =" +path);
				
				new File(path).mkdir();
				vo.getFiles().transferTo(new File(path+filename));
			} catch (Exception e) {
                 e.printStackTrace();
			}
			vo.setFilename(filename);
			
			
		}
		
		System.out.println("#########################" + vo.getFilename());
		
		
		
		boardService.update(vo);
		return "redirect:/board/List.do";
		
	}
	
	@RequestMapping("Delete.do/{bidx}")
	public String Delete(@PathVariable("bidx") Integer bidx,HttpServletRequest request, BoardVo vo) {
						
		System.out.println("###################삭제 페이지");
		
		String filename = boardService.file_info(bidx);
		
		if(filename != null && !filename.equals("-")) {
			ServletContext application = request.getSession().getServletContext();
			String path = application.getRealPath("/resources/images/");
			File f = new File(path+filename);
			
			if(f.exists())
				f.delete();
		}
		
		
		
		boardService.delete(bidx);
		
		return "redirect:/board/List.do";
		}
}
