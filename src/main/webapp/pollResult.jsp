<%@page import="java.text.DecimalFormat"%>
<%@page import="com.mbcit.onLinePoll.PollRead"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결과 보기</title>
<link rel="icon" href="./kbo.png">

<!-- 일정 시간이 경과되면 특정 웹 사이트로 이동하기-->
<!-- <meta http-equiv="refresh" content="5, url='https:www.naver.com'"> -->
<!-- 일정 시간이 경과되면 현재 웹 사이트를 다시 호출하기-->
<meta http-equiv="refresh" content="1, url='?'">




<!-- 텍스트 파일에 저장된 투표 결과를 읽어와서 브라우저에 표시한다. -->
<%
//	텍스트 파일을 읽어서 투표 항목의 개수를 계산한다.
	String filepath = application.getRealPath("/")+"poll.txt";
	ArrayList<String> poll = PollRead.pollRead(filepath);
	int itemCount = (poll.size() - 1) / 2;

// 	득표율을 계산하기 위해 전체 투표수를 계산한다.
	int sum = 0;
	for (int i = itemCount+1; i < poll.size(); i++ ){
		sum += Integer.parseInt(poll.get(i));
	}
//	out.println(sum);

//	숫자 데이터 서식을 만든다.
	DecimalFormat df1 = new DecimalFormat("#,##0표"); // 득표수 서식
	DecimalFormat df2 = new DecimalFormat("0.00%표"); // 득표율 서식
%>

<table border="1" align="center" width="500" cellspacing="0" cellpadding="5">
	<tr> 
		<th colspan="2"> 
		    <%=poll.get(0)%> 
		</th>		
	</tr>
	<tr> 
		<td align="right" colspan="2"> 
		    <%=df1.format(sum)%> 
		</td>		
	</tr>
<%
	for (int i = 1; i <= itemCount; i++ ){
		double pyo = Integer.parseInt(poll.get(itemCount + i)); // 득표수
		double per = pyo / sum; // 득표율
%>

	<tr>
		<td width="150">
			<%=poll.get(i)%>(<%=df1.format(pyo)%>)
			<%-- <%=poll.get(i)%>(<%=df1.format(per))%>) --%>
		</td>
		<td width="350">
			<hr size="10" color="red" width="<%=300 * per %>" align="left">
		</td>
	</tr>	
<%
	}
%>
	<tr>
		<td colspan="2" align="center">
			<input type="button" value="투표하러 가기" onclick="location.href='pollRead.jsp'">	
		</td>
	</tr>


	
</body>
</html>