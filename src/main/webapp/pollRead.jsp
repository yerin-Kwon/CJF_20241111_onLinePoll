<%@page import="com.mbcit.onLinePoll.PollRead"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>투표하기</title>

<!-- favicon: 웹 브라우저의 title에 표시되는 웹 사이트를 대표하는 이미지이다. -->
<link rel="icon" href="./kbo.png">

</head>
<body>

<!-- 투표 항목이 저장된 realpath의 텍스트 파일을 읽어서 브라우저에 출력한다.-->
<%
// 이클립스는 프로젝트를 실행하면 프로젝트를 이클립스가 내부적으로 사용하는 웹 서버에 복사해넣고 실행한다.
//	out.println(application.getRealPath("/")); 메소드를 실행하면 프로젝트가 실행되는 실제(real) 경로(path)를 얻어온다
//	out.println(application.getRealPath("/"));
//	D:\kyr\Class\web\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\CJF_20241111_onLinePoll\
//	out.println(application.getRealPath("/")+"poll.txt");
//	D:\kyr\Class\web\workspace\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\CJF_20241111_onLinePoll\poll.txt

//	투표 항목이 저장된 파일을 읽어올 실제 경로와 파일 이름을 연결한다.
	String filepath = application.getRealPath("/")+"poll.txt";
//	투표 항목이 저장된 텍스트 파일에서 투표 항목을 읽어오는 메소드를 실행한다.
	ArrayList<String> poll = PollRead.pollRead(filepath);
//	out.println(poll);
//	for (String str : poll){
//		out.println(str + "<br>");
//
	
//	투표 항목의 개수를 계산한다.
//	int itemCount = (poll.size() - 1) / 2;
//	자바는 이렇게 해도 된다.
	int itemCount = poll.size() / 2;
//	out.println(itemCount+ "<br>");

%>

<form action="pollWrite.jsp" method="post">
	<!-- width: 표 전체 너비
	border: 선 두께
	align: 표 정렬 방법, 기본값은 left
	cellspacing: 셀과 셀 사이의 간격
	cellpadding: 셀 안여백, 셀을 구성하는 선과 셀 내부 텍스트의 간격
	 -->	
 	<table border="1" align="center" width="500" cellspacing="0" cellpadding="5">
		<tr> <!-- 줄 -->
			<th> <!-- 칸, 표의 첫 줄 또는 첫 열을 구성하는 칸, 굵게 및 가운데 정렬되서 표시된다. -->
				<%=poll.get(0)%> <!-- 표현식, 간단한 출력에 사용한다. -->
			</th>		
		</tr>
		
	<%
		for (int i = 1; i <= itemCount; i++){
	%>
		<tr>
			<td> <!-- 칸, 표의 첫 줄 또는 첫 열을 제외한 나머지를 구성하는 칸 -->
				<input type="radio" name="poll" value="<%=i%>">
				<%=poll.get(i)%>
			</td>
		</tr>
	<%		
		}
	%>
	
		<!-- 투표하기 버튼과 결과보기 버튼을 만든다. -->
		<tr>
			<td align="center">
				<input type="submit" value="투표하기">
				<input type="button" value="결과보기" onclick="location.href='pollResult.jsp'">
			</td>
		</tr>
	</table>

</form>

</body>
</html>
