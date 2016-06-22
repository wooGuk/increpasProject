	/*
	제 목 : MatchVO.java
	역 할 : 경기 데이터 파일
	로 그 : 1.프로그램 최초 생성(오우석 2016/06/09)
			2.페이징 기법을 위한 nowPage객체 생성(오우석 2016/06/10)
			3.팀명출력을 위한 teamName 메소드 추가(오우석 2016/06/15)
			4.웹페이지에서 오늘 날짜와 비교하기 위한 메소드 추가 오우석(2016/06/15)
			5.홈구장 출력을 위한 메소드 추가(오우석 2016/06/20)
			6.테이블 변경으로 인한 변수와 게터 세터 추가 (오우석 2016/06/21)
	*/
package mybatis.vo;

import java.sql.Date;
import java.util.Calendar;

public class MatchVO {
	private int match_code, home_code, away_code, result;
	private int match_year,match_month,match_day,match_hour,home_score,away_score;
	private String home_pitcher,away_pitcher;
	
	
	public int getHome_score() {
		return home_score;
	}
	public void setHome_score(int home_score) {
		this.home_score = home_score;
	}
	public int getAway_score() {
		return away_score;
	}
	public void setAway_score(int away_score) {
		this.away_score = away_score;
	}
	public String getHome_pitcher() {
		return home_pitcher;
	}
	public void setHome_pitcher(String home_pitcher) {
		this.home_pitcher = home_pitcher;
	}
	public String getAway_pitcher() {
		return away_pitcher;
	}
	public void setAway_pitcher(String away_pitcher) {
		this.away_pitcher = away_pitcher;
	}
	public int getMatch_hour() {
		return match_hour;
	}
	public void setMatch_hour(int match_hour) {
		this.match_hour = match_hour;
	}
	public int getMatch_year() {
		return match_year;
	}
	public int getMatch_day() {
		return match_day;
	}
	public void setMatch_year(int match_year) {
		this.match_year = match_year;
	}
	public int getMatch_month() {
		return match_month;
	}
	public void setMatch_month(int match_month) {
		this.match_month = match_month;
	}
	public void setMatch_day(int match_day) {
		this.match_day = match_day;
	}
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
//	홈구장 출력을 위한 메소드 추가(오우석 2016/06/15)
	public String homeName(int teamCode){
		switch (teamCode) {
		case 1:
			return "잠실";	
		case 2:
			return "마산";
		case 3:
			return "고척";
		case 4:
			return "잠실";
		case 5:
			return "대구";
		case 6:
			return "사직";
		case 7:
			return "문학";
		case 8:
			return "광주";
		case 9:
			return "대전";
		case 10:
			return "수원";
		}
		return "없음";
	}
	
	//웹페이지에서 오늘 날짜와 비교하기 위한 메소드 추가 오우석(2016/06/15)
	public int findToday(){
		Calendar cal = Calendar.getInstance();
		return cal.get(Calendar.DATE);
	}

}
