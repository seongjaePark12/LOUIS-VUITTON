/* 대분류 */
create table LVcategoryMain (
  categoryMainCode  char(1)  not null,				/* 대분류코드 */
  categoryMainName  varchar(20) not null,			/* 대분류명 */
  primary key(categoryMainCode)
);

/* 중분류 */
create table LVcategoryMiddle (
  categoryMainCode   char(1)  not null,				/* 대분류코드를 외래키로 지정 */
  categoryMiddleCode char(2)  not null,				/* 중분류코드 */
  categoryMiddleName varchar(20) not null,		/* 중분류명 */
  primary key(categoryMiddleCode),
  foreign key(categoryMainCode) references LVcategoryMain(categoryMainCode) on update cascade on delete restrict
);

/* 소분류 */
create table LVcategorySub (
  categoryMainCode    char(1) not null,			/* 대분류코드를 외래키로 지정 */
  categoryMiddleCode  char(2) not null,			/* 중분류코드를 외래키로 지정 */
  categorySubCode			char(3) not null,			/* 소분류코드 */
  categorySubName			varchar(20) not null,	/* 소분류명 */
  primary key(categorySubCode),
  foreign key(categoryMainCode)   references LVcategoryMain(categoryMainCode)     on update cascade on delete restrict,
  foreign key(categoryMiddleCode) references LVcategoryMiddle(categoryMiddleCode) on update cascade on delete restrict
);
select * from LVproduct where categorySubCode = 064;
select * from LVproduct where substring(productCode,4,3) = 063;
/* 상품 테이블 */
create table LVproduct (
  idx int not null auto_increment, /* 상품 고유번호 */
  categoryMainCode   char(1)  not null,		 /*대분류코드 외래키지정 */
  categoryMiddleCode char(2)  not null,		 /*중분류코드 외래키지정 */
  categorySubCode    char(3)  not null,		 /*소분류코드 외래키지정 */
 	productCode varchar(20)  not null,					/* 상품코드 */
  productName varchar(50) not null,						/* 상품명 */
  realPrice int not null,											/* 상품원가 */
  mainPrice	int not null,											/* 판매가격 */
  point int not null,													/* 적립금 */
  disPrice int not null,											/* 할인가격 */
  productMainImg varchar(100) not null,				/* 메인 이미지 */
  productContent text not null,				/* 상품 상세 설명 */
  productContent2 text not null,				/* 상품 상세 설명 */
  productSubImg text not null,				/* 상품 상세 사진 */
  wishCnt int default 0,
  primary key(idx, productCode),
  foreign key(categoryMainCode)   references LVcategoryMain(categoryMainCode)   on update cascade on delete restrict,
  foreign key(categoryMiddleCode) references LVcategoryMiddle(categoryMiddleCode) on update cascade on delete restrict,
  foreign key(categorySubCode)    references LVcategorySub(categorySubCode)    on update cascade on delete restrict
);

/* 상품 옵션 */
create table LVOption (
  idx int not null auto_increment primary key,	/* 옵션 고유번호 */
  productIdx  int  not null,										/* 테이블의 고유번호 */
  /*productCode varchar(20)  not null,*/					/* 상품코드 */
  optionName  varchar(50)  not null,						/* 옵션 이름 */
  optionColor  varchar(50)  not null,						/* 옵션 색상 */
  optionNum int not null,												/* 재고 */
  foreign key(productIdx) references LVproduct(idx) on update cascade on delete restrict
  /*foreign key(productCode) references LVproduct(productCode) on update cascade on delete restrict*/
);

drop table categoryMain;
drop table categoryMiddle;
drop table categorySub;
drop table LVproduct;
drop table LVOption;

