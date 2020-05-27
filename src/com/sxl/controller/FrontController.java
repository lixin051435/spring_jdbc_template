package com.sxl.controller;

import java.util.List;
import java.util.Map;
import java.util.TreeSet;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sxl.controller.suanfa.Aprioti;
import com.sxl.controller.suanfa.Itemset;
import com.sxl.util.RandomValidateCode;
import com.sxl.util.StringHelper;

@Controller("webController")
@RequestMapping(value = "/front")
public class FrontController extends MyController {

	///用户的基本功能开始///////////////////////////////////////////////
	@RequestMapping(value = "/index")
	public String frame(Model model, HttpServletRequest request,String searchName,Long oneClassifyId,String types)
			throws Exception {
		String sql="";
		Map customer = getCustomer(request);
		String sql2="select a.*,(select max(name) from t_customer b where b.id=a.customerId) customerName," +
				"(select bkName from t_bk c where c.id=a.bkId) bkName,(select count(1) from t_dz b where b.wdxxId=a.id) zans from t_wdxx a where 1=1  ";
		if(searchName !=null&&!"".equals(searchName)){
			sql2+=" and a.title like '%"+searchName+"%'";
		}
		if(customer==null||customer.size()==0){
			sql2+=" and a.nologin='是' ";
		}
		if("视频".equals(searchName)){
			sql2+=" and a.ship is not null and a.ship <>'' ";
		}
		sql2+=" order by id desc limit 6";
		System.out.println(sql2);
		List<Map> list2 = db.queryForList(sql2);
		model.addAttribute("list2", list2);
		
		
		//java推荐算法
	tuijiansuanfa(request);
	
	return "/front/index";
	}
	
	@RequestMapping(value = "/index2")
	public String frame2(Model model, HttpServletRequest request,String searchName,Long oneClassifyId,String types)
			throws Exception {
		String sql="";
		Map customer = getCustomer(request);
		String sql2="select a.*,(select max(name) from t_customer b where b.id=a.customerId) customerName," +
				"(select bkName from t_bk c where c.id=a.bkId) bkName,(select count(1) from t_dz b where b.wdxxId=a.id) zans from t_wdxx a where 1=1  ";
		if(searchName !=null&&!"".equals(searchName)){
//			sql2+=" and a.title like '%"+searchName+"%'";//标题搜索
			sql2+=" and (a.title like '%"+searchName+"%' or a.cpmc like '%"+searchName+"%' or a.cf like '%"+searchName+"%' )";	
		}
		if(customer==null||customer.size()==0){
			sql2+=" and a.nologin='是' ";
		}
		if("视频".equals(searchName)){
			sql2+=" and a.ship is not null and a.ship <>'' ";
		}
		sql2+=" order by id desc limit 6";
		System.out.println(sql2);
		List<Map> list2 = db.queryForList(sql2);
		model.addAttribute("list2", list2);
		
		
		return "/front/index2";
	}
	
