<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/taglibs.jsp"%>
<%@taglib prefix="ckeditor" uri="http://ckeditor.com"%>
<script type="text/javascript" src="${ctx}/js/easy_validator.pack.js"></script>
<script type="text/javascript" src="${ctx}/js/jquery.bgiframe.min.js"></script>
<script type="text/javascript"
	src="${ctx }/resource/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript"
	src="${ctx}/resource/admin/js/ajaxfileupload.js"></script>
<link href="${ctx}/css/validate.css" rel="stylesheet" type="text/css" />
<link rel="StyleSheet" href="${ctx }/resource/mine/one/mine.css"
	type="text/css" />
<html>
<head>
<title>信息内容功能</title>
</head>
<body>
	<form id="form1" name="form1" action="" method="post">
		<input type="hidden" value="${param.flag }" name="flag" /> <input
			type="hidden" value="${map.id }" name="id" id="id" />
		<center>
			<table class="mobile" style="width: 95%;">
				<tr class="pageheader">
					<td colspan="2"><strong>信息处理</strong></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">最新活动： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2">
					<textarea rows="5" cols="50"
							name="title" id="editor1">${map.title }</textarea>
							<ckeditor:replace
							replace="editor1" basePath="${ctx }/resource/plugin/ckeditor/" /></td>
				</tr>
				<c:if test="${1==1 }"></c:if>
				
			</table>
		</center>
		<p align="center">
			<br>
			<c:if test="${param.method!='show' }">
				<input type="button" class="btn" value="保  存" onclick="save(this);" />
			</c:if>
		</p>
	</form>
</body>
<script type="text/javascript">
	function save(src) {
	$("#editor1").val(CKEDITOR.instances.editor1.getData());
		$.post("editSave.html", $("#form1").serializeArray(), function(result) {
			result = eval("(" + result + ")");
			if (result.status == "true" || result.status == true) {
				alert('成功');
				saveAnd();
			} else {
				alert('保存失败，请重试');
			}
		});
	}
	function triggerUpload(src) {
		$.ajaxFileUpload({
			url : '${ctx}/file/upload.json',
			secureuri : false,
			fileElementId : 'f_file',
			dataType : 'json',
			data : {
				fileloc : 'upload/',
				dir : 'temp'
			},
			success : function(data, status) {
				$("input[name='img']").val(data.data.filepath);
				$("#imgUrlShow").attr("src",
						"${ctx}/" + data.data.filepath + "");
			},
			error : function(data, status, e) {
				alert('文件上传失败');
			}
		});
	}
</script>
</html>
