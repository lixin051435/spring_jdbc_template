<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en-US">
<%@ include file="inc/head.jsp"%>
<!-- Start of Page Container -->
<div class="page-container">
	<div class="container">
		<div class="row">

			<!-- start of page content -->
			<div class="span12 page-content">

				<article class="type-page hentry clearfix">

					<h1 class="post-title">
						<a href="#">好友搜索</a>
					</h1>

					<div class="row-fluid">
					<c:forEach items="${list }" var="lists">
						<div class="span3">
							<br>
							<h4>${lists.name }</h4>
							<p><img src="${ctx }/${lists.headPic }" style="width: 80px;"></p>
								<c:choose>
					          		<c:when test="${lists.isGz==1 }">
					          			<a class="btn btn-danger" href="#" onclick="qxgz('${lists.id}');" role="button">取消关注</a>
					          		</c:when>
					          		<c:otherwise>
					          			<a class="btn btn-primary" href="#"  onclick="gz('${lists.id}');" role="button">关注</a>
					          		</c:otherwise>
					          	</c:choose>
						</div>
					</c:forEach>
					</div>
					</div>
				</article>
			</div>
			<!-- end of page content -->

		</div>
	</div>
</div>
<!-- End of Page Container -->
<%@ include file="inc/foot.jsp"%>
<%@ include file="inc/js.jsp"%>
</body>
  <script type="text/javascript">
  	function search(){
  		form1.submit();
  	}
  
  	function qxgz(id){
		$.ajax({
			type : "POST",
			async : false, // 设置同步方式
			cache : false,
			url : "qxgz.html",
			data : {id:id},
			success : function(result) {
				result = eval("(" + result + ")");
				if (result.status == 'true' || result.status == true) {
					alert('取消成功');
						window.location.reload();
				}
			}
		});
  	}
  	
  	function gz(id){
		$.ajax({
			type : "POST",
			async : false, // 设置同步方式
			cache : false,
			url : "gz.html",
			data : {id:id},
			success : function(result) {
				result = eval("(" + result + ")");
				if (result.status == 'true' || result.status == true) {
					alert('关注成功');
						window.location.reload();
				}
			}
		});
  	}
  </script>
</html>