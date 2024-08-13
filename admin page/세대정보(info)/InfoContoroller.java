package folio.port.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import folio.port.domain.adminDAO;
import folio.port.domain.infoDAO;
import folio.port.module.module2;
import folio.port.service.InfoService;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/raemian_admin/info/*")
@AllArgsConstructor
public class InfoContoroller {
	
	@Autowired
	private InfoService service;
	
	@GetMapping("/info_write")
	public void getmapping() {}
	
	
	//--[데이터 출력]-------------------
	@RequestMapping("/info_main")
	public void info_main(Model m, @RequestParam(required = false, defaultValue = "0") int page, @RequestParam(required = false,defaultValue = "") String search) {
		module2 m2 = new module2();
		ArrayList<Integer> result = m2.pg(page, 4);
		
		m.addAttribute("view_no", result.get(1));
		
		if(search.length() == 0) {
			m.addAttribute("list",service.select_pg( result.get(0)));
			m.addAttribute("All_list",service.getList());
		}else {	
			m.addAttribute("list",service.select_search_pg( result.get(0),search)); 
			m.addAttribute("All_list",service.select_search(search)); 
		}
			m.addAttribute("search", search);
	}

	//--[단일 데이터 보기]-------------------
	@GetMapping("/info_write/{fidx}")
	public String info_write(@PathVariable int fidx, Model m) {
		infoDAO dao = service.get(fidx);
		m.addAttribute("data",dao);
		
		return "/raemian_admin/info/info_write";
	}
	
	
	//--[설정 등록]-------------------
	@PostMapping("/insert")
	public String insert(@ModelAttribute infoDAO dao, MultipartFile file,@RequestParam("idx") int idx ,Model m,
				@RequestParam(value ="o_uploadPath", required = false) String o_uploadPath,
				@RequestParam(value ="o_fimg", required = false) String o_fimg
			) {
		String category = "new"; // 같은 insert 메소드를 사용하기 위하여 추가와, 수정을 구분짓기 위함용
	
		String result = null;
		//새롭게 등록하는 경우
		if(idx == 0) {
			result = service.insert(dao, file, category);
		}
		//이미 있는 데이터에서 수정하는 경우
		else {
			dao.setFidx(idx);
			//이미지를 수정하지 않을경우
			if(file.isEmpty()) {
				result = service.update(dao);
			}
			//이미지도 수정했을 경우
			else {
				dao.setFimg(o_fimg);
				dao.setUploadPath(o_uploadPath);
				category = "update";
				result = service.insert(dao, file, category);
			}
		}
		m.addAttribute("result", result);
		return "resultpage";
	}
	//--[설정 삭제]-------------------
	@GetMapping(value="/delete", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String delete(@RequestParam("fidx") int fidx,@RequestParam("path") String path,@RequestParam("fname") String fname) {
		return service.delete(fidx, path, fname);
	}
	
	//--[사용 유/무 에서 사용함이 4개이상인지 체크]-------------
	@GetMapping(value="/usecount", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String usecount() {
		return service.usecount();
	}
}
