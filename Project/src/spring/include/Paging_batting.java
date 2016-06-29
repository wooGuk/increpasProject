package spring.include;
 
public class Paging_batting {
	private int nowPage,rowTotal,blockList,blockPage,totalPage,startPage,endPage,begin,end;
	private boolean isPrePage; // 이전기능 가능여부
	private boolean isNextPage;
	private StringBuffer sb; // 뷰 페이지(JSP)에서 표현할 페이징 HTML코드를 저장할 객체
	
	
	// 페이지 값을 연산하기 위한 생성자
	public Paging_batting(int nowPage,int rowTotal, int blockList, int blockPage ){
		this.nowPage = nowPage;
		this.rowTotal = rowTotal;
		this.blockList = blockList;
		this.blockPage = blockPage;
		
		// 이전기능과 다음기능을 초기화한다.
		isPrePage = false;
		isNextPage = false;
//		isPrePage = isNextPage = false; 
		
		// 입력된 전체게시물의 수를 통해 전체 페이지 수를 구한다.
		totalPage = (int)Math.ceil(rowTotal/(double)blockList);
		/*totalPage = rowTotal/blockList;
		if(rowTotal%blockList != 0)
			totalPage++;*/
		
		// 현재 페이지의 값이 전체 페이지 수 보다 크다면 
		// 전체 페이지 수를 현재 페이지 값으로 변경한다.
		if(nowPage > totalPage)
			nowPage = totalPage;
		
		// 현재 블럭의 시작페이지와 마지막페이지 값 구하기
		startPage = (int)((nowPage-1)/blockPage)*blockPage+1;
		endPage = startPage + blockPage -1;
		
		// 마지막 페이지가 전체 페이지 수를 넘지 못하게하자
		if(endPage > totalPage)
			endPage = totalPage;
		
		// 현재 페이지 값에 의해 시작 게시물의 index값과
		// 마지막으로 표현할 게시물 index값 구하기
		begin = (nowPage-1) * blockList +1;
		end = begin + blockList -1;
		
		// 이전 기능 가려내기
		if(startPage > 1)
			isPrePage = true;
		
		// 다음 기능 가려내기
		if(endPage < totalPage)
			isNextPage = true;
		
		// 페이징 기법에 필요한 HTML코드 생성하기
		sb = new StringBuffer();
		
		if(isPrePage){
			sb.append("<img src='images/button/but_prev.gif' ");
			sb.append("onclick='");
			sb.append("javascript:location.href=\"");
			sb.append("mypageCheck.inc?nowPage=");
			sb.append(nowPage-blockPage);
			sb.append("\"' style='cursor:pointer'>");
		}else{
			sb.append("<img src='images/button/but_prev.gif'/>");
		}
		
		sb.append("|");
		
		// 페이지번호를 출력하는 반복문
		for (int i = startPage; i <= endPage; i++) {
			// 페이지번호가 전체 페이지 수보다 클 때는 반복문 탈출!
			if(i > totalPage)
				break;
			
			// 페이지 번호가 현재 페이지 값과 같다면 링크는 미적용
			// 현재 페이지를 의미하기 위해 다르게 표현한다
			if(i == nowPage){
				sb.append("&nbsp;<span style='");
				sb.append("color:#91B7EF");
				sb.append("font-weight: bold'>");
				sb.append(i);
				sb.append("</span>");
			}else{
				// i가 값이 현재 페이지값과 다를 경우
				sb.append("&nbsp; <a href='mypageCheck.inc?");
				sb.append("nowPage=");
				sb.append(i); // nowPage 파라미터 값
				sb.append("'>");
				sb.append(i);
				sb.append("</a>");
			}
			
		} // for문의 끝
		sb.append("&nbsp;|");
		
		// 다음 기능 적용여부
		if(isNextPage){
			sb.append("<img src='images/button/");
			sb.append("but_next.gif' onclick='");
			sb.append("javascript:location.href=");
			sb.append("\"mypageCheck.inc?nowPage=");
			sb.append(nowPage+blockPage);
			sb.append("\"' style='cursor:pointer'>");
		}else{
			sb.append("<img src='images/button/but_next.gif'>");
		}
	}
	
	
	public int getNowPage() {
		return nowPage;
	}
	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
	}
	public int getRowTotal() {
		return rowTotal;
	}
	public void setRowTotal(int rowTotal) {
		this.rowTotal = rowTotal;
	}
	public int getBlockList() {
		return blockList;
	}
	public void setBlockList(int blockList) {
		this.blockList = blockList;
	}
	public int getBlockPage() {
		return blockPage;
	}
	public void setBlockPage(int blockPage) {
		this.blockPage = blockPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartPage() {
		return startPage;
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return endPage;
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	public int getBegin() {
		return begin;
	}
	public void setBegin(int begin) {
		this.begin = begin;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	public boolean isPrePage() {
		return isPrePage;
	}
	public void setPrePage(boolean isPrePage) {
		this.isPrePage = isPrePage;
	}
	public boolean isNextPage() {
		return isNextPage;
	}
	public void setNextPage(boolean isNextPage) {
		this.isNextPage = isNextPage;
	}
	public StringBuffer getSb() {
		return sb;
	}
	public void setSb(StringBuffer sb) {
		this.sb = sb;
	}
	
	
}
