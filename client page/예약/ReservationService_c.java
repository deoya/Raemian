package folio.port.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import folio.port.domain.reserveDAO;
import folio.port.mapper.ReservationMapper_c;
import folio.port.module.module1;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class ReservationService_c {
	module1 module1 = new module1();
	
	@Setter(onMethod_= @Autowired)
	private ReservationMapper_c mapper;
	
	//--[예약 등록]-----------------------
	public String insert(reserveDAO dao, String date, String time) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
		dao.setReservedate(dateFormat.parse(date));
		dao.setReservetime(timeFormat.parse(time));
		
		if(mapper.insert(dao) > 0) { return module1.move("예약이 완료되었습니다", "/r/raemian_client/index");}
		else { return module1.back("예약에 실패하였습니다 [번호 : 023]");}
	}
	//--[예약 수정 횟수 카운팅]-----------------------
	public String count(int cidx) {
		if(mapper.count(cidx) > 0) { return "no"; }
		else { return "yes";}
	}
	//--[예약 확인]-----------------------
	public JSONObject getdata(int idx) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
		reserveDAO data = mapper.getdata(idx);
		
		JSONObject json = new JSONObject();
        json.put("reservedate", dateFormat.format(data.getReservedate()));
        json.put("reservetime", timeFormat.format(data.getReservetime()));
        json.put("rpersonnel", data.getRpersonnel());
        json.put("updatecnt", data.getUpdatecnt());
		return json;
	} 
	//--[예약 취소]-----------------------
	public String delete(int idx) {
		if(mapper.delete(idx) > 0) { return module1.move("사전방문 예약 취소가 완료되었습니다", "/r/raemian_client/index");}
		else { return module1.back("예약 취소에 실패하였습니다 [번호 : 026]");}
	}
	//--[예약 수정]-----------------------
	public String update(reserveDAO dao, String date, String time) throws ParseException {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat timeFormat = new SimpleDateFormat("HH:mm");
		dao.setReservedate(dateFormat.parse(date));
		dao.setReservetime(timeFormat.parse(time));
		
		if(mapper.update(dao) > 0) { return module1.move("예약이 정상적으로 변경 완료 되었습니다","/r/raemian_client/reservation/reservation_cancel");
		}else { return module1.back("변경에 실패하였습니다 [번호 : 030]");}
	}
	
}
