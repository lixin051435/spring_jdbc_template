
package com.sxl.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sxl.controller.MyController;

/**
*问题
* @date2018-04-26
*/
@Controller("huidaController")
@RequestMapping(value = "/admin/huida")
public class HuidaController extends MyController {
	

/**
* 查询frame
*/
	@RequestMapping(value = "/frame")
	public String frame(Model model, HttpServletRequest request,String flag)throws Exception {
		return "/admin/huida/frame";
	}
	
/**
* 查询列表
*/
	@RequestMapping(value = "/list")
	public String list(Model model, HttpServletRequest request,String flag)throws Exception {
		//select date_format(insertDate, '%Y-%m-%d %H:%i:%s')
		//CONVERT(varchar, insertDate, 120 )
		//to_char(insertDate,'yyyy-mm-dd,hh24:mi:ss') 

		String sql="select a.*,(select max(name) from t_customer b where a.customerId=b.id) name  from t_huida a where 1=1 ";

if(1==2){sql+=" and customerId="+getCustomer(request).get("id") +" ";}
		sql+=" order by id desc";
		List list = db.queryForList(sql);
		request.setAttribute("list", list);
		return "/admin/huida/list";
	}
	
/**
* 编辑保存（包含修改和添加）
*/
	@RequestMapping(value = "/editSave")
	public ResponseEntity<String> editSave(Model model,HttpServletRequest request,Long id,String flag
		,Integer customerId,String v1,String v2,String v3,String insertDate) throws Exception{
		int result = 0;
		if(id!=null){
			String sql="update t_huida set v1=?,v2=?,v3=? where id=?";
			result = db.update(sql, new Object[]{v1,v2,v3,id});
		}else{
			String sql="insert into t_huida(customerId,v1,v2,v3,insertDate) values(?,?,?,?,now())";
			result = db.update(sql, new Object[]{getCustomer(request).get("id"),v1,v2,v3});
		}
		
		Map map = db.queryForMap("select id from t_wdxx order by rand() limit 1");
		return renderData(true,map.get("id").toString(),null);
		
	}
	
/**
* 删除信息
*/
	@RequestMapping(value = "/editDelete")
	public ResponseEntity<String> editDelete(Model model,HttpServletRequest request,Long id,String flag) throws Exception {
		
		String sql="delete from t_huida where id=?";
		int result = db.update(sql, new Object[]{id});
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
		
	}
	
/**
* 跳转到编辑页面
*/
	@RequestMapping(value = "/edit")
	public String edit(Model model, HttpServletRequest request,Long id,String flag)throws Exception {
		if(id!=null){
			//修改
			String sql="select * from t_huida where id=?";
			Map map = db.queryForMap(sql,new Object[]{id});
			model.addAttribute("map", map);
		}String sql="";

		return "/admin/huida/edit";
	}
}
