package folio.port.domain;

import java.util.Date;

import lombok.Data;


@Data
public class infoDAO implements UploadPathSettable {
	private int fidx, aidx, foutputOrder;
	private float household, houseShared, etcShared, contractArea;
	
	private String ftype, aname, fimg, uploadPath, fuse;
	private Date fdate;
	
	@Override
    public void setUploadPath(String uploadPath) {
        this.uploadPath = uploadPath;
    }
	
	@Override
	public void setFiletype(String filetype) {
	}
	
	
}
