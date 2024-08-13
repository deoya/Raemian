package folio.port.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import folio.port.domain.adminDAO;
import folio.port.service.LoginService;
import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@Log4j
@AllArgsConstructor
public class LoginController {
	
	
	private LoginService service;

	@GetMapping({"/raemian_admin/logoutpage","/raemian_admin/ramian_admin_login", "/admin_ship", "/config_main","/portfolio_guidepage"})
	public void getemapping() {}
	
	
	// --[아이디 중복체크]-------------- 
	@GetMapping("/idcheck")
	@ResponseBody
	public String idcheck(@RequestParam("aid") String aid){
		if(service.idcheck(aid) == 0) { return "ok";
		}else { return "no";}
		
	}
	
	// --[회원가입]-------------- 
	@PostMapping("/memberInsert")
	public String memberInsert(@ModelAttribute adminDAO dao,@RequestParam("atell") String[] atel, Model m) {
		dao.setAtel(atel[0]+atel[1]+atel[2]);
		String result = service.memberInsert(dao);
	
		m.addAttribute("result",result);
		return "resultpage";
	}
	
}
