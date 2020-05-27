
package com.sxl.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sxl.controller.MyController;

@Controller("fzjcController")
@RequestMapping(value = "/admin/fzjc")
public class FzjcController extends MyController {
	

//保存肤质检测
	@RequestMapping(value = "/editSave")
	public ResponseEntity<String> editSave(Model model,HttpServletRequest request,Long id,String flag
		,String title) throws Exception{
		int result = 0;
		String sql="delete from t_fzjc ";
		db.update(sql);
		 sql="insert into t_fzjc(content) values(?)";
		result = db.update(sql, new Object[]{title});
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
	}
	
//查看肤质检测
	
	@RequestMapping(value = "/edit")
	public String edit(Model model, HttpServletRequest request,Long id,String flag)throws Exception {
		String sql="select * from t_fzjc ";
		List<Map> list = db.queryForList(sql);
		Map map = null;
		if(list!=null&&list.size()>0){
			map = list.get(0);
		}
		model.addAttribute("map", map);
		return "/admin/fzjc/edit";
	}
}
