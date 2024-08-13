package folio.port.module;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class module_sns {
	
	public String module_sns(String ctel) throws CoolsmsException {
			
		String api_key = "";
		String api_secret = "";
		Message coolsms = new Message(api_key, api_secret);
		
		// 인증 번호 랜덤 생성
		Random rand  = new Random();
	    String numStr = "";
	    for(int i=0; i<6; i++) {
	       String ran = Integer.toString(rand.nextInt(10));
	       numStr+=ran;
	    }          
	
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", ctel);    
	    params.put("from", "");  
	    params.put("type", "sms"); 
	    params.put("text", "인증번호는 [" + numStr + "] 입니다.");
	
	    coolsms.send(params);
	        
	    return numStr;
	
	}
	
}
