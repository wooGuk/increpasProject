	/*
	제 목 : MatchVO.java
	역 할 : 경기 데이터 파일
	로 그 : 1.프로그램 최초 생성(오우석 2016/06/09)
			2.페이징 기법을 위한 nowPage객체 생성(오우석 2016/06/10)
			3.팀명출력을 위한 teamName 메소드 추가(오우석 2016/06/15)
	*/
package mybatis.vo;

public class MatchVO {
	private int match_code, home_code, away_code, result;
	private String day;
	//페이징 기법을 위한 nowPage객체 생성(오우석 2016/06/10)
	private int nowPage;
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
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
//	팀명출력을 위한 teamName 메소드 추가(오우석 2016/06/15)
	public String teamName(int teamCode){
		switch (teamCode) {
		case 1:
			return "두산";	
		case 2:
			return "NC";
		case 3:
			return "넥센";
		case 4:
			return "LG";
		case 5:
			return "삼성";
		case 6:
			return "롯데";
		case 7:
			return "SK";
		case 8:
			return "기아";
		case 9:
			return "한화";
		case 10:
			return "KT";
		}
		return "없음";
	}


}
