<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>대분류 등록</title>
	<jsp:include page="/WEB-INF/views/include/bs4.jsp"/>
	<%-- <script src="${ctp}/js/cilckNo.js"></script> --%>
	<link rel="stylesheet" href="${ctp}/css/font.css">
	<link rel="stylesheet" href="${ctp}/css/scroll.css">
	<link rel="stylesheet" href="${ctp}/css/adminNav.css">
	<link rel="stylesheet" href="${ctp}/css/scrollbar.css">
	<link rel="icon" href="${ctp}/images/title.ico">
	<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script>
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);
      google.charts.setOnLoadCallback(drawChart2);
      google.charts.setOnLoadCallback(drawChart3);
      google.charts.setOnLoadCallback(drawVisualization);
      google.charts.setOnLoadCallback(drawVisualization2);
      google.charts.setOnLoadCallback(drawVisualization3);
      google.charts.setOnLoadCallback(drawVisualization4);

      // 년도 차트 보기
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Year', '원가', '판매가', '마진금액'],
          ['${yearVos[0].yearDate}', ${yearVos[0].realPrices}, ${yearVos[0].disPrices}, ${yearVos[0].margins}],
          ['${yearVos[1].yearDate}', ${yearVos[1].realPrices}, ${yearVos[1].disPrices}, ${yearVos[1].margins}],
          ['${yearVos[2].yearDate}', ${yearVos[2].realPrices}, ${yearVos[2].disPrices}, ${yearVos[2].margins}]
        ]);

        var options = {
          title: '년도별 마진액',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('year_chart'));

        chart.draw(data, options);
      }
      
   		// 월 차트 보기
      function drawChart2() {
        var data = google.visualization.arrayToDataTable([
          ['month', '원가', '판매가', '마진금액'],
          ['1월',${monthRealPrices[0]}, ${monthDisPrices[0]}, ${monthMargins[0]}],
          ['2월',${monthRealPrices[1]}, ${monthDisPrices[1]}, ${monthMargins[1]}],
          ['3월',${monthRealPrices[2]}, ${monthDisPrices[2]}, ${monthMargins[2]}],
          ['4월',${monthRealPrices[3]}, ${monthDisPrices[3]}, ${monthMargins[3]}],
          ['5월',${monthRealPrices[4]}, ${monthDisPrices[4]}, ${monthMargins[4]}],
          ['6월',${monthRealPrices[5]}, ${monthDisPrices[5]}, ${monthMargins[5]}],
          ['7월',${monthRealPrices[6]}, ${monthDisPrices[6]}, ${monthMargins[6]}],
          ['8월',${monthRealPrices[7]}, ${monthDisPrices[7]}, ${monthMargins[7]}],
          ['9월',${monthRealPrices[8]}, ${monthDisPrices[8]}, ${monthMargins[8]}],
          ['10월',${monthRealPrices[9]}, ${monthDisPrices[9]}, ${monthMargins[9]}],
          ['11월',${monthRealPrices[10]}, ${monthDisPrices[10]}, ${monthMargins[10]}],
          ['12월',${monthRealPrices[11]}, ${monthDisPrices[11]}, ${monthMargins[11]}]
        ]);

        var options = {
          title: '월별 마진액',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('month_chart'));

        chart.draw(data, options);
      }
      
   		// 일일 차트 보기
      function drawChart3() {
 				if(${w3 == 0}){
	        var data = google.visualization.arrayToDataTable([
	          ['day', '원가', '판매가', '마진금액'],
	          ['1일',${dayRealPrices[0]}, ${dayDisPrices[0]}, ${dayMargins[0]}],
	          ['2일',${dayRealPrices[1]}, ${dayDisPrices[1]}, ${dayMargins[1]}],
	          ['3일',${dayRealPrices[2]}, ${dayDisPrices[2]}, ${dayMargins[2]}],
	          ['4일',${dayRealPrices[3]}, ${dayDisPrices[3]}, ${dayMargins[3]}],
	          ['5일',${dayRealPrices[4]}, ${dayDisPrices[4]}, ${dayMargins[4]}],
	          ['6일',${dayRealPrices[5]}, ${dayDisPrices[5]}, ${dayMargins[5]}],
	          ['7일',${dayRealPrices[6]}, ${dayDisPrices[6]}, ${dayMargins[6]}],
	          ['8일',${dayRealPrices[7]}, ${dayDisPrices[7]}, ${dayMargins[7]}],
	          ['9일',${dayRealPrices[8]}, ${dayDisPrices[8]}, ${dayMargins[8]}],
	          ['10일',${dayRealPrices[9]}, ${dayDisPrices[9]}, ${dayMargins[9]}],
	          ['11일',${dayRealPrices[10]}, ${dayDisPrices[10]}, ${dayMargins[10]}],
	          ['12일',${dayRealPrices[11]}, ${dayDisPrices[11]}, ${dayMargins[11]}],
	          ['13일',${dayRealPrices[12]}, ${dayDisPrices[12]}, ${dayMargins[12]}],
	          ['14일',${dayRealPrices[13]}, ${dayDisPrices[13]}, ${dayMargins[13]}],
	          ['15일',${dayRealPrices[14]}, ${dayDisPrices[14]}, ${dayMargins[14]}],
	          ['16일',${dayRealPrices[15]}, ${dayDisPrices[15]}, ${dayMargins[15]}],
	          ['17일',${dayRealPrices[16]}, ${dayDisPrices[16]}, ${dayMargins[16]}],
	          ['18일',${dayRealPrices[17]}, ${dayDisPrices[17]}, ${dayMargins[17]}],
	          ['19일',${dayRealPrices[18]}, ${dayDisPrices[18]}, ${dayMargins[18]}],
	          ['20일',${dayRealPrices[19]}, ${dayDisPrices[19]}, ${dayMargins[19]}],
	          ['21일',${dayRealPrices[20]}, ${dayDisPrices[20]}, ${dayMargins[20]}],
	          ['22일',${dayRealPrices[21]}, ${dayDisPrices[21]}, ${dayMargins[21]}],
	          ['23일',${dayRealPrices[22]}, ${dayDisPrices[22]}, ${dayMargins[22]}],
	          ['24일',${dayRealPrices[23]}, ${dayDisPrices[23]}, ${dayMargins[23]}],
	          ['25일',${dayRealPrices[24]}, ${dayDisPrices[24]}, ${dayMargins[24]}],
	          ['26일',${dayRealPrices[25]}, ${dayDisPrices[25]}, ${dayMargins[25]}],
	          ['27일',${dayRealPrices[26]}, ${dayDisPrices[26]}, ${dayMargins[26]}],
	          ['28일',${dayRealPrices[27]}, ${dayDisPrices[27]}, ${dayMargins[27]}],
	          ['29일',${dayRealPrices[28]}, ${dayDisPrices[28]}, ${dayMargins[28]}],
	          ['30일',${dayRealPrices[29]}, ${dayDisPrices[29]}, ${dayMargins[29]}],
	          ['31일',${dayRealPrices[30]}, ${dayDisPrices[30]}, ${dayMargins[30]}]
	        ]);
 				}
 				else{
 					 var data = google.visualization.arrayToDataTable([
		          ['day', '원가', '판매가', '마진금액'],
		          ['자료 없음',0, 0, 0]
		        ]);
 				}
        var options = {
          title: '일별 마진액',
          curveType: 'function',
          legend: { position: 'bottom' }
        };

        var chart = new google.visualization.LineChart(document.getElementById('day_chart'));

        chart.draw(data, options);
      }
   		
   		function monthSearch(){
   			var year = document.getElementById("monthYear").value;
   			location.href = "${ctp}/admin/chart?year="+year;
   		}
   		function daySearch(){
   			var year2 = document.getElementById("dayYear").value;
   			var month = document.getElementById("dayMonth").value;
   			if(year2 == ''){
   				alert("년도를 선택하세요");
   				return;
   			}
   			location.href = "${ctp}/admin/chart?year2="+year2+"&month="+month;
   		}
		
   		//년 판매량
	    function drawVisualization() {
	      var data = google.visualization.arrayToDataTable([
	        ['year', '판매량'],
	        ['${productNumVos[0].yearDate}', ${productNumVos[0].selNums}],
	        ['${productNumVos[1].yearDate}', ${productNumVos[1].selNums}],
	        ['${productNumVos[2].yearDate}', ${productNumVos[2].selNums}]
	      ]);
	      var options = {
	        title : '년도별 상품 총 판매량',
	        seriesType: 'bars',
	        series: {5: {type: 'line'}}
	      };
	      var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
	      chart.draw(data, options);
	    }
	    
	    // 월 판매량
	    function drawVisualization2() {
      	 var data = google.visualization.arrayToDataTable([
           ['month', '판매량'],
           ['1월',${monthSel[0]}],
           ['2월',${monthSel[1]}],
           ['3월',${monthSel[2]}],
           ['4월',${monthSel[3]}],
           ['5월',${monthSel[4]}],
           ['6월',${monthSel[5]}],
           ['7월',${monthSel[6]}],
           ['8월',${monthSel[7]}],
           ['9월',${monthSel[8]}],
           ['10월',${monthSel[9]}],
           ['11월',${monthSel[10]}],
           ['12월',${monthSel[11]}]
         ]);
      	 var options = {
     	        title : '월별 상품 총 판매량',
     	        seriesType: 'bars',
     	        series: {5: {type: 'line'}}
     	      };
     	      var chart = new google.visualization.ComboChart(document.getElementById('chart_div2'));
     	      chart.draw(data, options);
	    }
	    
   		// 일일 차트 보기
	      function drawVisualization3() {
	 				if(${w4 == 0}){
		        var data = google.visualization.arrayToDataTable([
		          ['day', '판매량'],
		          ['1일',${daySel[0]}],
		          ['2일',${daySel[1]}],
		          ['3일',${daySel[2]}],
		          ['4일',${daySel[3]}],
		          ['5일',${daySel[4]}],
		          ['6일',${daySel[5]}],
		          ['7일',${daySel[6]}],
		          ['8일',${daySel[7]}],
		          ['9일',${daySel[8]}],
		          ['10일',${daySel[9]}],
		          ['11일',${daySel[10]}],
		          ['12일',${daySel[11]}],
		          ['13일',${daySel[12]}],
		          ['14일',${daySel[13]}],
		          ['15일',${daySel[14]}],
		          ['16일',${daySel[15]}],
		          ['17일',${daySel[16]}],
		          ['18일',${daySel[17]}],
		          ['19일',${daySel[18]}],
		          ['20일',${daySel[19]}],
		          ['21일',${daySel[20]}],
		          ['22일',${daySel[21]}],
		          ['23일',${daySel[22]}],
		          ['24일',${daySel[23]}],
		          ['25일',${daySel[24]}],
		          ['26일',${daySel[25]}],
		          ['27일',${daySel[26]}],
		          ['28일',${daySel[27]}],
		          ['29일',${daySel[28]}],
		          ['30일',${daySel[29]}],
		          ['31일',${daySel[30]}]
		        ]);
	 				}
	 				else{
	 					 var data = google.visualization.arrayToDataTable([
			          ['day', '판매량'],
			          ['자료 없음',0]
			        ]);
	 				}
	 				 var options = {
   	        title : '일별 상품 총 판매량',
   	        seriesType: 'bars',
   	        series: {5: {type: 'line'}}
   	       };
   	       var chart = new google.visualization.ComboChart(document.getElementById('chart_div3'));
   	       chart.draw(data, options);
	      }
   		
	   		//상품별 판매량
		    function drawVisualization4() {
		      var data = google.visualization.arrayToDataTable([
		        ['상품명', '판매량'],
		        ['${productVos[0].orderDate}/${productVos[0].productName}', ${productVos[0].selNum}],
		        ['${productVos[1].orderDate}/${productVos[1].productName}', ${productVos[1].selNum}],
		        ['${productVos[2].orderDate}/${productVos[2].productName}', ${productVos[2].selNum}],
		        ['${productVos[3].orderDate}/${productVos[3].productName}', ${productVos[3].selNum}],
		        ['${productVos[4].orderDate}/${productVos[4].productName}', ${productVos[4].selNum}],
		        ['${productVos[5].orderDate}/${productVos[5].productName}', ${productVos[5].selNum}],
		        ['${productVos[6].orderDate}/${productVos[6].productName}', ${productVos[6].selNum}],
		        ['${productVos[7].orderDate}/${productVos[7].productName}', ${productVos[7].selNum}],
	 	        ['${productVos[8].orderDate}/${productVos[8].productName}', ${productVos[8].selNum}],
		        ['${productVos[9].orderDate}/${productVos[9].productName}', ${productVos[9].selNum}]
		       /*  ['${productVos[10].orderDate}/${productVos[10].productName}', ${productVos[10].selNum}] */
		      ]);
		      var options = {
		        title : '상품별 최고판매량 - 판매량 높은순 10개',
		        seriesType: 'bars',
		        series: {5: {type: 'line'}}
		      };
		      var chart = new google.visualization.ComboChart(document.getElementById('chart_div4'));
		      chart.draw(data, options);
		    }
    </script>
