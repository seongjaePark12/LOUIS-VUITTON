create table LVquestion(
	idx int not null auto_increment,      	/* 게시글의 고유번호 */
	mid varchar(20) not null,								/* 아이디 */
	title varchar(100) not null,						/* 게시글의 글 제목	*/
	what varchar(20) not null,							/* 문의유형	*/
	content text not null,									/* 글내용	*/
	dateNow datetime not null default now(),	/* 작성일 */
	hostIp varchar(50) not null,						/* 접속 IP주소 */
	anser int default 0,										/* 답변대기 0:답변대기 1:답변완료 */
	primary key(idx)												/* 기본키 : 글 고유번호 */	
);
select * from LVquestion;
drop table LVquestion;
drop table questionReply;

create table questionReply (
	idx int not null auto_increment primary key, 	/* 댓글의 고유번호	*/
	questionIdx int not null,												/* 원본글의 고유번호(외래키지정)	*/
	mid varchar(20) not null,											/* 올린이의 아이디	*/
	dateNow datetime default now(),									/* 댓글 기록 날짜	*/
	hostIp varchar(50) not null,									/* 댓글쓴 PC의 IP	*/
	content text not null,												/* 댓글 내용	*/
	foreign key(questionIdx) references LVquestion(idx) 
	on update cascade
	on delete restrict
);

