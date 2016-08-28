package com.admin.panel;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.admin.panel.yonetim.DB;

import ozellikler.iletisimOzellik;
import ozellikler.urunKategoriOzellik;

@Controller
public class ekleController {
	
	// site boþ sayfasý açýlýyor
	@RequestMapping (value = "bos", method=RequestMethod.GET)
	public String bos() {
		return "bos";
	}
	
	@RequestMapping(value = "/siteust", method = RequestMethod.GET)
	public String ustGit(ModelAndView model) {
		return "header";
	}
	
	
	@RequestMapping(value = "/sitesolMenu", method = RequestMethod.GET)
	public String sitesolMenu(Model model) {
		ArrayList<urunKategoriOzellik> ls = new ArrayList<urunKategoriOzellik>();
		try {
			DB db = new DB();
			ResultSet rs = db.baglan().executeQuery("select *from urunkategori");
			while(rs.next()) {
				urunKategoriOzellik uk = new urunKategoriOzellik();
				uk.setUkatid(rs.getString("ukatid"));
				uk.setUkadi(rs.getString("ukadi"));
				uk.setUkdetay(rs.getString("ukdetay"));
				uk.setUktarih(rs.getString("uktarih"));
				ls.add(uk);
			}
		} catch (Exception e) {
		}
		model.addAttribute("kat", ls);
		return "solMenu";
	}
	
	@RequestMapping(value = "/siteFooter", method = RequestMethod.GET)
	public String siteFooter(ModelAndView model) {
		return "footer";
	}
	
	
	@RequestMapping(value = "hakkimizda", method = RequestMethod.GET)
	public String hakkimizda(ModelAndView model) {
		return "hakkimizda";
	}
	
	@RequestMapping(value = "teslimat", method = RequestMethod.GET)
	public String teslimat(ModelAndView model) {
		return "teslimat";
	}
	
	@RequestMapping(value = "iletisim", method = RequestMethod.GET)
	public ModelAndView iletisim() {
		DB db = new DB();
		List<iletisimOzellik> ls = new ArrayList<iletisimOzellik>();

		try {

			ResultSet rs = db.baglan().executeQuery("SELECT *FROM iletisim ORDER BY iletID DESC limit 0 , 1 ");
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

		return new ModelAndView("iletisim", "iletisim", ls);
	}
}
