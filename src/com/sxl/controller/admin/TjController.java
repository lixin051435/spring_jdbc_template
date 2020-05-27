
package com.sxl.controller.admin;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sxl.controller.MyController;

@Controller("TjController")
@RequestMapping(value = "/admin/tj")
public class TjController extends MyController {
	

	@RequestMapping(value = "/tj1")
	public String tj1(Model model, HttpServletRequest request,String flag)throws Exception {
		String sql="select date_format(insertDate,'%y-%m-%d') days ,count(1) counts from t_wdxx group by date_format(insertDate,'%y-%m-%d')";
		List<Map> list = db.queryForList(sql);
		model.addAttribute("list", list);
		return "/admin/tj/tj1";
	}
	
	
	@RequestMapping(value = "/tj2")
	public String tj2(Model model, HttpServletRequest request,String flag)throws Exception {
		String sql="select date_format(insertDate,'%y-%m-%d') days ,count(1) counts from t_customer group by date_format(insertDate,'%y-%m-%d')";
		List<Map> list = db.queryForList(sql);
		model.addAttribute("list", list);
		return "/admin/tj/tj2";
	}
	
	
	
	@RequestMapping(value = "/tj3")
	public String tj3(Model model, HttpServletRequest request)throws Exception {
		String sql="select * from t_wdxx order by zan desc limit 10";
		String aa="";
		List<Map> list = db.queryForList(sql);
		String a="{name: '点赞',data: [";
		for (int i = 0; i < list.size(); i++) {
			if(i==0){
				a+=""+list.get(i).get("zan");
				aa+="'"+list.get(i).get("title")+"'";
			}else{
				a+=","+list.get(i).get("zan");
				aa+=",'"+list.get(i).get("title")+"'";
			}
		}
		a+="]}";
		model.addAttribute("a", a);
		model.addAttribute("aa",aa);
		return "/admin/tj/tj3";
	}
	
}