	public void saveClick(HttpServletRequest request,Long id){
		String sql="insert into t_wdxx_click(wdxxId,customerId,insertDate) values(?,?,now())";
		Map customer = getCustomer(request);
		if(customer!=null&&customer.size()>0){
			db.update(sql, new Object[]{id,getCustomer(request).get("id")});
		}
	}
	/**
	 * 专门有个算法包
	 * 然后算法的逻辑也在这里，
	 * 而且把算法之外额逻辑也加了
	 * 注！为了应对一开始人员访问数据量不够推荐算法使用的情况，就进行了数据补足，这个业务逻辑就非常完美了。
	 * 
	 * java推荐算法
	 * @param request
	 */
	public void tuijiansuanfa(HttpServletRequest request){
			Itemset originalItem = new Itemset();
			List<Map> lista = db.queryForList("select * from t_customer");
			for (int i = 0; i < lista.size(); i++) {
				TreeSet<String> itemset = new TreeSet<String>();
				List<Map> listb = db.queryForList("select * from t_wdxx_click where customerId=?",new Object[]{lista.get(i).get("id")});
				for (int j = 0; j < listb.size(); j++) {
					itemset.add(listb.get(j).get("wdxxId")+"");
				}
				originalItem.itemset.add(itemset);
			}
			Aprioti.originalItem=originalItem;
			List<Long> outList = Aprioti.aprioriProcess();
			String in ="";
			if(outList!=null&&outList.size()>0){
				for (int i = 0; i < outList.size(); i++) {
					in+=","+outList.get(i);
				}
			}

			
			String sqlall="select a.*,(select max(name) from t_customer b where b.id=a.customerId) customerName,(select bkName from t_bk c where c.id=a.bkId) bkName,(select count(1) from t_dz b where b.wdxxId=a.id) zans  from t_wdxx a where 1=1 ";
			String sql=sqlall;
			if(in!=null&&!"".equals(in)){
				sql+=" and id in ("+in.substring(1,in.length())+")";
			}
			sql+="  order by rand() limit 8 ";
			//以上推荐算法最总结果在根据随机安排推荐
			
			//注！为了应对一开始人员访问数据量不够推荐算法使用的情况，就进行了数据补足，这个业务逻辑就非常完美了。
			List tuijianList = db.queryForList(sql);
			int a = 8;
			int b = 0;
			if(tuijianList==null||tuijianList.size()<8){
				if(tuijianList!=null){
					b = 8-tuijianList.size();
				}
				List list2 = db.queryForList(sqlall+" order by rand() limit "+b);
				tuijianList.addAll(list2);
			}else{
				
			}
			request.setAttribute("tuijianList", tuijianList);
	}
	
	
	
	//收索
	@RequestMapping(value = "/all")
	public String all(Model model, HttpServletRequest request,String searchName,Long oneClassifyId,String types)
			throws Exception {
		String sql="";
		Map customer = getCustomer(request);
		String sql2="select a.*,(select max(name) from t_customer b where b.id=a.customerId) customerName," +
				"(select bkName from t_bk c where c.id=a.bkId) bkName,(select count(1) from t_dz b where b.wdxxId=a.id) zans from t_wdxx a where 1=1  ";
		if(searchName !=null&&!"".equals(searchName)){
			sql2+=" and (a.title like '%"+searchName+"%' or a.cpmc like '%"+searchName+"%' or a.cf like '%"+searchName+"%' )";
		}
		if(customer==null||customer.size()==0){
			sql2+=" and a.nologin='是' ";
		}
		if("视频".equals(searchName)){
			sql2+=" and a.ship is not null and a.ship <>'' ";
		}
		sql2+=" order by id";
		List<Map> list2 = db.queryForList(sql2);
		model.addAttribute("list2", list2);
		return "/front/all";
	}
	
	
	
	
	//论坛
	@RequestMapping(value = "/luntan")
	public String luntan(Model model, HttpServletRequest request,String searchName,Long oneClassifyId)
			throws Exception {
		Map customer = getCustomer(request);
		
		
		String sql="select a.*,(select max(name) from t_customer b where b.id=a.customerId) customerName," +
				"(select bkName from t_bk c where c.id=a.bkId) bkName from t_wdxx a where 1=1  ";
		if(searchName !=null&&!"".equals(searchName)){
			sql+=" and a.title like '%"+searchName+"%'";
		}
		if(customer==null||customer.size()==0){
			sql+=" and a.nologin='是' ";
		}
		
		sql+=" order by id desc";
		List<Map> list = db.queryForList(sql);
		model.addAttribute("list", list);
		return "/front/luntan";
	}
	//赞排行
	@RequestMapping(value = "/zanph")
	public String zanph(Model model, HttpServletRequest request,String searchName,Long oneClassifyId)
			throws Exception {
		Map customer = getCustomer(request);
		
		
		String sql="select a.*,(select max(name) from t_customer b where b.id=a.customerId) customerName," +
				"(select bkName from t_bk c where c.id=a.bkId) bkName,(select count(1) from t_dz b where b.wdxxId=a.id) zans from t_wdxx a where 1=1  ";
		if(searchName !=null&&!"".equals(searchName)){
			sql+=" and a.title like '%"+searchName+"%'";
		}
		if(customer==null||customer.size()==0){
			sql+=" and a.nologin='是' ";
		}
		
		sql+=" order by zans desc";
		System.out.println(sql);
		List<Map> list = db.queryForList(sql);
		model.addAttribute("list", list);
		return "/front/zanph";
	}
	
	
	
