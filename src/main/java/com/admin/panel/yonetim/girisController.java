package com.admin.panel.yonetim;


import java.sql.ResultSet;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class girisController {

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String home(Model model) {
		return "admin/giris";
	}
	
	
	// giri� yap kontrol� sa�lan�yor
	@RequestMapping(value = "/admin/girisYap", method = RequestMethod.POST)
	public ModelAndView girisYap (@RequestParam("mail") String mail, @RequestParam("sifre") String sifre, HttpServletRequest req, HttpServletResponse res ) {
		
		DB db = new DB();
		try {
			ResultSet rs = db.baglan().executeQuery("select *from admin where amail = '"+mail+"' and asifre = '"+db.MD5(sifre)+"'");
			if(rs.next()) {
				// giri� ba�ar�l�
				req.getSession().setAttribute("aid", rs.getString("aid"));
				req.getSession().setAttribute("adi", rs.getString("aadi"));
				req.getSession().setAttribute("soyadi", rs.getString("asoyadi"));
				// �erez denetimi yap�l�yor
				boolean cdurum = (req.getParameter("beni_hatirla") != null);
				if(cdurum) {
					Cookie cerez = new Cookie("aid", rs.getString("aid"));
					cerez.setMaxAge(60*60*24);
					res.addCookie(cerez);
				}
				
				return new ModelAndView("redirect:bos");
			}else {
				// giri� ba�ar�s�z
				return new ModelAndView("admin/giris","basarisiz","Giri� Ba�ar�s�z..");
			}
		} catch (Exception e) {
			//return new ModelAndView("admin/giris","basarisiz","Giri� Ba�ar�s�z..");
		}
		return new ModelAndView("admin/giris","basarisiz","Veritaban� ile ba�lant� kurulmad� !");
	}
	
	
}
