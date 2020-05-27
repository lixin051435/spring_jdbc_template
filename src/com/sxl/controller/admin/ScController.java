
package com.sxl.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sxl.controller.MyController;

@Controller("scController")
@RequestMapping(value = "/admin/sc")
public class ScController extends MyController {
	

	@RequestMapping(value = "/frame")
	public String frame(Model model, HttpServletRequest request,String flag)throws Exception {
		return "/admin/sc/frame";
	}
	
	@RequestMapping(value = "/list")
	public String list(Model model, HttpServletRequest request,String flag,String types,String scName)throws Exception {
		String sql="select a.* from t_sc a where 1=1";


	if(types!=null&&!"".equals(types)){
			sql+=" and types like '%"+types+"%'";
		}
	if(scName!=null&&!"".equals(scName)){
			sql+=" and scName like '%"+scName+"%'";
		}
		sql+=" order by id desc";
		List list = db.queryForList(sql);
		request.setAttribute("list", list);
		return "/admin/sc/list";
	}
	
	@RequestMapping(value = "/editSave")
	public ResponseEntity<String> editSave(Model model,HttpServletRequest request,Long id,String flag
		,String types,String scName,String pic,String content1,String content2) throws Exception{
		int result = 0;
		if(id!=null){
			String sql="update t_sc set types=?,scName=?,pic=?,content1=?,content2=? where id=?";
			result = db.update(sql, new Object[]{types,scName,pic,content1,content2,id});
		}else{
			String sql="insert into t_sc(types,scName,pic,content1,content2) values(?,?,?,?,?)";
			result = db.update(sql, new Object[]{types,scName,pic,content1,content2});
		}
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
	}
	
	@RequestMapping(value = "/editDelete")
	public ResponseEntity<String> editDelete(Model model,HttpServletRequest request,Long id,String flag) throws Exception {
		
		String sql="delete from t_sc where id=?";
		int result = db.update(sql, new Object[]{id});
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
		
	}
	
	@RequestMapping(value = "/edit")
	public String edit(Model model, HttpServletRequest request,Long id,String flag)throws Exception {
		if(id!=null){
			//修改
			String sql="select * from t_sc where id=?";
			Map map = db.queryForMap(sql,new Object[]{id});
			model.addAttribute("map", map);
		}String sql="";

		return "/admin/sc/edit";
	}
}
