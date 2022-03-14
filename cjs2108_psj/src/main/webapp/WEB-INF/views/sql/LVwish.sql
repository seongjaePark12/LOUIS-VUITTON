
/* 위시리스트 테이블 */
create table LVwish (
  idx   int not null auto_increment,			/* 장바구니 고유번호 */
  mid   varchar(20) not null,							/* 장바구니를 사용한 사용자의 아이디 - 로그인한 회원 아이디이다. */
  productIdx  int not null,								/* 장바구니에 구입한 상품의 고유번호 */
  productName varchar(50) not null,				/* 장바구니에 담은 구입한 상품명 */
  productCode varchar(20) not null,				/* 장바구니에 담은 구입한 상품코드 */
  disPrice   int not null,								/* 메인상품의 할인 가격 */
  productMainImg		varchar(100) not null,			/* 서버에 저장된 상품의 메인 이미지 */
  wish char(2) default 0,										/* 좋아요 처리	*/
  primary key(idx, mid),
  foreign key(productIdx) references LVproduct(idx) on update cascade on delete cascade
);
drop table LVwish;

