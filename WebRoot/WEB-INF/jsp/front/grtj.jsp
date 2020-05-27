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

                                                <article class=" page type-page hentry clearfix">
                                                        <h1 class="post-title"><a href="#">网站信息反馈</a></h1>
                                                        <hr>
                                                        
                                                        
                                                     <form id="form1" name="form1" action=""
			method="post">
			<center>
				<table class="mobile" style="width: 95%;">
				<tr height="25">
					<td class="outDetail" style="width: 30%">
						问题1:小伙伴你对网站是否满意？
						<label style="font-weight: bold; color: red">
						</label>
					</td>
					<td class="outDetail2">
						<textarea rows="5"  id="v1" cols="50" name="v1">${map.v1 }</textarea>
					</td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">
						问题2：该网站对你有帮助吗？
						<label style="font-weight: bold; color: red">
						</label>
					</td>
					<td class="outDetail2">
						<textarea rows="5"  id="v2" cols="50" name="v2">${map.v2 }</textarea>
					</td>
				</tr>
				<tr height="25">
					<td class="outDetail" style="width: 30%">
						问题3：有什么需要我改进的吗？
						<label style="font-weight: bold; color: red">
						</label>
					</td>
					<td class="outDetail2">
						<textarea rows="5"  id="v3" cols="50" name="v3">${map.v3 }</textarea>
					</td>
				</tr>
				</table>
			</center>
			<p align="center">
				<br>
<input type="button" class="btn" value="保  存" onclick="save(this);" />
			</p>
		</form>
                                                        
                                                </article>
                                        </div>
                                </div>
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
	
		$.post("${ctx}/admin/huida/editSave.html",$("#form1").serializeArray(),
		       function(result){
		        	result = eval("("+result+")");
		    		if(result.status == "true" || result.status == true){
  			            window.location.href='${ctx}/front/wdxxShow.html?id='+result.msg;

		    		}else{
		    			alert('保存失败，请重试');
		    		}
		        }
			);
	}
	
	function registerSaveuser() {
		var username = $("#user_username").val();
		var password = $("#user_password").val();
		var password2 = $("#user_password2").val();
		var phone = $("#user_phone").val();
		if (username == '' || password == '') {
			alert('用户名和密码必须填写');
			return false;
		}
		if (password2 !=password) {
			alert('两次密码输入不一致');
			return false;
		}
		$.ajax({
			type : "POST",
			async : false, // 设置同步方式
			cache : false,
			url : "${ctx}/front/registerSave.html",
			data : $("#registerFormuser").serializeArray(),
			success : function(result) {
				result = eval("(" + result + ")");
				if (result.status == 'true' || result.status == true) {
					alert('注册成功');
					window.parent.location.href = "${ctx}/front/index.html";
				}
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
</script>
</html>