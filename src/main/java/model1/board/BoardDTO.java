package model1.board;
/*
DTO(Data Transfer Object)
	: JSP와 Java파일간에 데이터를 전달하기 위한 객체.
	  자바빈 규약에 의해 제작한다.
 */
public class BoardDTO {
	// 멤버변수 : board테이블의 컬럼과 동일한 이름으로 생성
	private String num;				// 일련번호 (시퀀스를 통해 입력)
	private String title;			// 제목
	private String content;			// 내용
	private String id;				// 작성자 아이디
	private java.sql.Date postdate;	// 작성일
	private String visitcount;		// 조회수
	/*
		board테이블에 name컬럼은 존재하지 않으나,
		목록에 작성자의 이름을 출력하기 위해
		member테이블과의 join을 통해 이름을 가져온다.
	 */
	private String name;			// 작성자의 이름 (member테이블에 있는 컬럼)
	
	// 생성자 : 따로 작성하지 않아서 디폴트 생성자가 추가된다.
	
	// getter/setter 메소드
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
}
