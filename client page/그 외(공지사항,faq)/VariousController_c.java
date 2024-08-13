package folio.port.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import folio.port.domain.noticeDAO;
import folio.port.module.module1;
import folio.port.module.module2;
import folio.port.service.VariousService_c;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/raemian_client/various/*")
public class VariousController_c {
	module1 module1 = new module1();
	module2 m2 = null;
	
	@Autowired
	private VariousService_c service;
	
	//--[FAQ 데이터 출력]-------------------
	@GetMapping("/faq")
	public void faq(Model m) {
		m.addAttribute("list", service.faqList());
	}
	//--[공지사항 데이터 출력]-------------------
	@RequestMapping("/notice")
	public void notice(Model m,@RequestParam(required = false, defaultValue = "0") int page, @RequestParam(required = false,defaultValue = "") String search) {
		this.m2 = new module2();
		ArrayList<Integer> result = m2.pg(page, 10);
		
		m.addAttribute("view_no", result.get(1));
		if(search.length() == 0) {
			m.addAttribute("list", service.notice_select_pg(result.get(0)));
			m.addAttribute("All_list", service.noticeList());
		}else {
			m.addAttribute("list",service.notice_select_search_pg(result.get(0),search)); 
			m.addAttribute("All_list",service.notice_select_search(search)); 
		}
		m.addAttribute("search", search);
	}
	//--[공지사항 단일 데이터 출력]-------------------
	@GetMapping("/notice_view/{nidx}")
	public String notice_view(@PathVariable int nidx, Model m) {
		noticeDAO result = service.getNotice(nidx);
		if(result == null) {
			module1.back("오류가 발생했습니다 [번호 : 042]");
			return "resultpage_c";
		}else {
			m.addAttribute("data", result);
			return "/raemian_client/various/notice_view";
		}
	}
	
	 
}