	public List<Map> initList11(List<Map> list){
		String sql="select * from t_mgc ";
		List<Map> mgcList = db.queryForList(sql);
		if(list!=null&&list.size()>0){
			if(mgcList!=null&&mgcList.size()>0){
				for (int i = 0; i < list.size(); i++) {
					Map map = list.get(i);
					String title = map.get("title").toString();
					String content = map.get("content").toString();
					for (int j = 0; j < mgcList.size(); j++) {
						String mgc = mgcList.get(j).get("mgc").toString();
						title = title.replace(mgc, "***");
						content = content.replace(mgc, "***");
						list.get(i).put("title", title);
						list.get(i).put("content", content);
					}
				}
			}
			
			
		}
		return list;
	}
	
	public Map initMap11(Map map){
		String sql="select * from t_mgc ";
		List<Map> mgcList = db.queryForList(sql);
			if(mgcList!=null&&mgcList.size()>0){
				String title = map.get("title").toString();
				String content = map.get("content").toString();
				for (int j = 0; j < mgcList.size(); j++) {
					String mgc = mgcList.get(j).get("mgc").toString();
					title = title.replace(mgc, "***");
					content = content.replace(mgc, "***");
					map.put("title", title);
					map.put("content", content);
				}
			
			
		}
		return map;
	}
	//板块
	@RequestMapping(value = "/bk")
	public String bk(Model model, HttpServletRequest request,Long id)
			throws Exception {
		Map customer = getCustomer(request);
		String sql="select * from t_bk where id="+id;
		Map map  =db.queryForMap(sql);
		model.addAttribute("map", map);
		
		sql="select *,(select max(name) from t_customer b where b.id=a.customerId) customerName," +
				"(select bkName from t_bk c where c.id=a.bkId) bkName,(select count(1) from t_dz b where b.wdxxId=a.id) zans from t_wdxx a where bkId="+id+" ";
		if(customer==null||customer.size()==0){
			sql+=" and a.nologin='是' ";
		}
		sql+=" order by id desc";
		
		
		List<Map> list = db.queryForList(sql);
		model.addAttribute("list", list);
		return "/front/bk";
	}
	
