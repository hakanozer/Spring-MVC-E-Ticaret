package com.admin.panel;

import java.sql.ResultSet;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.admin.panel.yonetim.DB;

import ozellikler.Tag;
import ozellikler.urunResimOzellik;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpServletRequest req,Locale locale, Model model) {
		ArrayList<urunResimOzellik> ls = new ArrayList<urunResimOzellik>();
        String path =  req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath()+"/resimlerr/";

		try {
			DB db = new DB();
			ResultSet rs = db.baglan().executeQuery("select *from urunler left JOIN urunresimler on urunler.urid = urunresimler.urunID GROUP BY urunler.urid order by urunler.urid DESC limit 0,6");
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
		
		return "home";
	}

	
	
	@RequestMapping(value = "/getTags", method = RequestMethod.GET)
	public @ResponseBody
	List<Tag> getTags(@RequestParam String tagName) {
		return simulateSearchResult(tagName);
	}

	List<Tag> data = new ArrayList<Tag>();
	private List<Tag> simulateSearchResult(String tagName) {
		List<Tag> result = new ArrayList<Tag>();
		// iterate a list and filter by tagName
		data.clear();
		try {
			DB db = new DB();
			ResultSet rs = db.baglan().executeQuery("select *from urunler where ubaslik LIKE '%"+tagName+"%' or ukisaAciklama LIKE '%"+tagName+"%' or udetay LIKE '%"+tagName+"%'");
			while(rs.next()) {
				Tag tg = new Tag(rs.getInt("urid"), rs.getString("ubaslik"));
				result.add(tg);
			}
		} catch (Exception e) {
		}
		
		
		for (Tag tag : data) {
			if (tag.getTagName().contains(tagName)) {
				result.add(tag);
			}
		}
		return result;
	}

	
	
}
