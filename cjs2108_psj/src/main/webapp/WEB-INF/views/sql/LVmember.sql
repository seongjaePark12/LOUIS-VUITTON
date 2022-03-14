show tables;
desc LVmember;

create table LVmember(
	idx int not null auto_increment,
	mid varchar(20) not null,								/* 아이디 */
	pwd varchar(100) not null,							/* 비밀번호 */
	name varchar(20) not null,							/* 이름	*/					
	birth datetime default now(),						/* 생년월일 */
	email varchar(50) not null,							/* 이메일 */
	getCode varchar(15) not null,						/* 전화번호 */
	address varchar(50),										/* 주소 */
	emailInfor char(6) default 'N',					/* 이메일체크 */
	userDel char(2) default 'NO',						/* 회원 탈퇴 신청 여부(OK:탈퇴신청한회원, NO: 현재가입중인회원)	*/
	point int default 3000,									/* 포인트(최초가입회원은 3000, 한번 방문시마다 50)	*/
	level	int default 4,										
	visitCnt int default 0,									/* 방문횟수 */
	startDate datetime default now(),				/* 최초 가입일 */
	lastDate datetime default now(),				/* 마지막 접속일 */
	todayCnt int default 0,									/* 오늘 방문한 횟수	*/
	primary key(idx, mid)										/* 기본키 : 고유번호,아이디	*/
);