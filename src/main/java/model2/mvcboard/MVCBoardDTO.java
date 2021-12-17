package model2.mvcboard;
/*
DTO(Data Transfer Object)
	: JSP와 Java파일간에 데이터를 전달하기 위한 객체.
	  자바빈 규약에 의해 제작한다.
 */
public class MVCBoardDTO {
	// 멤버변수 : board테이블의 컬럼과 동일한 이름으로 생성
    private String idx; 		// 게시물 일련번호
    private String name;		// 작성자
    private String title;		// 제목
    private String content;		// 내용
    private java.sql.Date postdate;// 작성일
    private String ofile;		// 기존의 파일명
    private String sfile;		// 서버에 저장된 파일명
    private int downcount;		// 다운로드 횟수
    private String pass;		// 비밀번호
    private int visitcount;		// 조회수

    // 게터/세터
    public String getIdx() { 
        return idx;
    }
    public void setIdx(String idx) {
        this.idx = idx;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
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
    public java.sql.Date getPostdate() {
        return postdate;
    }
    public void setPostdate(java.sql.Date postdate) {
        this.postdate = postdate;
    }
    public String getOfile() {
        return ofile;
    }
    public void setOfile(String ofile) {
        this.ofile = ofile;
    }
    public String getSfile() {
        return sfile;
    }
    public void setSfile(String sfile) {
        this.sfile = sfile;
    }
    public int getDowncount() {
        return downcount;
    }
    public void setDowncount(int downcount) {
        this.downcount = downcount;
    }
    public String getPass() {
        return pass;
    }
    public void setPass(String pass) {
        this.pass = pass;
    }
    public int getVisitcount() {
        return visitcount;
    }
    public void setVisitcount(int visitcount) {
        this.visitcount = visitcount;
    }
}