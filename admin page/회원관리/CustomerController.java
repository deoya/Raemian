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
import folio.port.service.CustomerService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/raemian_admin/customer/*")
@AllArgsConstructor
public class CustomerController {
	@Autowired
	private CustomerService service;

	
	//---[데이터 출력]---------------
	@RequestMapping({"/member_main"})
	public void member_main(Model m,@RequestParam(required = false, defaultValue = "0") int page,
			@RequestParam(required = false,defaultValue = "") String search, @RequestParam(defaultValue = "아이디") String search_ch) {

		m.addAttribute("search",search);
		m.addAttribute("search_ch",search_ch);
		
		search = search.replaceAll(" ", "");
		search = search.replaceAll("-", "");
		
		module2 m2 = new module2();
		ArrayList<Integer> result = m2.pg(page, 20);
		
		m.addAttribute("view_no", result.get(1));
		if(search.length() == 0) {
			m.addAttribute("list",service.select_pg(result.get(0)));
			m.addAttribute("All_list", service.getList());
		}else {
			m.addAttribute("All_list", service.select_search(search, search_ch));
			m.addAttribute("list",service.select_search_pg(search, search_ch, result.get(0)));
		}
	}
	
	//---[고객 삭제]---------------
	@GetMapping(value="/delete", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String delete(@RequestParam("cidx") int cidx) {
		log.info(cidx);
		return service.delete(cidx);
	}

}
