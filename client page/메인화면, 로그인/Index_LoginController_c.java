package folio.port.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import folio.port.domain.customerDAO;
import folio.port.service.Index_LoginService_c;
import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Log4j
@Controller
@RequestMapping("/raemian_client/*")
public class Index_LoginController_c {
	
	@Autowired
	private Index_LoginService_c service;

	@GetMapping({"/logoutpage","/userlogin","/sub01","/sub02","/sub03","/join_agree","/search"})
	public void home() {
		
	}
	//--[join_agree를 거치지않고 다이렉트로 /join_member를 입력해서 들어왔을 경우]-------------------------------
	@RequestMapping("/join_member")
	public String join_member(@RequestParam(value="ck", required = false, defaultValue = "no") String ck) {
		if(ck.equals("no")) {
			return "redirect:/raemian_client/join_agree";
		}
		return null;
	}
	//--[회원가입]-------------------------------
	@PostMapping("/insert")
	public String insert(@ModelAttribute customerDAO dao, Model m) {
		m.addAttribute("result",service.insert(dao));
		return "resultpage_c";
	}
	//--[info 데이터 출력]--------------------------
	@GetMapping("/index")
	public void index(Model m) {
		m.addAttribute("infoList", service.infoList());
	}
	//--[회원가입시 인증번호]--------------------------
	@GetMapping("/tel_ck")
	@ResponseBody
	public String tel_ck(@RequestParam String ctel) throws CoolsmsException {
		return service.tel_ck(ctel);
	}
	//--[회원가입시 아이디 중복 체크]--------------------------
	@GetMapping("/idcheck")
	@ResponseBody
	public String idcheck(@RequestParam("cid") String cid){
		if(service.idcheck(cid) == 0) { return "ok";
		}else { return "no";}
		
	}
	//--[아이디/비번 찾기]-------------------------------
	@PostMapping("/searchResult")
	public void searchResult(Model m,@RequestParam("cri") String cri, @ModelAttribute customerDAO dao) {
		if(cri.equals("id")) {
			m.addAttribute("result", service.idsearch(dao));
		}else {
			List<customerDAO> result =  service.pwdsearch(dao);
			m.addAttribute("result",result.size());
			m.addAttribute("cidx", result.get(0).getCidx());
		}
		m.addAttribute("cri", cri);
	}
	//--[비번 변경]--------------------------------
	@PostMapping("/pwdupdate")
	public String pwdupdate(Model m, @ModelAttribute customerDAO dao) {
		m.addAttribute("result",service.pwdupdate(dao)); 
		return "resultpage_c";
	}
}
