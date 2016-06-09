package mybatis.vo;

public class MatchVO {
	private int match_code, home_code, away_code, result;
	private String day;
	public int getMatch_code() {
		return match_code;
	}
	public void setMatch_code(int match_code) {
		this.match_code = match_code;
	}
	public int getHome_code() {
		return home_code;
	}
	public void setHome_code(int home_code) {
		this.home_code = home_code;
	}
	public int getAway_code() {
		return away_code;
	}
	public void setAway_code(int away_code) {
		this.away_code = away_code;
	}
	public int getResult() {
		return result;
	}
	public void setResult(int result) {
		this.result = result;
	}
	public String getDay() {
		return day;
	}
	public void setDay(String day) {
		this.day = day;
	}

	


}