	//网站活动
	@RequestMapping(value = "/ltgz")
	public String ltgz(Model model, HttpServletRequest request,String searchName,Long oneClassifyId)
			throws Exception {
		String sql="select * from t_ltsm limit 1";
		Map map  =db.queryForMap(sql);
		model.addAttribute("map", map);
		return "/front/ltgz";
	}
	//肤质检测
	@RequestMapping(value = "/fzjc")
	public String fzjc(Model model, HttpServletRequest request,String searchName,Long oneClassifyId)
			throws Exception {
		String sql="select * from t_fzjc limit 1";
		Map map  =db.queryForMap(sql);
		model.addAttribute("map", map);
		return "/front/fzjc";
	}
	//找回密码页申请
	@RequestMapping(value = "/find")
	public String find(Model model, HttpServletRequest request)
			throws Exception {
		return "/front/find";
	}
	//我的收藏
	@RequestMapping(value = "/wdsc")
	public String wdsc(Model model, HttpServletRequest request)
			throws Exception {
		String sql="select * from t_wdxx a where exists(select 1 from t_sc b where b.wdxxId=a.id and b.customerId='"+getCustomer(request).get("id")+"')";
		List<Map> list = db.queryForList(sql);
		model.addAttribute("list", list);
		return "/front/wdsc";
	}
	//我的收藏保存
	@RequestMapping(value = "/scSave")
	public ResponseEntity<String> scSave(Model model,
			HttpServletRequest request,Long id)
			throws Exception {
		
		db.update("delete from t_sc where customerId=? and wdxxId=?",new Object[]{getCustomer(request).get("id"),id});
		
		String sql = "insert into t_sc(customerId,wdxxId) values(?,?)";
		db.update(sql, new Object[] {getCustomer(request).get("id"),id});
		return renderData(true, "1", null);
		
	}
	//删除我的收藏
	@RequestMapping(value = "/scDelete")
	public ResponseEntity<String> scDelete(Model model,
			HttpServletRequest request,Long id)
			throws Exception {
		db.update("delete from t_sc where customerId=? and wdxxId=?",new Object[]{getCustomer(request).get("id"),id});
		return renderData(true, "1", null);
		
	}

	
//用户登入
	@RequestMapping(value = "/login")
	public String login(Model model, HttpServletRequest request)
			throws Exception {
		return "/front/login";
	}

//个人信息 展示
	@RequestMapping(value = "/mine")
	public String mine(Model model, HttpServletRequest request)
			throws Exception {
		Map customer = getCustomer(request);
		model.addAttribute("customer", customer);
		return "/front/mine";
	}
	
//登入验证
	@RequestMapping(value = "/save")
	public ResponseEntity<String> loginSave(Model model,
			HttpServletRequest request, String username, String password,String yzm)
			throws Exception {
		if(!yzm.toUpperCase().equals(request.getSession().getAttribute(RandomValidateCode.RANDOMCODEKEY).toString().toUpperCase())){
			return renderData(false, "1", null);
		}
		
		String sql = "select * from t_customer where username=?";
		List<Map> list = db.queryForList(sql, new Object[] { username });
		String result = "1";
		if (list != null && list.size() > 0) {
			Map map = list.get(0);
			if (StringHelper.get(map, "password").equals(password)) {
				request.getSession().setMaxInactiveInterval(60 * 60 * 24);
				request.getSession().setAttribute("customerBean", map);
				result = "1";
			} else {
				return renderData(false, "2", null);
			}
		} else {
			return renderData(false, "2", null);
		}
		return renderData(true, "1", null);
	}
	
//找回密码
	@RequestMapping(value = "/findSave")
	public ResponseEntity<String> findSave(Model model,
			HttpServletRequest request, String username, String mb1,String mb2,String mb3)
			throws Exception {
		String sql = "select * from t_customer where username=? and mb1=? and mb2=? and mb3=?";
		List<Map> list = db.queryForList(sql, new Object[] { username,mb1,mb2,mb3 });
		System.out.println(list);
		String result = "1";
		if (list != null && list.size() > 0) {
			Map map = list.get(0);
			return renderData(true, result, null);
		} else {
			return renderData(false, result, null);
		}
		
	}
	

	
	//找回密码确认
	@RequestMapping(value = "/findSaveConfirm")
	public ResponseEntity<String> findSaveConfirm(Model model,
			HttpServletRequest request, String username, String phone,String password, String mb1,String mb2,String mb3)
			throws Exception {
		String sql = "update t_customer set password=? where  username=?  and mb1=? and mb2=? and mb3=?";
		db.update(sql, new Object[] {password, username,mb1,mb2,mb3 });
		return renderData(true, "", null);
	}
	//注册
		@RequestMapping(value = "/register")
		public String register(Model model, HttpServletRequest request)
				throws Exception {
			return "/front/register";
		}
	//注册内容保存
	@RequestMapping(value = "/registerSave")
	public ResponseEntity<String> mineSave(Model model,
			HttpServletRequest request, Long id, String username,String name,
			String password, String phone,String sex,String age,
			String address,String idcard,String headPic,String mb1,String mb2,String mb3) throws Exception {

		
		
		int result = 0;
		
		
		String sql="select * from t_customer where username='"+username+"'";
		List<Map> aaa = db.queryForList(sql);
		if(aaa!=null&&aaa.size()>0){
			return renderData(false, "1", null);
		}
		
		 sql = "insert into t_customer(username,password,name,phone,sex,age,address,idcard,insertDate," +
				"headPic,level,ispl,isft,mb1,mb2,mb3) values(?,?,?,?,?,?,?,?,now(),?,?,?,?,?,?,?)";
		result = db.update(sql, new Object[] { username, password,name, phone,
				sex,age,address,idcard ,headPic,"初级","是","是",mb1,mb2,mb3});
		sql = "select * from t_customer order by id desc limit 1";
		List<Map> list = db.queryForList(sql);
		request.getSession().setMaxInactiveInterval(60 * 60 * 24);
		request.getSession().setAttribute("customerBean", list.get(0));
		return renderData(true, "操作成功", null);
	}
	