</head>
<!-- <body oncontextmenu='return false' ondragstart='return false'> -->
<body>
<jsp:include page="/WEB-INF/views/include/adminNav.jsp"/>
	<div class="w3-main" style="margin-left:340px;margin-right:40px">
	  <div class="w3-container" style="margin-top:80px" id="showcase">
		  <h2 class="text-center">차트</h2><br/><br/>
		  <div>
		  	<div><b>총 누적 원가 : </b><fmt:formatNumber value="${productVo.realPrices}" pattern="#,###"/>원</div>
		  	<div><b>총 누적 판매가 : </b><fmt:formatNumber value="${productVo.disPrices}" pattern="#,###"/>원</div>
		  	<div><b>총 누적 마진가 : </b><fmt:formatNumber value="${productVo.margins}" pattern="#,###"/>원</div>
		  	<div><b>총 누적 판매량 : </b><fmt:formatNumber value="${productVo.selNums}" pattern="#,###"/>개</div>
		  </div>
		  <br/><br/>
		  <div class="row">
		  	<div class="col-lg-6">
				  <h4 class="text-center">년도별 마진액</h4><br/>
				  <div id="year_chart" style="width: 100%; height: 500px"></div><br/>
		  	</div>
		  	
		  	<div class="col-lg-6">
		  		<h4 class="text-center">년도별 상품 총 판매량</h4><br/>
		  		<div id="chart_div" style="width: 100%; height: 500px;"></div>
		 	  </div>
		 	  
		  	<div class="col-lg-6">
				  <h4 class="text-center">월별 마진액</h4><br/>
				  <select class="w3-select" id="monthYear" name="monthYear" onchange="monthSearch()">
				  	<option value="" disabled selected>년도를 선택하세요</option>
				  	<option value="2020" <c:if test="${year == '2020'}">selected</c:if>>2020년</option>
				  	<option value="2021" <c:if test="${year == '2021'}">selected</c:if>>2021년</option>
				  	<option value="2022" <c:if test="${year == '2022'}">selected</c:if>>2022년</option>
				  </select>
				  <div id="month_chart" style="width: 100%; height: 500px"></div><br/>
		  	</div>
		  			  	
		  	<div class="col-lg-6">
		  		<h4 class="text-center">월별 상품 총 판매량</h4><br/>
		  		<div id="chart_div2" style="width: 100%; height: 500px;"></div>
		 	  </div>
		  	
		 		<div class="col-lg-6">
				  <h4 class="text-center">일별 마진액</h4><br/>
				  <select class="w3-select" id="dayYear" name="dayYear" style="width:45%">
				  	<option value="" disabled selected>년도를 선택하세요</option>
				  	<option value="2020" <c:if test="${year2 == '2020'}">selected</c:if>>2020년</option>
				  	<option value="2021" <c:if test="${year2 == '2021'}">selected</c:if>>2021년</option>
				  	<option value="2022" <c:if test="${year2 == '2022'}">selected</c:if>>2022년</option>
				  </select>
				  <select class="w3-select" id="dayMonth" name="dayMonth" style="width:45%" onchange="daySearch()">
				  	<option value="" disabled selected>월을 선택하세요</option>
				  	<option value="01" <c:if test="${month == '01'}">selected</c:if>>01월</option>
				  	<option value="02" <c:if test="${month == '02'}">selected</c:if>>02월</option>
				  	<option value="03" <c:if test="${month == '03'}">selected</c:if>>03월</option>
				  	<option value="04" <c:if test="${month == '04'}">selected</c:if>>04월</option>
				  	<option value="05" <c:if test="${month == '05'}">selected</c:if>>05월</option>
				  	<option value="06" <c:if test="${month == '06'}">selected</c:if>>06월</option>
				  	<option value="07" <c:if test="${month == '07'}">selected</c:if>>07월</option>
				  	<option value="08" <c:if test="${month == '08'}">selected</c:if>>08월</option>
				  	<option value="09" <c:if test="${month == '09'}">selected</c:if>>09월</option>
				  	<option value="10" <c:if test="${month == '10'}">selected</c:if>>10월</option>
				  	<option value="11" <c:if test="${month == '11'}">selected</c:if>>11월</option>
				  	<option value="12" <c:if test="${month == '12'}">selected</c:if>>12월</option>
				  </select>
				  <div id="day_chart" style="width: 100%; height: 500px"></div><br/>
		  	</div>
		  	<div class="col-lg-6">
		  		<h4 class="text-center">일별 상품 총 판매량</h4><br/>
		  		<div id="chart_div3" style="width: 100%; height: 500px;"></div>
		 	  </div>
		  	<div class="col-lg-12">
		  		<h4 class="text-center">최고 판매 상품(인기)</h4><br/>
		  		<div id="chart_div4" style="width: 100%; height: 500px;"></div>
		  	</div>
			</div>
		</div>
	</div>
<script src="${ctp}/js/admin.js"></script>
</body>
</html>