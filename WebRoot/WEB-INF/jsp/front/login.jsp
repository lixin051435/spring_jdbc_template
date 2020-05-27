<%@ page language="java" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en-US">
<%@ include file="inc/head.jsp"%>
<!-- Start of Page Container -->
<div class="page-container">
	<div class="container">
		<div class="row">

			<!-- start of page content -->
			<div class="span8 page-content">

				<article class="type-page hentry clearfix">
					<h1 class="post-title">
						<a href="#">欢迎您登录</a>
					</h1>
					<hr>
					<p>欢迎您使用美护品测评网站</p>
				</article>
				<form id="login_form" class="row"
					method="post" novalidate="novalidate">

					<div class="span2">
						<label for="name">账号 <span>*</span> </label>
					</div>
					<div class="span6">
						<input type="text" name="username" id="login_username" placeholder="账号">
					</div>

					<div class="span2">
						<label for="email">密码<span>*</span>
						</label>
					</div>
					<div class="span6">
						<input type="password" name="password" id="login_password" placeholder="密码">
					</div>
					<div class="span2">
						<label for="email">验证码<span>*</span>
						</label>
					</div>
					<div class="span6">
						<input type="text" name="yzm" id="login_password" placeholder="验证码">
						<img src="${ctx }/public/image/validateImg.html" onclick="this.src='${ctx }/public/image/validateImg.html?d='+Math.random();" id="checkCode"/>
					</div>
					 <div class="checkbox">
			          <label>
			            <a href="find.html">忘记密码？</a>
			          </label>
			        </div>
					<div class="span6 offset2 bm30">
						<input type="button" name="button" onclick="login();" value="登录"
							class="btn btn-inverse"> 
					</div>
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
	function login() {
		var username = $("#login_username").val();
		var password = $("#login_password").val();
		var type = $("#type").val();
		if (username == '' || password == '') {
			alert('用户名和密码必须填写');
			return false;
		}
		var yzm = $("input[name='yzm']").val();
		if(yzm==''){
			alert('请输入验证码');
			return false;
		}
		var aa = "";
		var bb = "";
		aa = "${ctx}/front/save.html";
		bb = "${ctx}/front/index.html";
		$.ajax({
			type : "POST",
			async : false, // 设置同步方式
			cache : false,
			url : aa,
			data : $("#login_form").serializeArray(),
			success : function(result) {
				result = eval("(" + result + ")");
				if (result.status == "true" || result.status == true) {
					alert('登录成功');
					window.parent.location.href = bb;  //跳转到index登入页面了
				}else{
					if(result.msg=='1'){
						alert('验证码不正确，请重新输入');
						$("#checkCode").attr("src","${ctx }/public/image/validateImg.html?random="+Date.parse(new Date()));
						return false;
					}else if(result.msg=='2'){
						alert('用户名或密码错误');
						return false;
					}
				}
			}
		});
	}
</script>
</html>