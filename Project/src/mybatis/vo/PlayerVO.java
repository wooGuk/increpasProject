	/*
	제 목 : PlayerVO.java
	역 할 : 선수 데이터 파일
	로 그 : 1.프로그램 최초 생성(오우석 2016/06/27)
	*/
package mybatis.vo;

public class PlayerVO {
	private int TEAM_CODE;
	private String NAME,TEAM_NAME,POSITION,GAME,ATBAT,HITS,
	HOMERUN,RUN,RBI,BALLFOUR,SOUT,STEALBASE,BABIP,AVGS,OBP,SA,OPS,wOBA,WIN,LOSE,SAVE,HOLD,NOTSAVE,STARTGAME,INN,ERA;
	public int getTEAM_CODE() {
		return TEAM_CODE;
	}
	public void setTEAM_CODE(int tEAM_CODE) {
		TEAM_CODE = tEAM_CODE;
	}
	public String getNAME() {
		return NAME;
	}
	public void setNAME(String nAME) {
		NAME = nAME;
	}
	public String getTEAM_NAME() {
		return TEAM_NAME;
	}
	public void setTEAM_NAME(String tEAM_NAME) {
		TEAM_NAME = tEAM_NAME;
	}
	public String getPOSITION() {
		return POSITION;
	}
	public void setPOSITION(String pOSITION) {
		POSITION = pOSITION;
	}
	public String getGAME() {
		return GAME;
	}
	public void setGAME(String gAME) {
		GAME = gAME;
	}
	public String getATBAT() {
		return ATBAT;
	}
	public void setATBAT(String aTBAT) {
		ATBAT = aTBAT;
	}
	public String getHITS() {
		return HITS;
	}
	public void setHITS(String hITS) {
		HITS = hITS;
	}
	public String getHOMERUN() {
		return HOMERUN;
	}
	public void setHOMERUN(String hOMERUN) {
		HOMERUN = hOMERUN;
	}
	public String getRUN() {
		return RUN;
	}
	public void setRUN(String rUN) {
		RUN = rUN;
	}
	public String getRBI() {
		return RBI;
	}
	public void setRBI(String rBI) {
		RBI = rBI;
	}
	public String getBALLFOUR() {
		return BALLFOUR;
	}
	public void setBALLFOUR(String bALLFOUR) {
		BALLFOUR = bALLFOUR;
	}
	public String getSOUT() {
		return SOUT;
	}
	public void setSOUT(String sOUT) {
		SOUT = sOUT;
	}
	public String getSTEALBASE() {
		return STEALBASE;
	}
	public void setSTEALBASE(String sTEALBASE) {
		STEALBASE = sTEALBASE;
	}
	public String getBABIP() {
		return BABIP;
	}
	public void setBABIP(String bABIP) {
		BABIP = bABIP;
	}
	public String getAVGS() {
		return AVGS;
	}
	public void setAVGS(String aVGS) {
		AVGS = aVGS;
	}
	public String getOBP() {
		return OBP;
	}
	public void setOBP(String oBP) {
		OBP = oBP;
	}
	public String getSA() {
		return SA;
	}
	public void setSA(String sA) {
		SA = sA;
	}
	public String getOPS() {
		return OPS;
	}
	public void setOPS(String oPS) {
		OPS = oPS;
	}
	public String getwOBA() {
		return wOBA;
	}
	public void setwOBA(String wOBA) {
		this.wOBA = wOBA;
	}
	public String getWIN() {
		return WIN;
	}
	public void setWIN(String wIN) {
		WIN = wIN;
	}
	public String getLOSE() {
		return LOSE;
	}
	public void setLOSE(String lOSE) {
		LOSE = lOSE;
	}
	public String getSAVE() {
		return SAVE;
	}
	public void setSAVE(String sAVE) {
		SAVE = sAVE;
	}
	public String getHOLD() {
		return HOLD;
	}
	public void setHOLD(String hOLD) {
		HOLD = hOLD;
	}
	public String getNOTSAVE() {
		return NOTSAVE;
	}
	public void setNOTSAVE(String nOTSAVE) {
		NOTSAVE = nOTSAVE;
	}
	public String getSTARTGAME() {
		return STARTGAME;
	}
	public void setSTARTGAME(String sTARTGAME) {
		STARTGAME = sTARTGAME;
	}
	public String getINN() {
		return INN;
	}
	public void setINN(String iNN) {
		INN = iNN;
	}
	public String getERA() {
		return ERA;
	}
	public void setERA(String eRA) {
		ERA = eRA;
	}
	
	
}
