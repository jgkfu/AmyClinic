<%@page import="org.apache.struts2.components.Include"%>
<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib prefix="s"  uri="/struts-tags"  %>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="group3.carrie.product.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<title>-AMY-</title>
<link href="css/backstage.css" rel="stylesheet"/>
<link href="SpryAssets/SpryValidationTextField.css" rel="stylesheet" type="text/css">
<%-- <script src="js/jquery-1.12.3.min.js"></script> --%>
<%-- <script src="js/bootstrap.min.js"></script> --%>
<script src="SpryAssets/SpryValidationTextField.js" type="text/javascript"></script>
<s:head theme="xhtml" /><!-- 預設 -->
<sx:head debug="false" cache="false" parseContent="false"	compressed="false" extraLocales="zh-tw,en-us,ja,ko" />
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>

<body>
<div class="container">
<jsp:include page="placeJsp/top.jsp" /><jsp:include page="placeJsp/sidebar1.jsp" />
  <div class="content">
 <!-- 內文-->
  <%
 ProductVO productVO = (ProductVO) request.getAttribute("productVO");
%>
 <div class="container">
  <h2>新增產品</h2>
  <form class="form-horizontal" role="form" ACTION="ProductServlet"  ENCTYPE="multipart/form-data" method="post">
  
      <div class="form-group">
      <label class="control-label col-sm-2" for="cid">商品類別</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="cid" placeholder="10,20,30,40,50" size="45" name="cid">
      </div>
    </div>
      
  
    <div class="form-group">
      <label class="control-label col-sm-2" for="name">商品名稱</label>
      <div class="col-sm-10">
        <input type="text" class="form-control" id="name"  placeholder="中英文學名" size="45" name="name">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="price">商品價格</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="price" placeholder="整數數字" size="45" name="price">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="discount">商品折扣</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="discount" placeholder="*0.n" size="45" name="discount">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="descrip">商品描述</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="descrip" placeholder="用途介紹" size="45" name="descrip">
      </div>
    </div>
    <div class="form-group">
      <label class="control-label col-sm-2" for="ingredients">商品成分</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="ingredients" placeholder="依食品衛生法標示" size="45" name="ingredients">
      </div>
    </div>
   <div class="form-group">
      <label class="control-label col-sm-2" for="amount">庫存量</label>
      <div class="col-sm-10">          
        <input type="text" class="form-control" id="amount" placeholder="庫存量" size="45" name="amount">
      </div>
    </div>
<!--     <form> -->
<div class="form-group">
<label class="control-label col-sm-2" for="photo">商品圖片</label>
<div class="col-sm-10">
    <input type='file' class="upl"  name="photo">
</div>
    <div>
        <img class="preview" style="max-width: 150px; max-height: 150px;">
        <div class="size"></div>
    </div>
    </div>
<script type="text/javascript">
$(function (){
	 
    function format_float(num, pos)
    {
        var size = Math.pow(10, pos);
        return Math.round(num * size) / size;
    }
 
    function preview(input) {
 
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            
            reader.onload = function (e) {
                $('.preview').attr('src', e.target.result);
                var KB = format_float(e.total / 1024, 2);
                $('.size').text("檔案大小：" + KB + " KB");
            }
 
            reader.readAsDataURL(input.files[0]);
        }
    }
 
    $("body").on("change", ".upl", function (){
        preview(this);
    })
    
})

$("body").on("change", ".upl", function (){
    preview(this);
})
/**
 * 預覽圖
 * @param   input 輸入 input[type=file] 的 this
 */
function preview(input) {
 
    // 若有選取檔案
    if (input.files && input.files[0]) {
 
        // 建立一個物件，使用 Web APIs 的檔案讀取器(FileReader 物件) 來讀取使用者選取電腦中的檔案
        var reader = new FileReader();
 
        // 事先定義好，當讀取成功後會觸發的事情
        reader.onload = function (e) {
            
            console.log(e);
 
            // 這裡看到的 e.target.result 物件，是使用者的檔案被 FileReader 轉換成 base64 的字串格式，
            // 在這裡我們選取圖檔，所以轉換出來的，會是如 『data:image/jpeg;base64,.....』這樣的字串樣式。
            // 我們用它當作圖片路徑就對了。
            $('.preview').attr('src', e.target.result);
 
            // 檔案大小，把 Bytes 轉換為 KB
            var KB = format_float(e.total / 1024, 2);
            $('.size').text("檔案大小：" + KB + " KB");
        }
 
        // 因為上面定義好讀取成功的事情，所以這裡可以放心讀取檔案
        reader.readAsDataURL(input.files[0]);
    }
}
/**
 * 格式化
 * @param   num 要轉換的數字
 * @param   pos 指定小數第幾位做四捨五入
 */
function format_float(num, pos)
{
    var size = Math.pow(10, pos);
    return Math.round(num * size) / size;
}
</script>
<!-- </form> -->
   <c:if test="${not empty errorMsg}">
	<font color='red'>請修正以下錯誤:
	<ul>
		<c:forEach var="message" items="${errorMsg}">
			<li>${message}</li>
		</c:forEach>
	</ul>
	</font>
</c:if>

    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
      						<input type="hidden" name="action" value="addProduct">
        <button type="submit" class="btn btn-default">新增產品</button>
      </div>
    </div>
  </form>
</div>
 
<!-- end .content --></div>
<jsp:include page="placeJsp/footer.jsp" />
  <!-- end .container --></div>
<script type="text/javascript">
var sprytextfield1 = new Spry.Widget.ValidationTextField("sprytextfield1");
</script>
</body>
</html>
