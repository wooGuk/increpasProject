package mybatis.vo;

public class FreeCommVO {
	private String seq_com, // 댓글의 기본키
		content, // 글내용
		write_date, // 글쓴날짜
		id,
		password,
		seq,
		status;

	public String getSeq_com() {
		return seq_com;
	}

	public void setSeq_com(String seq_com) {
		this.seq_com = seq_com;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWrite_date() {
		return write_date;
	}

	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
}

