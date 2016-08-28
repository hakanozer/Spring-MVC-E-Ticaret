package com.admin.panel.yonetim;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ozellikler.adminOzellik;

@Controller
public class adminSifreController {
	
	@RequestMapping(value="admin/adminSifre",method=RequestMethod.GET)
	public ModelAndView adminSifre(HttpServletRequest req, Model md){
		 
		String id = req.getSession().getAttribute("aid").toString();
		String basarisiz = req.getParameter("basarisiz");
		String basarili = req.getParameter("basarili");
		
		md.addAttribute("basarili", basarili);
		md.addAttribute("basarisiz", basarisiz);
		
		return new ModelAndView("admin/adminSifre","id",id);
	}

	@RequestMapping(value="admin/sifreDegistir", method=RequestMethod.POST)
	public String sifreDegistir (HttpServletRequest req, Model md){
		List<adminOzellik> adminList = new ArrayList<adminOzellik>();
		
		String id = req.getSession().getAttribute("aid").toString();
		String eski = req.getParameter("eskiSifre");
		String yeni = req.getParameter("yeniSifre");
		String yeniTekrar= req.getParameter("yeniSifreTekrar");
		
		DB db = new DB();
		try {
			
			ResultSet rs = db.baglan().executeQuery("select * from admin where aid='"+id+"'");
			
			while(rs.next()){
				adminOzellik admin = new adminOzellik();

			admin.setAid(rs.getString("aid"));
			admin.setAadi(rs.getString("aadi"));
			admin.setAmail(rs.getString("amail"));
			admin.setAsoyadi(rs.getString("asoyadi"));
			admin.setAsifre(rs.getString("asifre"));
			
			adminList.add(admin);
			}
			if(db.MD5(eski).equals(adminList.get(0).getAsifre()) && yeni.equals(yeniTekrar)&& adminList.size()>0){
				
				int ekle = db.baglan().executeUpdate("update admin set asifre='"+db.MD5(yeni)+"' where aid='"+id+"'");	
			}else{
				md.addAttribute("basarisiz", "şifre Değiştirme başarısız, kontrol ediniz");
				return "redirect:adminSifre";
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		md.addAttribute("basarili", "Şifre Değiştirildi");
		return "redirect:adminSifre";
	}
}
