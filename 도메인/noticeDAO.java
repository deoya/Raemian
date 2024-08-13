package folio.port.domain;

import java.util.Date;

import lombok.Data;

@Data
public class noticeDAO implements UploadPathSettable{
	private int nidx,aidx,ncnt;
	
	private String ntitle,aname,ncontent;
	
	private Date ndate, nupdate;
	
	//---
	private String nfile, uuid,uploadPath,filetype; 
	
	@Override
    public void setUploadPath(String uploadPath) {
        this.uploadPath = uploadPath;
    }
	
	@Override
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	
	
}
