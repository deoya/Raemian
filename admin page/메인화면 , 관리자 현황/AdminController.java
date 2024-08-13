package folio.port.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import folio.port.module.module2;
import folio.port.service.AdminService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/raemian_admin/admin/*")
public class AdminController {
	@Autowired
	private AdminService service;
	
	//--[데이터 출력]----------
	@GetMapping("/admin_main")
	public void admin_main(Model m) {
		//일반회원 : 1개만 출력
		m.addAttribute("customer", service.getcustomer());
		// 1:1 문의 사항 리스트 : 1개만 출력
		m.addAttribute("faq", service.getfaq());
		// 예약현황 리스트 : 2개만 출력
		m.addAttribute("reserve", service.getreserve());
	}
	//--[데이터 출력]----------
	@RequestMapping("/config_main")
	public void config_main(Model m,@RequestParam(required = false, defaultValue = "0") int page,
			@RequestParam(required = false,defaultValue = "") String search,
			@RequestParam(required = false,defaultValue = "이름") String search_ch,
			@RequestParam(required = false,defaultValue = "전체") String search_assign
			
			) {
		
		search = search.replaceAll(" ", "");
		search = search.replaceAll("-", "");
		
		module2 m2 = new module2();
		ArrayList<Integer> result = m2.pg(page, 10);
		
		m.addAttribute("view_no",  result.get(1));
		
		if(search.length() == 0) {
			if(search_assign.equals("전체") ) {
				m.addAttribute("list", service.select_pg(result.get(0)));
				m.addAttribute("All_list", service.getList());
			}else { //검색내용은 없지만 소속을 검색 하였을 때
				m.addAttribute("list",service.select_assign_pg(result.get(0),search_assign)); 
				m.addAttribute("All_list",service.select_assignList(search_assign)); 
			}
		}else {
			// 소속은 전체 였을시
			if(search_assign.equals("전체")) {
				m.addAttribute("list",service.select_search_pg(result.get(0),search,search_ch)); 
				m.addAttribute("All_list",service.select_search(search,search_ch)); 
			}
			// 소속도 함께 검색
			else {
				m.addAttribute("list",service.select_search_assign_pg(result.get(0),search,search_ch,search_assign)); 
				m.addAttribute("All_list",service.select_search_assign(search,search_ch, search_assign)); 
			}
		}
		m.addAttribute("search", search);
		m.addAttribute("search_ch", search_ch);
		m.addAttribute("search_assign", search_assign);
		
	}
	//--[관리자 현황 변경]----------
	@GetMapping("/appupdate")
	@ResponseBody
	public int appupdate(@RequestParam int aidx,@RequestParam String approval) {
		return service.appupdate(aidx,approval);
	}
	

}