	//注册信息确认
	@RequestMapping(value = "/registerModifySave")
	public ResponseEntity<String> registerModifySave(Model model,
			HttpServletRequest request, Long id, String username,String name,
			String password, String phone,String sex,String age,String address,String idcard,String headPic,String mb1,String mb2,String mb3) throws Exception {
		
		int result = 0;
		String sql = "update t_customer set password=?, name=?,phone=?,sex=?,age=?,address=?,idcard=?,headPic=?,mb1=?,mb2=?,mb3=? where id=?";
		result = db.update(sql, new Object[] { password, name, phone,
				sex,age,address,idcard,headPic,mb1,mb2,mb3,id });
		sql = "select * from t_customer where id="+id;
		List<Map> list = db.queryForList(sql);
		request.getSession().setMaxInactiveInterval(60 * 60 * 24);
		request.getSession().setAttribute("customerBean", list.get(0));
		return renderData(true, "操作成功", null);
	}
	
	
//用户注销后 返回登入页面
	@RequestMapping(value = "/out")
	public String out(Model model, HttpServletRequest request) throws Exception {
		request.getSession().removeAttribute("customerBean");
		return "redirect:/front/login.html";
	}
	
	//我的心得列表
	@RequestMapping(value = "/wdxxList")
	public String list(Model model, HttpServletRequest request,String flag,String title)throws Exception {
		String sql="select a.*,(select max(name) from t_customer b where a.customerId=b.id) customerName  from t_wdxx a where 1=1";

if(1==1){sql+=" and customerId="+getCustomer(request).get("id") +" ";}
	if(title!=null&&!"".equals(title)){
			sql+=" and title like '%"+title+"%'";
		}
		sql+=" order by id desc";
		List list = db.queryForList(sql);
		request.setAttribute("list", list);
		return "/front/wdxxList";
	}
	
	//编辑我的心得
	@RequestMapping(value = "/wdxxEditSave")
	public ResponseEntity<String> editSave(Model model,HttpServletRequest request,Long id,String flag
		,Integer customerId,String title,String pic,String content,Integer zan,String insertDate,String nologin,Long bkId,String ship,String cpmc,String cf) throws Exception{
		int result = 0;
		if(id!=null){
			String sql="update t_wdxx set title=?,pic=?,content=?,nologin=?,bkId=?,ship=?,cpmc=?,cf=? where id=?";
			result = db.update(sql, new Object[]{title,pic,content,nologin,bkId,ship,cpmc,cf,id});
		}else{
			String sql="insert into t_wdxx(customerId,title,pic,content,zan,insertDate,nologin,bkId,ship,cpmc,cf) values(?,?,?,?,?,now(),?,?,?,?,?)";
			result = db.update(sql, new Object[]{getCustomer(request).get("id"),title,pic,content,0,nologin,bkId,ship,cpmc,cf});
		}
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
	}
	//删除心得
		@RequestMapping(value = "/wdxxDelete")
		public ResponseEntity<String> wdxxDelete(Model model,
				HttpServletRequest request, Long id) throws Exception {
			Map customer = getCustomer(request);
			String sql="delete from t_wdxx where  id=?";
			db.update(sql, new Object[]{id});
			return renderData(true, "操作成功", null);
		}
	//删除我的心得
	@RequestMapping(value = "/wdxxEditDelete")
	public ResponseEntity<String> editDelete(Model model,HttpServletRequest request,Long id,String flag) throws Exception {
		
		String sql="delete from t_wdxx where id=?";
		int result = db.update(sql, new Object[]{id});
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
		
	}
	//编辑我的心得，发布/修改心得
	@RequestMapping(value = "/wdxxEdit")
	public String edit(Model model, HttpServletRequest request,Long id,String flag)throws Exception {
		if(id!=null){
			//修改
			String sql="select * from t_wdxx where id=?";
			Map map = db.queryForMap(sql,new Object[]{id});
			model.addAttribute("map", map);
		}String sql="";

		return "/front/wdxxEdit";
	}
	//回答问题推荐
	@RequestMapping(value = "/grtj")
	public String grtj(Model model, HttpServletRequest request,Long id,String flag)throws Exception {
		return "/front/grtj";
	}
	
