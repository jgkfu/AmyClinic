<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"  %>
<%@page import="group3.henry.login.model.*"%>

<!DOCTYPE html >
<html lang="en">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1"><meta name="description" content="">
    <meta name="author" content=""><title>☆AMY診所☆管理系統☆pro版☆</title>
</head>

<body>
    <div id="wrapper"><!-- all -->
<jsp:include page="jsp/b_top.jsp" /><!-- top and側邊欄功能表項目	位置 -->
<div id="page-wrapper" style=background-color:#ADADAD  >
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12">
                <div class="page-header" >
 <marquee  onMouseOver="this.stop()" onMouseOut="this.start()" bgcolor="#ADADAD" direction="right" height="20" scrollamount="8" behavior="alternate">本月目標<font color="red">30億</font></marquee>                                           
                </div>
                 <ol class="breadcrumb"><li class="active"><i class="fa fa-dashboard"></i><font color="red" style="text-align: center;">會員資料維護</font>
                 <form class="navbar-search pull-right">
  <input type="text" class="search-query" placeholder="請輸入姓名" value="" />
</form></li></ol>
                    </div>
                </div><!-- /.row -->
            </div> <!-- /.container-fluid -->
            </div><!--側邊欄功能表項目over --><!--側邊欄功能表項目over --><!--側邊欄功能表項目over -->     <hr> 
<!--         開始 -->
 <%
 	MemberVO memberVO= (MemberVO) request.getAttribute("memberVO");
  MemberServices memberSer = new MemberServices();
  List<MemberVO> list = memberSer.getAll();
  pageContext.setAttribute("list",list);
 %>

 <table border="2"  bordercolor='blue'  align='center'  class="table table-hover"  >
	<tr>
<!-- 		<th>照片</th>	 -->
		<th>姓名</th>
		<th>信箱</th>
		<th>生日</th>
		<th>國家/地址</th>
		<th>電話</th>
		
		
		
		<th>身高/體重</th>	
		<th>交易/診療</th>	
		<th>來訪</th>
		<th>獎勵/消費</th>	
		<th>最後消費日</th>
		<th>加入日</th>
		<th>狀態</th>
		<th><a href="addMember.jsp"><input type="submit" value="新增會員" class="btn btn-primary"></a>  </th>
	</tr>
	<c:forEach var="MemberVO"  items="${list}"  varStatus='i'>
		<tr>
<%-- 			<td><img src="${pageContext.request.contextPath}/user_photo/${MemberVO.photo}"	class="preview" style="max-width: 100px; max-height: 100px;"></td> --%>
			<td>${MemberVO.name}/
			<script>
			var i ='${MemberVO.gender}';
			if(i=='M'){
				document.write("男");
			}
			if(i=='F'){
				document.write("女");
			}if(i=='A'){
				document.write("中");
			}
			</script>
			</td>
			<td>${MemberVO.email}</td>
			<td>${MemberVO.birthday}</td>
			<td>${MemberVO.country}-${MemberVO.addr}</td>
			<td>${MemberVO.phone}</td>
			<td>${MemberVO.height}公分/${MemberVO.mass}公斤</td>
			<td>${MemberVO.num_trans}次/${MemberVO.num_treatment}次</td>			
			<td>${MemberVO.num_visits}次</td>		
			<td>${MemberVO.reward_pts}點/${MemberVO.spent_pts}點</td>
			<td>${MemberVO.last_visit}</td>
			<td>
			<script>
			var d ='${MemberVO.join_date}';
			document.write(d.substring(0,10));
			</script>
			</td>
			<td>
<%-- 			${MemberVO.act_status} --%>
<c:if test="${MemberVO.act_status == 0}"><font>封鎖</font></c:if>			 
<c:if test="${MemberVO.act_status == 1}"><font>正常</font></c:if>	 
<c:if test="${MemberVO.act_status == 2}"><font>未開通</font></c:if>	
			</td>
			<td>
			  <FORM METHOD="post" ACTION="MemberServletTest">
			   <input type="hidden" name="mid" value="${MemberVO.mid}">
			     <input type="hidden" name="action"	value="getOne_For_Update">
			     <input type="submit" value="修改" class="btn btn-success">
			    </FORM>
			</td>
		</tr>
	</c:forEach>
	</table>  
<!--         結束 -->
        </div><!-- /#page-wrapper --><!-- ALL over	/#wrapper -->   
</body>
</html>