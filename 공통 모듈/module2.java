package folio.port.module;

import java.util.ArrayList;

public class module2 {
	int pg_l= 0; // limit 
	int view_no = 1; // 보낼 페이지 변수 
	
	
	
	public ArrayList<Integer> pg (int page, int num) {
		if(page==1 || page==0) {
			pg_l = 0;
		}
		else {
			int pg = (page*num)-num;
			
			view_no = page;
			pg_l = pg;
		}
		
		ArrayList<Integer> p = new ArrayList<Integer>();
		p.add(pg_l);
		p.add(view_no);
		
		return p;
	}
	
	
}
