package com.admin.panel.yonetim;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import ozellikler.urunKategoriOzellik;

@Controller
public class urunKategoriController {


	// ana açýlýþ sayfasý
	@RequestMapping(value="admin/urunKategori", method=RequestMethod.GET)
	public ModelAndView urunKategoriler(){
		
		DB db = new DB();
		List<urunKategoriOzellik> ks = new ArrayList<urunKategoriOzellik>();
		try {
			ResultSet rs = db.baglan().executeQuery("select *from  urunkategori");
			while(rs.next()) {
				urunKategoriOzellik kt = new urunKategoriOzellik();
				kt.setUkatid(rs.getString("ukatid"));
				kt.setUkadi(rs.getString("ukadi"));
				kt.setUkdetay(rs.getString("ukdetay"));
				kt.setUktarih(rs.getString("uktarih"));
				ks.add(kt);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return new ModelAndView("admin/urunKategori","kategori",ks);
	}
	
	// kategori ekle
	@RequestMapping(value = "admin/urunKategoriEkle", method=RequestMethod.POST)
	public ModelAndView urunKategoriEkle(@RequestParam String kategoriadi,@RequestParam String detay, ModelAndView md ) {
		DB db = new DB();
		try {
			int ekle = db.baglan().executeUpdate("insert into urunKategori values (null,'"+kategoriadi+"', '"+detay+"', now() )");
			if(ekle > 0) {
				// ekleme datasý gönder
				md.addObject("kayit", "Kayýt Ýþlemi Baþarýlý");
			}else {
				md.addObject("hata", "Kayýt Ýþlemi Baþarýsýz Oldu");
			}
		} catch (Exception e) {
			
		}
		return new ModelAndView("redirect:urunKategori");
	}
	
	// kategori silme iþlemi
	@RequestMapping(value="admin/urunKatSil", method=RequestMethod.GET)
	public ModelAndView urunKategoriSil(@RequestParam String katsilID, Model md){
		DB db = new DB();
		try {
			int sil = db.baglan().executeUpdate("delete from urunKategori where ukatid = '"+katsilID+"'");
			md.addAttribute("sil", "Silme Ýþlemi Baþarýlý");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return new ModelAndView("redirect:urunKategori");
	}
	
	
}
