create table LVbooking(
	idx int not null auto_increment primary key, /* 고유번호	*/
	mid varchar(20) not null, 									 /* 회원 고유 아이디	*/
	name varchar(20) not null, 									 /* 회원 이름 	*/
	booDate varchar(20) not null,    						 /* 예약 날짜	*/
	booTime varchar(10) not null 								 /* 시간 */
);

drop table LVbooking;
select * from LVbooking;
desc LVbooking;