/* 장바구니 테이블 */
create table LVCartList (
  idx   int not null auto_increment,			/* 장바구니 고유번호 */
  cartDate datetime default now(),				/* 장바구니에 상품을 담은 날짜 */
  mid   varchar(20) not null,							/* 장바구니를 사용한 사용자의 아이디 - 로그인한 회원 아이디이다. */
  productIdx  int not null,								/* 장바구니에 구입한 상품의 고유번호 */
  productName varchar(50) not null,				/* 장바구니에 담은 구입한 상품명 */
  productCode varchar(20) not null,				/* 장바구니에 담은 구입한 상품명 */
  realPrice int not null,								  /* 상품원가 */
  mainPrice   int not null,								/* 메인상품의 기본 가격 */
  point int not null,											/* 적립금 */
  disPrice   int not null,								/* 메인상품의 할인 가격 */
  productMainImg		varchar(100) not null,			/* 서버에 저장된 상품의 메인 이미지 */
  optionIdx	  varchar(50)	 not null,			/* 옵션의 고유번호리스트(여러개가 될수 있기에 문자열 배열로 처리한다.) */
  optionName  varchar(100) not null,			/* 옵션명 리스트(배열처리) */
  optionColor varchar(100) not null,			/* 옵션가격 리스트(배열처리) */
  optionNum		varchar(50)  not null,			/* 옵션수량 리스트(배열처리) */
  totalPrice  int not null,								/* 구매한 모든 항목(상품과 옵션포함)에 따른 총 가격 */
  primary key(idx, mid),
  foreign key(productIdx) references LVproduct(idx) on update cascade on delete restrict
);
drop table LVCartList;
desc LVCartList;
delete from LVCartList;
select * from LVCartList;
select * from LVproduct where categoryMainCode = 'C' and categoryMiddleCode = '09' and categorySubCode = '039' order by disPrice;
/* 주문 테이블 -  */
create table LVOrder (
  idx         int not null auto_increment, /* 고유번호 */
  orderIdx    varchar(15) not null,   /* 주문 고유번호(새롭게 만들어 주어야 한다.) */
  mid         varchar(20) not null,   /* 주문자 ID */
  productIdx  int not null,           /* 상품 고유번호 */
  orderDate   datetime default now(), /* 실제 주문을 한 날짜 */
  productName varchar(50) not null,   /* 상품명 */
  realPrice int not null,								  /* 상품원가 */
  mainPrice   int not null,				    /* 메인 상품 가격 */
  point int not null default 0,											/* 적립금 */
  disPrice   int not null,								/* 메인상품의 할인 가격 */
  productMainImg    varchar(60) not null,   /* 썸네일(서버에 저장된 메인상품 이미지) */
  optionName  varchar(100) not null,  /* 옵션명    리스트 -배열로 넘어온다- */
  optionColor varchar(100) not null,  /* 옵션가격  리스트 -배열로 넘어온다- */
  optionNum   varchar(50)  not null,  /* 옵션수량  리스트 -배열로 넘어온다- */
  totalPrice  int not null,					  /* 구매한 상품 항목(상품과 옵션포함)에 따른 총 가격 */
  primary key(idx, orderIdx),
  foreign key(productIdx) references LVProduct(idx)  on update cascade on delete cascade
);
drop table LVOrder;
desc LVOrder;
delete from LVOrder;
select * from LVOrder;

/* 배송테이블 */
create table LVBaesong (
  idx     int not null auto_increment,
  oIdx    int not null,								/* 주문테이블의 고유번호를 외래키로 지정함 */
  orderIdx    varchar(15) not null,   /* 주문 고유번호 */
  orderTotalPrice int     not null,   /* 주문한 모든 상품의 총 가격 */
  mid         varchar(20) not null,   /* 회원 아이디 */
  name				varchar(20) not null,   /* 배송지 받는사람 이름 */
  address     varchar(100) not null,  /* 배송지 (우편번호)주소 */
  getCode			varchar(15),						/* 받는사람 전화번호 */
  email			varchar(50),							/* 받는사람 전화번호 */
  message     varchar(100),						/* 배송시 요청사항 */
  payment			varchar(10)  not null,	/* 결재도구 */
  payMethod   varchar(50)  not null,  /* 결재도구에 따른 방법(카드번호) */
  baesongNum   int ,  								/* 운송장번호 */
  orderStatus varchar(10)  not null default '결제완료', /* 주문순서(결제완료->배송중->배송완료->구매완료) */
  primary key(idx),
  foreign key(oIdx) references LVOrder(idx) on update cascade on delete cascade
);
desc LVBaesong;
drop table LVBaesong;
delete from LVBaesong;
select * from LVBaesong;
update LVOption set optionNum = optionNum - 1 where productIdx = 386 and optionName='Free' and optionColor='그레이지';
select * from LVOption where productIdx = 386 and optionName='Free' and optionColor='그레이지';

select *,(select wish from LVwish where productIdx = 219) from LVproduct where categoryMainCode ='B' and categoryMiddleCode = '04' and categorySubCode = '010' order by idx desc;