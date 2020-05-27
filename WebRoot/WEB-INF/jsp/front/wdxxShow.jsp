<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en-US">
<%@ include file="inc/head.jsp"%>
					  <link href="${ctx }/resource/sp/video-js.css" rel="stylesheet" type="text/css">
  <!-- video.js must be in the <head> for older IEs to work. -->
  <script src="${ctx }/resource/sp/video.js"></script>
<!-- Start of Page Container -->
<div class="page-container">
	<div class="container">
	<c:if test="${param.dpc==999 }">
    <a class="btn btn-primary" href="wdxxEdit.html"  role="button">发布一条动态</a></c:if>
		<div class="row">
			<div class="span8 main-listing">
				<article class=" type-post format-image hentry clearfix">
					<header class="clearfix">
						<h3 class="post-title">
							<a href="#">${map.title }</a>
						</h3>
						<div class="post-meta clearfix">
							<span class="date">${map.insertDate }</span> <span class="category">
							</span> <span class="comments">
							</span> <span class="like-count" onclick="zan('${map.id}');">赞(${map.zans })</span>
							<input type="button" class="btn btn-default" value="收藏"
								onclick="scSave('${map.id}');" />
						</div>
						<!-- end of post meta -->
					</header>
					<a href="#" title="Using Images">
					<c:if test="${map.pic!=null&&map.pic!=''}">
					<img height="100" src="${ctx }/${map.pic}"
						class="attachment-std-thumbnail wp-post-image" alt="Living room">
					</c:if>
					</a>
					<a href="#" title="Using Images">
					<c:if test="${map.ship!=null&&map.ship!=''}">
					<video id="example_video_1" class="video-js vjs-default-skin" controls preload="none" width="800px" height="264"
					      data-setup="{}">
					    <!--  <source src="http://vjs.zencdn.net/v/oceans.mp4" type='video/mp4' />-->
					    <source src="${ctx }/${map.ship }" type='video/mp4' />
					  </video>
					</c:if>
					</a>
					<!-- JiaThis Button BEGIN -->
								<div class="jiathis_style">
									<a class="jiathis_button_qzone"></a>
									<a class="jiathis_button_tsina"></a>
									<a class="jiathis_button_tqq"></a>
									<a class="jiathis_button_weixin"></a>
									<a class="jiathis_button_renren"></a>
									<a href="http://www.jiathis.com/share" class="jiathis jiathis_txt jtico jtico_jiathis" target="_blank"></a>
									<a class="jiathis_counter_style"></a>
								</div>
								<script type="text/javascript" src="http://v3.jiathis.com/code/jia.js" charset="utf-8"></script>
								<!-- JiaThis Button END -->
					<p>${map.content }</p>
				</article>
			</div>
		</div>
		
		<ul class="list-group">
	<c:forEach items="${list }" var="lists">
		<li class="list-group-item">${lists.customerName }:${lists.content }(${lists.insertDate })</li>
	</c:forEach>
</ul>
<c:if test="${customerBean!=null&&customerBean.ispl!='否' }">
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
</c:if>

		
		
		
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
		$.post("pinglunSave.html", $("#form1").serializeArray(), function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				alert('成功');
				window.location.reload();
			} else {
				alert('保存失败，请重试');
			}
		});
	}
	
	function zan(id) {
		if(!checkIsLogin()){
			alert('请先登录');
			window.location.href='${ctx}/front/login.html';
			return false;
		}
		$.post("zanSave.html", {id:id}, function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				alert('点赞成功');
				window.location.reload();
			} else {
				alert('取消成功');
				window.location.reload();
			}
		});
	}
	
	
	function scSave(id) {
		if(!checkIsLogin()){
			alert('请先登录');
			window.location.href='${ctx}/front/login.html';
			return false;
		}
		$.post("scSave.html", {id:id}, function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				alert('收藏成功');
				window.location.reload();
			} else {
				alert('保存失败，请重试');
			}
		});
	}
  </script>
</html>