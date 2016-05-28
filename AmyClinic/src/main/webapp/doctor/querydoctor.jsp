<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>醫生資料</title>
</head>
<body>
<table>
	<tr>
		<td width="50"></td>
		<td width="300">
			<img src="${pageContext.request.contextPath}/ShowEmpPic.servlet?num=${empVO.eid}"/>
		</td>
		<td width="22"></td>
		<td>
				<table>
					<tr>
						<td>${empVO.name}　醫師</td>
					</tr>
					<tr>
						<td colspan="2"><hr></td>
					</tr>	
					<tr>
						<td>學歷</td>
						<td>${empVO.education}</td>
					</tr>	
					<tr>
						<td>經驗</td>
						<td>${empVO.experience}</td>
					</tr>	
					<tr>
						<td>專長</td>
						<td>${empVO.specialty}</td>
					</tr>	
				</table>
			
		</td>
	</tr>
</table>
</body>
</html>