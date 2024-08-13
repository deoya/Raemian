package folio.port.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import folio.port.domain.reserveDAO;
import folio.port.service.ReservationService_c;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/raemian_client/reservation/*")
public class ReservationController_c {
	@Autowired
	private ReservationService_c service;

	@GetMapping({"/reservation_cancel","/reservation_ck","/reservation_in"})
	public void getmapping() {}
	
	//--[예약 등록]-----------------------
	@PostMapping("/insert")
	public String insert(Model m,@ModelAttribute reserveDAO dao,@RequestParam("date") String date, @RequestParam("time") String time) throws Exception{
	    m.addAttribute("result",service.insert(dao, date, time));
		return "resultpage_c";
	}
	//--[예약 확인]-----------------------
	@GetMapping("/ck")
	@ResponseBody
	public String ck(@RequestParam("cidx") int cidx) {
		return service.count(cidx);
	}
	//--[예약 수정 횟수 카운팅]-----------------------
	@GetMapping(value="/idxck", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public JSONObject reservation_cancel(@RequestParam("idx") int idx,Model m) {
		return service.getdata(idx);
	}
	//--[예약 취소]-----------------------
	@PostMapping("/delete")
	public String delete(@RequestParam("idx") int idx,Model m) {
		m.addAttribute("result",service.delete(idx));
		return "resultpage_c";
	}
	//--[예약 수정]-----------------------
	@PostMapping("/update")
	public String update(Model m, @ModelAttribute reserveDAO dao, @RequestParam("date") String date, @RequestParam("time") String time) throws ParseException {
		m.addAttribute("result",service.update(dao,date,time));
		return "resultpage_c";
	}

}
