package com.admin.panel;

import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.admin.panel.yonetim.DB;

import ozellikler.urunResimOzellik;

@Controller
public class urunDetayController {

	@RequestMapping(value="urunDetay", method = RequestMethod.GET)
	public String urunDetay(Model model, HttpServletRequest req) {
		String uid = req.getParameter("urunID");
		ArrayList<urunResimOzellik> ls = new ArrayList<urunResimOzellik>();
        String path =  req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath()+"/resimlerr/";

		try {
			DB db = new DB();
			ResultSet rs = db.baglan().executeQuery("SELECT *from urunler as u LEFT JOIN urunresimler as r on u.urid = r.urunID where u.urid = "+uid+"");
			while(rs.next()) {
				urunResimOzellik ur = new urunResimOzellik();
				ur.setUid(rs.getString("urid"));
				ur.setUbaslik(rs.getString("ubaslik"));
				ur.setUfiyat(rs.getString("ufiyat"));
				ur.setUkisaAciklama(rs.getString("ukisaAciklama"));
				ur.setRadi(path + rs.getString("radi"));
				ur.setUdetay(rs.getString("udetay"));
				ur.setUtarih(rs.getString("utarih"));
				ur.setUkatAdi(rs.getString("katid"));
				ls.add(ur);
			}
		} catch (Exception e) {
		}
		model.addAttribute("urun", ls);
		return "urunDetay";
	}
	
	
}
