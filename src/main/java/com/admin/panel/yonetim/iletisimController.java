package com.admin.panel.yonetim;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ozellikler.iletisimOzellik;

@Controller
public class iletisimController {

	@RequestMapping(value = "admin/iletisim", method = RequestMethod.GET)
	public ModelAndView iletisim() {
		DB db = new DB();
		List<iletisimOzellik> ls = new ArrayList<iletisimOzellik>();

		try {

			ResultSet rs = db.baglan().executeQuery("select * from iletisim");
			while (rs.next()) {

				iletisimOzellik il = new iletisimOzellik();
				il.setIl(rs.getString("il"));
				il.setIlce(rs.getString("ilce"));
				il.setAdres(rs.getString("adres"));
				il.setTel(rs.getString("tel"));
				il.setFax(rs.getString("fax"));
				il.setGsm(rs.getString("gsm"));
				il.setMail(rs.getString("mail"));
				ls.add(il);
			}

		} catch (Exception e) {
			// TODO: handle exception
		}

		return new ModelAndView("admin/iletisim", "iletisim", ls);
	}

	@RequestMapping(value="admin/iletisimEkle", method=RequestMethod.POST)
	public String iletisimEkle(HttpServletRequest req,ModelAndView md){
		try {
			DB db = new DB();
			String il = req.getParameter("il");
			String ilce = req.getParameter("ilce");
			String adres = req.getParameter("adres");
			String tel = req.getParameter("tel");
			String fax = req.getParameter("fax");
			String gsm = req.getParameter("gsm");
			String mail= req.getParameter("mail");
			int ekle = db.baglan().executeUpdate("insert into iletisim values(null, '"+il+"', '"+ilce+"', '"+adres+"', '"+tel+"', '"+fax+"', '"+gsm+"', '"+mail+"')");
			if( ekle >0){
				md.addObject("kayýt","Kayýt iþlemi baþarýlý");
				
			}else{
				md.addObject("hata","Kayýt iþlemi baþarýsýz");
			}
			
			} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:iletisim";
	}

}
