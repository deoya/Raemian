package folio.port.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import folio.port.domain.faqDAO;
import folio.port.module.module2;
import folio.port.service.FaqService;
import folio.port.service.InfoService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/raemian_admin/faq/*")
@AllArgsConstructor
public class FaqController {
	
	@Autowired
	private FaqService service;
	
	@GetMapping("/faq_write")
	public void getmapping() {}
	
	//--[데이터 출력]----------------------
	@RequestMapping("/faq_main")
	public void faq_main(Model m, @RequestParam(required = false, defaultValue = "0") int page, @RequestParam(required = false,defaultValue = "") String search) {
		
		module2 m2 = new module2();
		ArrayList<Integer> result = m2.pg(page, 10);
		
		m.addAttribute("view_no", result.get(1));
		
		if(search.length() == 0) {
			m.addAttribute("list",service.select_pg(result.get(0)));
			m.addAttribute("All_list",service.getList());
		}else {	
			m.addAttribute("list",service.select_search_pg(result.get(0),search)); 
			m.addAttribute("All_list",service.select_search(search)); 
		}
			m.addAttribute("search", search);
	}
	
	//--[글 등록]----------------------
	@PostMapping("/insert")
	public String insert(@ModelAttribute faqDAO dao,Model m) {
		m.addAttribute("result",service.insert(dao));
		return "resultpage";
	}
	
	//--[글 삭제]----------------------
	@GetMapping(value="/delete", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String delete(@RequestParam("fqidx") int fqidx) {
		return service.delete(fqidx);
	}
	
}
