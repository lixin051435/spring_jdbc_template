package com.sxl.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sxl.controller.MyController;
import com.sxl.util.StringHelper;


@Controller("adminLoginController")
@RequestMapping(value = "/adminLogin")
public class AdminLoginController extends MyController {
	
//登录
	@RequestMapping(value = "/login")
	public String index(Model model, HttpServletRequest request)throws Exception {
		return "/admin/login";
	}
	
	@RequestMapping(value = "/save")
	public ResponseEntity<String> loginSave(Model model,HttpServletRequest request,String username,String password) throws Exception {
		String sql="select * from t_admin where username=?";
		List<Map> list = db.queryForList(sql, new Object[]{username});
		String result="1";
		if(list!=null&&list.size()>0){
			Map map = list.get(0);
			if(StringHelper.get(map, "password").equals(password)){
				request.getSession().setMaxInactiveInterval(60*60*24);
				request.getSession().setAttribute("adminBean", map);
				result="1";
			}else{
				result="0";
			}
		}else{
			result="0";
		}
		return renderData(true,result,null);
	}

	//管理员注销	
	@RequestMapping(value = "/out")
	public String out(Model model, HttpServletRequest request)throws Exception {
		request.getSession().removeAttribute("adminBean");
		return "redirect:/adminLogin/login.html";
	}
	
}
