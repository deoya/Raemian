package folio.port.controller;

import java.util.ArrayList;
import java.util.List;

import javax.print.attribute.standard.Media;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import folio.port.domain.AttachDAO;
import folio.port.domain.noticeDAO;
import folio.port.module.module2;
import folio.port.service.NoticeService;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/raemian_admin/notice/*")
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@GetMapping("/notice_write")
	public void getMappig() {}
	
	//--[데이터 출력]------------------
	@RequestMapping("/notice_main")
	public void notice_main(Model m,@RequestParam(required = false, defaultValue = "0") int page, @RequestParam(required = false,defaultValue = "") String search) {
		module2 m2 = new module2();
		ArrayList<Integer> result = m2.pg(page, 10);
		
		m.addAttribute("view_no", result.get(1));
		if(search.length() == 0 || search.isEmpty()) {
			m.addAttribute("list", service.select_pg(result.get(0)));
			m.addAttribute("All_list", service.getList());
		}else {
			m.addAttribute("list",service.select_search_pg(result.get(0),search)); 
			m.addAttribute("All_list",service.select_search(search)); 
		}
		m.addAttribute("search", search);
		
		
		
		
		
	}
	//--[단일 데이터 출력]------------------
	@GetMapping("/notice_view/{nidx}")
	public String notice_view(@PathVariable int nidx, Model m) {
		m.addAttribute("data", service.get(nidx));
		m.addAttribute("files",service.filesget(nidx));
		
		return "/raemian_admin/notice/notice_view";
	}
	
	//--[글 등록]------------------
	@PostMapping("/insert")
	public String insert(@ModelAttribute noticeDAO dao,
			@RequestParam(required = false) String[] files, @RequestParam(required = false) String[] uploadPaths,
			@RequestParam(required = false) String[] uuids, @RequestParam(required = false) String[] types,
			Model m) {
		m.addAttribute("result",service.insert(dao, files, uploadPaths, uuids, types));
		return "resultpage";
	}
	
	//--[글 삭제]------------------
	@GetMapping(value="/delete", produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String delete(@RequestParam("nidx") int nidx,
			@RequestParam(value="path", required = false, defaultValue = "") String path,
			@RequestParam(value="nfile", required = false, defaultValue = "") String nfile,
			@RequestParam(value="filetype", required = false, defaultValue = "") String filetype
			) {
		return service.delete(nidx,nfile,filetype, path);
	}
	
	//--[섬네일용]------------------
	@PostMapping(value="/fileajax", produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public  ResponseEntity<List<AttachDAO>> fileajax(MultipartFile[] ajaxfile, Model m) {
		
		log.info(ajaxfile);
		
		return new ResponseEntity<>(service.fileajax(ajaxfile),  HttpStatus.OK);
	}
	
}
