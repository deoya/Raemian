package folio.port.module;

public class module1 {
	String output = null;
	public String move(String aa, String bb ) {
		this.output = "<script>alert('"+aa+"');"
				+ "location.href='"+bb+"';"
				+ "</script>";
		return this.output;
	}
	public String back(String aa) {
		this.output = "<script>alert('"+aa+"');"
				+ "history.go(-1);"
				+ "</script>";
		return this.output;
	}
}
