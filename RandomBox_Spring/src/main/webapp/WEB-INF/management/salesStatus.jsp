<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="container"
	style="min-width: 310px; height: 400px; margin: 0 auto"></div>



<script>
var orderDay = new Array();
var gPrice = new Array();
var sellerid = new Array();
//1.array선언


</script>


<c:forEach var="s" items="${slist }" varStatus="status">
	<script>//foreach script배열을 추가 
		orderDay[${status.index}]='${s.orderDay}';
		sellerid[${status.index}]='${s.sellerid}';
		gPrice[${status.index}]=parseInt('${s.gPrice}');
		
	</script>
</c:forEach>


<script type="text/javascript">
Highcharts.chart('container', {
    chart: {
        type: 'line'
    },
    title: {
        text: '매출현황'
    },
    subtitle: {
        text: '소제목'
    },
    xAxis: {//x축 레이블
        categories: orderDay
    },
    yAxis: {
        title: {
            text: '(원)'
        }
    },
    plotOptions: {
        line: {
            dataLabels: {
                enabled: true
            },
            enableMouseTracking: true
        }
    },
    series: [

		<c:forEach var="a" items="${slist }">
    	{
         name: ${a.sellerid}
         data: ${a.gPrice}
    	}
    	</c:forEach>
    	<script >
    	]
    });
</script>