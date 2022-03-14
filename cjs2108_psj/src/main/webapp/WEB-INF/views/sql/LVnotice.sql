create table LVnotice(
	idx int not null auto_increment,      	/* 게시글의 고유번호 */
	name varchar(20) not null, 							/* 관리자 이름 */
	title varchar(100) not null,						/* 공지사항 제목	*/
	content text not null,									/* 글내용	*/
	dateNow datetime not null default now(),	/* 글쓴 날짜 (현재)	*/
	hostIp varchar(50) not null,						/* 접속 IP주소 */
	mid varchar(20) not null,								/* 회원 아이디(게시글 검색) */
	primary key(idx)												/* 기본키 : 글 고유번호 */
);