create table LVSimple(
	idx int not null auto_increment,      	/* 게시글의 고유번호 */
	title varchar(100) not null,						/* 게시글의 글 제목	*/
	what varchar(20) not null,							/* 분류	*/
	content text not null,									/* 글내용	*/
	primary key(idx)												/* 기본키 : 글 고유번호 */
);
drop table LVSimple;
select * from LVSimple;