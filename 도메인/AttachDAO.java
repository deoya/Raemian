package folio.port.domain;

import lombok.Data;

@Data
public class AttachDAO implements UploadPathSettable{
	private String nfile, uuid, uploadPath, filetype;
	
	private int nidx;
	
	@Override
    public void setUploadPath(String uploadPath) {
        this.uploadPath = uploadPath;
    }
	
	@Override
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	
}
