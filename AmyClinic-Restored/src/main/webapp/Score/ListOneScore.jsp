<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="background-color: gray">
fagasdfdfasdf
</div>
	<div>${employeeVO.name}</div>
	<div>${avgPicture}</div>
	<div>${avgScore}</div>
	<div><img width='300px' height='auto'src='${pageContext.request.contextPath}/images/${avgPicture}'></div>

${memberVO.name}
${employeeVO}

<!-- <form METHOD='post' ACTION='ScoreServlet' > -->
<!-- 	<input type="submit" value="撰寫評論"> -->
<!-- 	<input type="hidden" name="action" value="add_score"> -->
<%-- 	<input type="hidden" name="eid" value="${employeeVO.eid}"> --%>


<!-- </form> -->


<a class="iframe" href="addScore.jsp?eid=${employeeVO.eid }">撰寫評論</a>






<!-- 本人的留言放在第一個 -->
	<c:forEach var="ScoreVO" items="${scoreVO}">
		<c:if test="${ScoreVO.mb.mid == memberVO.mid }">
			<div>

				<span>${ScoreVO.mb.name }</span> 
				<span><img src='${pageContext.request.contextPath}/user_photo/${ScoreVO.mb.photo}' height="150" width="150"></span>
				 <br>${ScoreVO.scoreDate}</br>
				 <span>編輯<span> 
				<img width='300px' height='auto' src='${pageContext.request.contextPath}/images/${ScoreVO.scores}star.jpg'>
				<c:out value="${ScoreVO.comment}" />	

				


			</div>
		</c:if>
	</c:forEach>


	<!-- 不是本人的留言放在下面 -->
	<c:forEach var="ScoreVO" items="${scoreVO}">
		<c:if test="${ScoreVO.mb.mid != memberVO.mid }">
			<div>

				<span>${ScoreVO.mb.name }</span> 
				<span><img src='${pageContext.request.contextPath}/user_photo/${ScoreVO.mb.photo}' height="150" width="150"></span>
				 ${ScoreVO.scoreDate} 
				<img width='300px' height='auto' src='${pageContext.request.contextPath}/images/${ScoreVO.scores}star.jpg'>
				<c:out value="${ScoreVO.comment}" />	

			</div>
		</c:if>
	</c:forEach>

	<!-- TEST 可刪 -->
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.colorbox.js"></script>
	<script>
// 		$(document).ready(function() {
// 			$('.iframe').colorbox({
// 				iframe:true,
// 				width:"80%",
// 				height:"80%",
// 				overlayClose:false,
				
			
// 			});
// 		});
	</script>






</body>
</html>