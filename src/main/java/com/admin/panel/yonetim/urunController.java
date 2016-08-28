package com.admin.panel.yonetim;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ozellikler.urunKategoriOzellik;
import ozellikler.urunlerOzellik;

@Controller
public class urunController {

	// urun Ekle formu açýlýyor
	@RequestMapping(value="admin/urunEkle", method=RequestMethod.GET)
	public ModelAndView urunEkle(){
		
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
		return new ModelAndView("admin/urunEkle","kategori",ks);
	}
	
	
	// ürün kaydet açýlýyor
	@RequestMapping(value="admin/urunKaydet", method=RequestMethod.POST)
	public String urunKaydet(HttpServletRequest req){
		try {
			DB db = new DB();
			String baslik = req.getParameter("urunBaslik");
			String katid = req.getParameter("kategori");
			String kisaAciklama = req.getParameter("kisaAciklama");
			String detay = req.getParameter("detay");
			String fiyat = req.getParameter("fiyat");
			int ekle = db.baglan().executeUpdate("insert into urunler values(null, '"+katid+"', '"+baslik+"', '"+kisaAciklama+"', '"+detay+"', '"+fiyat+"', now())");
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "redirect:urunEkle";
	}
	
	
	// ürün listeleme yapýlýyor
	@RequestMapping(value="admin/urunler", method=RequestMethod.GET)
	public ModelAndView urunler(){
		List<urunlerOzellik> ls = new ArrayList<urunlerOzellik>();
		try {
			DB db = new DB();
			String quey = "SELECT *from urunler left JOIN urunkategori on urunkategori.ukatid = urunler.katid order by urunler.urid DESC LIMIT 0,100";
			ResultSet rs = db.baglan().executeQuery(quey);
			while(rs.next()){
				urunlerOzellik oz = new urunlerOzellik();
				oz.setUrid(rs.getString("urid"));
				oz.setKatAdi(rs.getString("ukadi"));
				oz.setUbaslik(rs.getString("ubaslik"));
				oz.setUkisaAciklama(rs.getString("ukisaAciklama"));
				oz.setUdetay(rs.getString("udetay"));
				oz.setUfiyat(rs.getString("ufiyat"));
				oz.setuTarih(rs.getString("uTarih"));
				ls.add(oz);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return new ModelAndView("admin/urunler","urun",ls);
	}
	
	
}
