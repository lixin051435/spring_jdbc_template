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
					<td class="outDetail" style="width: 30%">分类： <label
						style="font-weight: bold; color: red"> </label>
					</td>
					<td class="outDetail2"><select id="types" name="types">
							<option value="蔬菜类" ${map.types=='蔬菜类'?'selected':'' }>蔬菜类</option>
							<option value="肉类" ${map.types=='肉类'?'selected':'' }>肉类</option>
							<option value="水果类" ${map.types=='水果类'?'selected':'' }>水果类</option>
							<option value="水产品" ${map.types=='水产品'?'selected':'' }>水产品</option>
							<option value="调味品" ${map.types=='调味品'?'selected':'' }>调味品</option>
					</select></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">名称： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input type="text" id="scName"
						value="${map.scName }" name="scName" /></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">图片： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><input id="f_fileImg0" name="cmfile"
						onchange="triggerUploadImg0(this);" title="选择图片" type="file">
						<input class="text" type="hidden" name="pic" id="bbbbbImg0"
						value="${map.pic }"> <c:if test="${map.pic!=null }">
							<img style='width:100px;' src="${ctx }/${map.pic}" id="aaaaaImg0" />
						</c:if></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">内容： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><textarea rows="5" id="content1"
							cols="50" name="content1">${map.content1 }</textarea></td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">美护品测评推荐： <label
						style="font-weight: bold; color: red"> </label></td>
					<td class="outDetail2"><textarea rows="5" id="editor1"
							cols="50" name="content2">${map.content2 }</textarea><ckeditor:replace
							replace="editor1" basePath="${ctx }/resource/plugin/ckeditor/" /></td>
				</tr>
				<c:if test="${1==1 }"></c:if>
				<%--<input name="newDate" id="newDate" value="${map.newDate }" type="text" onClick="WdatePicker()"/> --%>
				<%--
				<tr height="25">
					<td class="outDetail" style="width: 30%">图片： <label
						style="font-weight: bold; color: red"> * </label></td>
					<td class="outDetail2"><input id="f_file" name="cmfile"
						onchange="triggerUpload(this);" title="选择图片" type="file">
						<input class="text" type="hidden" name="img" value="${map.img }">
						<img id="imgUrlShow" style="width: 100px;" src="${ctx}/${map.img }" />
					</td>
				</tr>
				--%>
				<%--
				<tr height="25">
					<td class="outDetail" style="width: 30%">是否特价： <label
						style="font-weight: bold; color: red"> * </label></td>
					<td class="outDetail2">
					<select name="isSale">
							<option value="是" ${map.isSale=='是'?'selected':'' }>是</option>
							<option value="否" ${map.isSale=='否'?'selected':'' }>否</option>
					</select>
				</tr>
				 --%>
				<%--
				<tr height="25">
					<td class="outDetail" style="width: 30%">图书分类的外键： <label
						style="font-weight: bold; color: red"> * </label></td>
					<td class="outDetail2">
					<select name="typeId">
							<c:forEach items="${typeList }" var="lists">
								<option value="${lists.id }" ${map.typeId==lists.id?'selected':'' }>${lists.typeName
									}</option>
							</c:forEach>
					</select>
				</tr>
				 --%>
			</table>
		</center>
		<p align="center">
			<br>
			<c:if test="${param.method!='show' }">
				<input type="button" class="btn" value="保  存" onclick="save(this);" />
			</c:if>
			<input type="button" class="btn" value="关  闭"
				onclick="window.close();" />
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
