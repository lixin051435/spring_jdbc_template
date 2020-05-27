<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en-US">
<%@ include file="inc/head.jsp"%>
<!-- Start of Page Container -->
<div class="page-container">
	<div class="container">
		<div class="row">
			<div class="span8 main-listing">
				<article class=" type-post format-image hentry clearfix">
					<header class="clearfix">
						<h3 class="post-title">
							<a href="#">${map.msName }</a>
						</h3>
						<div class="post-meta clearfix">
							<span class="date">${map.types }</span> <span class="category">
							</span> <span class="comments">
							</span>
						</div>
						<!-- end of post meta -->
					</header>
					<a href="#" title="Using Images">
					</a>
					<p>${map.content }</p>
				</article>
			</div>
		</div>
		
		<ul class="list-group">
	<c:forEach items="${list }" var="lists">
		<li class="list-group-item">${lists.customerName }:${lists.content }(${lists.insertDate })</li>
	</c:forEach>
</ul>
<form id="form1">
	<input type="hidden" name="wdxxId" value="${map.id }"/>
    <table class="mobile" style="width: 95%;">
				<tr height="25">
					<td class="outDetail" style="width: 30%">评论内容： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><textarea  class="form-control" rows="5" id="content"
							cols="50" name="content"></textarea></td>
				</tr>
			</table>
    <input type="button" class="btn btn-default" value="发表评论"
				onclick="save(this);" />
    
    </form>

		
		
		
	</div>
</div>
<!-- End of Page Container -->
<%@ include file="inc/foot.jsp"%>
<%@ include file="inc/js.jsp"%>
</body>
 <script type="text/javascript">
  	function save(src) {
  		if(!checkIsLogin()){
			alert('请先登录');
			window.location.href='${ctx}/front/login.html';
			return false;
		}
		$.post("msSave.html", $("#form1").serializeArray(), function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				alert('成功');
				window.location.reload();
			} else {
				alert('保存失败，请重试');
			}
		});
	}
	
  </script>
</html>