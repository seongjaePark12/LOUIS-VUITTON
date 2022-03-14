create table LVcharts (
  idx         int not null auto_increment, /* 고유번호 */
  productIdx  int not null,           		 /* 상품 고유번호 */
  orderDate   varchar(20) not null, 		 			 /* 주문을 한 날짜 */
  productName varchar(50) not null,  			 /* 상품명 */
  realPrice int not null,								   /* 상품원가 */
  disPrice   int not null,								 /* 메인상품의 할인 가격 */
  margin   int not null,									 /* 마진금액 */
  selNum   int not null,									 /* 판매량 */
  primary key(idx)
);
drop table LVcharts;
select * from LVcharts;
SELECT curdate();
select * from LVcharts where YEAR(orderDate) = '2022';
select * from LVcharts where YEAR(orderDate) = '2022' and MONTH(orderDate) = '01';
select * from LVcharts where YEAR(orderDate) = '2022' and MONTH(orderDate) = '01' and DAY(orderDate) = '26';

select YEAR(orderDate) as orderDates,sum(realPrice) as realPrices,sum(disPrice) as disPrices,sum(margin) as margins from LVcharts group by YEAR(orderDate) order by orderDate;

select YEAR(orderDate) as yearDate,MONTH(orderDate) as orderDates,sum(realPrice) as realPrices,sum(disPrice) as disPrices,sum(margin) as margins from LVcharts where YEAR(orderDate)='2021' group by MONTH(orderDate) order by orderDate;

select YEAR(orderDate)as yearDate, MONTH(orderDate) as monthDate, DAY(orderDate) as orderDates,sum(realPrice) as realPrices,sum(disPrice) as disPrices,sum(margin) as margins from LVcharts where YEAR(orderDate)='2022' and MONTH(orderDate)='01' group by DAY(orderDate) order by orderDate;



select sum(realPrice),sum(disPrice),sum(margin) from LVcharts 
where YEAR(orderDate) = '2022' and MONTH(orderDate) BETWEEN '01' AND '12';

select sum(realPrice),sum(disPrice),sum(margin) from LVcharts 
where YEAR(orderDate) = '2022' and MONTH(orderDate) = '01' and DAY(orderDate) = '26';

select sum(realPrice),sum(disPrice),sum(margin) from LVcharts 
where YEAR(orderDate) = '2022' and MONTH(orderDate) = '01' and DAY(orderDate) BETWEEN '01' AND '31';

select sum(realPrice) as realPrices,sum(disPrice) as disPrices,sum(margin) as margins,sum(selNum) as selNums from LVcharts;