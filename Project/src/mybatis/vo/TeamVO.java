	/*
	제 목 : TeamVO.java
	역 할 : 팀 데이터 파일
	로 그 : 1.프로그램 최초 생성(정성훈 2016/06/20)
	*/

package mybatis.vo;

public class TeamVO {
	private String team_code, name, rank, win, lose, team_avg, team_era;

	public String getTeam_code() {
		return team_code;
	}

	public void setTeam_code(String team_code) {
		this.team_code = team_code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getRank() {
		return rank;
	}

	public void setRank(String rank) {
		this.rank = rank;
	}

	public String getWin() {
		return win;
	}

	public void setWin(String win) {
		this.win = win;
	}

	public String getLose() {
		return lose;
	}

	public void setLose(String lose) {
		this.lose = lose;
	}

	public String getTeam_avg() {
		return team_avg;
	}

	public void setTeam_avg(String team_avg) {
		this.team_avg = team_avg;
	}

	public String getTeam_era() {
		return team_era;
	}

	public void setTeam_era(String team_era) {
		this.team_era = team_era;
	}
	
	
}
