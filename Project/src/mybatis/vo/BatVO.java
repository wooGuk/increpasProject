package mybatis.vo;

public class BatVO {
	private int bat_code,match_code,re_result,ac_result,bat_cost;
	private String id, bat_avg;
	public int getBat_code() {
		return bat_code;
	}
	public void setBat_code(int bat_code) {
		this.bat_code = bat_code;
	}
	public int getMatch_code() {
		return match_code;
	}
	public void setMatch_code(int match_code) {
		this.match_code = match_code;
	}
	public int getRe_result() {
		return re_result;
	}
	public void setRe_result(int re_result) {
		this.re_result = re_result;
	}
	public int getAc_result() {
		return ac_result;
	}
	public void setAc_result(int ac_result) {
		this.ac_result = ac_result;
	}
	public int getBat_cost() {
		return bat_cost;
	}
	public void setBat_cost(int bat_cost) {
		this.bat_cost = bat_cost;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBat_avg() {
		return bat_avg;
	}
	public void setBat_avg(String bat_avg) {
		this.bat_avg = bat_avg;
	}
	
	
}