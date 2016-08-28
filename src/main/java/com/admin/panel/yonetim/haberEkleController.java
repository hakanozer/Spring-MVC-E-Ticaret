package com.admin.panel.yonetim;


import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ozellikler.haberEkleOzellik;
import ozellikler.haberKategoriOzellik;

@Controller
public class haberEkleController {
	
	@RequestMapping(value="admin/haber", method=RequestMethod.GET)
	public ModelAndView urunEkle(ModelAndView mod, Model md){
		
		DB db = new DB();
		List<haberKategoriOzellik> ks = new ArrayList<haberKategoriOzellik>();
		List<haberEkleOzellik> ls = new ArrayList<haberEkleOzellik>();
		try {
			ResultSet rs = db.baglan().executeQuery("select *from  haberkategori");
			while(rs.next()) {
				haberKategoriOzellik hk = new haberKategoriOzellik();
				hk.setHkatid(rs.getString("hkatid"));
				hk.setHkadi(rs.getString("hkadi"));
				hk.setHkdetay(rs.getString("hkdetay"));
				hk.setHktarih(rs.getString("hktarih"));				
				ks.add(hk);
			}
		} catch (Exception e) {
			System.err.println("kategori getirme Hatasý " + e);
		}
		
		try {
			ResultSet rs = db.baglan().executeQuery("select * from haberEkle");
			while(rs.next()) {
				haberEkleOzellik haberEkle = new haberEkleOzellik();
				haberEkle.setHaberid(rs.getString("haberid"));
				haberEkle.setHaberKat(rs.getString("haberKat"));
				haberEkle.setHaberAdi(rs.getString("haberAdi"));
				haberEkle.setHicerik(rs.getString("hicerik"));
				haberEkle.setHaberTarih(rs.getString("haberTarih"));
				ls.add(haberEkle);
			}
			
		} catch (Exception e) {
			System.err.println("ürün getirme Hatasý " + e);
		}
		
		//mod.addObject("haberKategori", ks);
		//mod.addObject("liste", ls);
		md.addAttribute("liste", ls);
		md.addAttribute("haberKategori", ks);
		return new ModelAndView("admin/haber");
	}
	
	
	@RequestMapping(value="/admin/haberKaydet", method=RequestMethod.POST)
	public ModelAndView haberEkle(HttpServletRequest req){
		
		DB db = new DB();
		try {
			
			String haberKat = req.getParameter("haberKategori");
			String haberAdi = req.getParameter("haberBaslik");
			String haberIcerik = req.getParameter("icerik");
			
			int ekle= db.baglan().executeUpdate("insert into haberEkle values(null, '"+haberKat+"', '"+haberAdi+"', '"+haberIcerik+"', now())");
	
		} catch (Exception e) {

		}
		return new ModelAndView("redirect:haber");
	}
	
	
	


	
}