	//我的心得展示
	@RequestMapping(value = "/wdxxShow")
	public String wdxxShow(Model model, HttpServletRequest request,Long id,String flag)throws Exception {
		
//				saveClick(request, id);
		
		if(id!=null){
			//修改
			String sql="select a.*,(select count(1) from t_dz b where b.wdxxId=a.id) zans from t_wdxx a where id=?";
			Map map = db.queryForMap(sql,new Object[]{id.toString()});
			model.addAttribute("map", map);
		}
		String sql="select a.*,(select max(name) from t_customer b where a.customerId=b.id) customerName from t_pinglun a where wdxxId=? order by id desc";
		List<Map> list = db.queryForList(sql,new Object[]{id});
		model.addAttribute("list", list);
		return "/front/wdxxShow";
	}
	
	//产品
		@RequestMapping(value = "/cp")
		public String cp(Model model, HttpServletRequest request,String searchName,Long oneClassifyId,String types)
				throws Exception {
			String sql="";
			Map customer = getCustomer(request);
			String sql2="select a.* from t_cp a where 1=1  ";
			sql2+=" order by id";
			List<Map> list2 = db.queryForList(sql2);
			model.addAttribute("list2", list2);
			return "/front/cp";
		}
	//产品展示
	@RequestMapping(value = "/cpShow")
	public String cpShow(Model model, HttpServletRequest request,Long id,String flag)throws Exception {
		if(id!=null){
			//修改
			String sql="select a.* from t_cp a where id=?";
			Map map = db.queryForMap(sql,new Object[]{id});
			model.addAttribute("map", map);
		}
		return "/front/cpShow";
	}
	

	
	//验证用户是否登入
	@RequestMapping(value = "/checkIsLogin")
	public ResponseEntity<String> checkIsLogin(Model model,
			HttpServletRequest request) throws Exception {
		Map customer = getCustomer(request);
		if (customer != null && customer.size() > 0) {
			return renderData(true, "操作成功", null);
		} else {
			return renderData(false, "操作失败", null);
		}
	}
	//评论操作
	@RequestMapping(value = "/pinglunSave")
	public ResponseEntity<String> pinglunSave(Model model,HttpServletRequest request,Long id,String flag
		,String wdxxId,Integer customerId,String content,String insertDate) throws Exception{
		int result = 0;
		String sql="insert into t_pinglun(wdxxId,customerId,content,insertDate) values(?,?,?,now())";
		result = db.update(sql, new Object[]{wdxxId,getCustomer(request).get("id"),content});
		if(result==1){
			return renderData(true,"操作成功",null);
		}else{
			return renderData(false,"操作失败",null);
		}
	}
	
	
	//点赞操作
	@RequestMapping(value = "/zanSave")
	public ResponseEntity<String> zanSave(Model model,HttpServletRequest request,Long id) throws Exception{
		int result = 0;
		
		int a  =db.queryForInt("select count(1) from t_dz a where wdxxId=? and customerId=?",new Object[]{id.toString(),getCustomer(request).get("id")});
		System.out.println("aaaaaaaaaaaaaaa==="+a);
		if(a>0){
			db.update("delete from t_dz  where wdxxId=? and customerId=? ",new Object[]{id.toString(),getCustomer(request).get("id")});
			return renderData(false,"操作成功",null);
		}else{
			
			String sql="insert into t_dz(customerId,wdxxId,insertDate) values(?,?,now())";
			result = db.update(sql, new Object[]{getCustomer(request).get("id"),id});
			return renderData(true,"操作成功",null);
		}
		
	}
	
	
	///用户的基本功能结束///////////////////////////////////////////////
	
	

}
