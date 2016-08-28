package com.admin.panel.yonetim;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ozellikler.haberKategoriOzellik;


@Controller
public class haberKategoriController {

	@RequestMapping(value="admin/haberKategori", method=RequestMethod.GET)
	public ModelAndView haberKategoriler(){
		
		DB db = new DB();
		List<haberKategoriOzellik> ks = new ArrayList<haberKategoriOzellik>();
		try {
			ResultSet rs = db.baglan().executeQuery("select *from  haberkategori");
			while(rs.next()) {
				haberKategoriOzellik kt = new haberKategoriOzellik();
				kt.setHkatid(rs.getString("hkatid"));
				kt.setHkadi(rs.getString("hkadi"));
				kt.setHkdetay(rs.getString("hkdetay"));
				kt.setHktarih(rs.getString("hktarih"));
				ks.add(kt);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return new ModelAndView("admin/haberKategori","haberkategori",ks);
	}
	
	// kategori ekle
	@RequestMapping(value = "admin/haberKategoriEkle", method=RequestMethod.POST)
	public ModelAndView haberKategoriEkle(@RequestParam String hkategoriadi,@RequestParam String hdetay, ModelAndView md ) {
		DB db = new DB();
		try {
			int ekle = db.baglan().executeUpdate("insert into haberkategori values (null,'"+hkategoriadi+"', '"+hdetay+"', now() )");
			if(ekle > 0) {
				// ekleme datasý gönder
				md.addObject("hkayit", "Kayýt Ýþlemi Baþarýlý");
			}else {
				md.addObject("hhata", "Kayýt Ýþlemi Baþarýsýz Oldu");
			}
		} catch (Exception e) {
			
		}
		return new ModelAndView("redirect:haberKategori");
	}
	
	// kategori silme iþlemi
	@RequestMapping(value="admin/haberKatSil", method=RequestMethod.GET)
	public ModelAndView haberKategoriSil(@RequestParam String hkatsilID,Model md){
		DB db = new DB();
		try {
			int sil = db.baglan().executeUpdate("delete from haberKategori where hkatid = '"+hkatsilID+"'");
			md.addAttribute("sil","Silme iþlemi baþarýlý");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return new ModelAndView("redirect:haberKategori");
	}
	
	
	@RequestMapping(value="admin/haberKatDuzenle",method=RequestMethod.GET)
	public ModelAndView haberKatDuzenle(@RequestParam String hkatID){
		

			DB db = new DB();
			List<haberKategoriOzellik> ks = new ArrayList<haberKategoriOzellik>();
			try {
				ResultSet rs = db.baglan().executeQuery("select * from haberKategori where hkatid='"+hkatID+"'");
				while(rs.next()) {
					haberKategoriOzellik kt = new haberKategoriOzellik();
					kt.setHkatid(rs.getString("hkatid"));
					kt.setHkadi(rs.getString("hkadi"));
					kt.setHkdetay(rs.getString("hkdetay"));
					kt.setHktarih(rs.getString("hktarih"));
					ks.add(kt);
				}
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			return new ModelAndView("admin/haberKategoriDuzenle","haberkategori",ks);

	}
	
	@RequestMapping(value="admin/haberKategoriGuncelle",method=RequestMethod.POST)
	public String duzenleUpdate(@RequestParam String hkatid,@RequestParam String hkategoriadi,@RequestParam String hdetay){
		
		try {
			DB db = new DB();
			int guncel=db.baglan().executeUpdate(" update haberKategori set hkadi='"+hkategoriadi+"', hkdetay='"+hdetay+"' where hkatid= '"+hkatid+"' ");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return ("redirect:haberKategori");
	}
	
	
}
