package com.admin.panel;

import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.admin.panel.yonetim.DB;

import ozellikler.urunResimOzellik;

@Controller
public class urunAraController {
	
	
	@RequestMapping(value="aramaSonuc", method = RequestMethod.GET)
	public String urunAra(Model model, @RequestParam String urunAdi, HttpServletRequest req){
		
		ArrayList<urunResimOzellik> ls = new ArrayList<urunResimOzellik>();
        String path =  req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath()+"/resimlerr/";

		try {
			DB db = new DB();
			ResultSet rs = db.baglan().executeQuery("select *from urunler left JOIN urunresimler on urunler.urid = urunresimler.urunID WHERE urunler.ubaslik LIKE '%"+urunAdi+"%' or urunler.ukisaAciklama LIKE '%"+urunAdi+"%' or urunler.udetay LIKE '%"+urunAdi+"%'  GROUP BY urunler.urid");
			while(rs.next()) {
				urunResimOzellik ur = new urunResimOzellik();
				ur.setUid(rs.getString("urid"));
				ur.setUbaslik(rs.getString("ubaslik"));
				ur.setUfiyat(rs.getString("ufiyat"));
				ur.setUkisaAciklama(rs.getString("ukisaAciklama"));
				ur.setRadi(path + rs.getString("radi"));
				ls.add(ur);
			}
			
		} catch (Exception e) {
		}
		
		model.addAttribute("urunler", ls);
		model.addAttribute("arama", urunAdi);
		return "aramaSonuc";
	}
	
	
	// kategor listeleri
	@RequestMapping(value="katDetay", method = RequestMethod.GET)
	public String katDetay(Model model, @RequestParam String katId, HttpServletRequest req) {
		ArrayList<urunResimOzellik> ls = new ArrayList<urunResimOzellik>();
        String path =  req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath()+"/resimlerr/";
        String katAdi = "Bu kategoride ürün yok !";
		try {
			DB db = new DB();
			ResultSet rs = db.baglan().executeQuery("select *from urunler left JOIN urunresimler on urunler.urid = urunresimler.urunID LEFT JOIN urunkategori as k on urunler.katid = k.ukatid  where urunler.katid = '"+katId+"'   order by urunler.urid DESC");
			
			while(rs.next()) {
				urunResimOzellik ur = new urunResimOzellik();
				ur.setUid(rs.getString("urid"));
				ur.setUbaslik(rs.getString("ubaslik"));
				ur.setUfiyat(rs.getString("ufiyat"));
				ur.setUkisaAciklama(rs.getString("ukisaAciklama"));
				ur.setRadi(path + rs.getString("radi"));
				katAdi = rs.getString("ukadi");
				ls.add(ur);
			}
		} catch (Exception e) {
		}
		
		model.addAttribute("katAdi", katAdi);
		model.addAttribute("urunler", ls);
		return "katDetay";
	}
	
	
	

}
