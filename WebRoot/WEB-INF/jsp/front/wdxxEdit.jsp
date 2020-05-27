<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en-US">
<%@ include file="inc/head.jsp"%>
<%@taglib prefix="ckeditor" uri="http://ckeditor.com"%>
<!-- Start of Page Container -->
<div class="page-container">
	<div class="container">
		<div class="row">

			<!-- start of page content -->
			<div class="span8 page-content">

				<article class="type-page hentry clearfix">
					<h1 class="post-title">
						<a href="#">发布帖子</a>
					</h1>
					<hr>
					<p>欢迎您使用美护品测评网站</p>
				</article>
				<form id="form1">
    
    <input type="hidden" value="${param.flag }" name="flag" /> <input
			type="hidden" value="${map.id }" name="id" id="id" />
    
    <table class="mobile" style="width: 95%;">
				<tr class="pageheader">
					<td colspan="2"><strong>信息处理</strong></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">标题： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input  class="form-control" type="text" id="title"
						value="${map.title }" name="title" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">产品名称： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input  class="form-control" type="text" id="cpmc"
						value="${map.cpmc }" name="cpmc" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">成分： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input  class="form-control" type="text" id="cf"
						value="${map.cf }" name="cf" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">标题图片： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input  class="form-control" id="f_fileImg0" name="cmfile"
						onchange="triggerUploadImg0(this);" title="选择图片" type="file">
						<input class="text"  type="hidden" name="pic" id="bbbbbImg0"
						value="${map.pic }"> <c:if test="${map.pic!=null }">
							<img style='width:100px;' src="${ctx }/${map.pic}" id="aaaaaImg0" />
						</c:if></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">内容： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2">
					<textarea id="editor1"  class="form-control" rows="5" 
							cols="50" name="content">${map.content }</textarea>
					<ckeditor:replace
							replace="editor1" basePath="${ctx }/resource/plugin/ckeditor/" />    
					</td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">视频： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input  class="form-control" id="f_fileImg2" name="cmfile"
						onchange="triggerUploadImg2(this);" title="选择视频" type="file">
						<input class="text"  type="hidden" name="ship" id="bbbbbImg2"
						value="${map.ship }"> <c:if test="${map.ship!=null }">
							<a href="${ctx }/${map.ship}" id="aaaaaImg2">视频查看</a>
						</c:if></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">是否游客可见： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2">
						<select name="nologin" class="form-control" >
							<option ${map.nologin=='是'?'selected':'' } value="是">是</option>
							<option ${map.nologin=='否'?'selected':'' } value="否">否</option>
						</select>
					</td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">产品主题选择： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2" class="form-control" >
						<select name="bkId">
							<c:forEach items="${rightBkList }" var="lists">
								<option ${map.bkId==lists.id?'selected':'' } value="${lists.id }">${lists.bkName }</option>
							</c:forEach>
						</select>
					
					
					
					</td>
				</tr>
			</table>
    <input type="button" class="btn btn-default" value="保  存"
				onclick="save(this);" /> <input type="button" 
				value="返回" class="btn btn-default" onclick="window.history.go(-1)" />
    
    </form>
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
  	function save(src) {
  	$("#editor1").val(CKEDITOR.instances.editor1.getData());
		$.post("wdxxEditSave.html", $("#form1").serializeArray(), function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				alert('成功');
				window.location.reload();
			} else {
				alert('保存失败，请重试');
			}
		});
	}
	function triggerUploadImg0(src) {
		$
				.ajaxFileUpload({
					url : '${ctx}/file/upload.json',
					secureuri : false,
					fileElementId : 'f_fileImg0',
					dataType : 'json',
					data : {
						fileloc : 'upload/',
						dir : 'temp'
					},
					success : function(data, status) {
						$("#bbbbbImg0").val(data.data.filepath);
						$("#aaaaaImg0").remove();
						$("#bbbbbImg0")
								.after(
										"<img  id='aaaaaImg0' style='width:100px;' src='${ctx}/"+data.data.filepath+"' />");
					},
					error : function(data, status, e) {
						alert('文件上传失败');
					}
				});
	}
	
	function triggerUploadImg2(src) {
		$
				.ajaxFileUpload({
					url : '${ctx}/file/upload.json',
					secureuri : false,
					fileElementId : 'f_fileImg2',
					dataType : 'json',
					data : {
						fileloc : 'upload/',
						dir : 'temp'
					},
					success : function(data, status) {
						$("#bbbbbImg2").val(data.data.filepath);
						$("#aaaaaImg2").remove();
						$("#bbbbbImg2")
								.after(
										"<a id='aaaaaImg2' href='${ctx}/"+data.data.filepath+"'>视频查看</a>");
					},
					error : function(data, status, e) {
						alert('文件上传失败');
					}
				});
	}
  </script>
</html>