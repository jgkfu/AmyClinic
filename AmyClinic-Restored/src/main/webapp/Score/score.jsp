<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#font{
font-size: 80px;
color: orange;



}

</style>
</head>
<body>
	<table border="1px" id="ta" >
		<tr>
			<th width="150px",height="200pX">照片</th>
			<th width="200px">名子</th>
			<th width="400px">評分</th>
			<th width="100px">參予留言</th>
			
		</tr>
	
	</table>
	<script src="../js/jquery-1.9.1.js"></script>
	<script src="../js/jquery.raty.js"></script>
	
	

	
	<script>
//失敗的方法 找原因	
// 		window.addEventListener(load, init, false); 
// 		function init(){
// 			$.post("ScoreServlet",{'action':'getEmpScore'},function(data){
// 				console.log("我有執行")
// 			})
// 		}
		$(function(){

			$.getJSON('ScoreServlet',{'action':'getEmpScore','hello':'su3'},function(data){
				$.each(data,function(i,emp){
					var cell1 = $("<td ></td>").html("<img width='150px' height='200px'src='${pageContext.request.contextPath}/Score/GetPic?num="+emp.eid+"'>")
					var cell2 = $("<td></td>").text(emp.name);
					var cell3 = $("<td></td>").html("<img width='300px' height='auto'src='${pageContext.request.contextPath}/images/"+emp.avgPicture+"'>"+"<span id='font'>"+emp.avgScore+"</span>");
					var cell4 = $("<td></td>").html("<FORM  METHOD='post' ACTION='ScoreServlet' ><input  type='submit' value='參予留言'/><input type='hidden'name='action' value='getOne_Score'> <input type='hidden' name='eid' value='"+emp.eid+"'> <input type='hidden' name='avgPicture' value='"+emp.avgPicture+"'> <input type='hidden' name='avgScore' value='"+emp.avgScore+"'> </form>")
					var row = $("<tr></tr>").append([cell1,cell2,cell3,cell4])
					$("#ta>tbody").append(row);

					
					
					
				})

			})
		})
	

	</script>
	<!-- TEST 可刪 -->
	<script src="${pageContext.request.contextPath}/js/jquery-1.9.1.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.colorbox.js"></script>
	<script>
	$(document).ready(function () {
    $('#test').colorbox({ opacity:0.5, rel:'group1' });
	});
</script>




</body>
</html>