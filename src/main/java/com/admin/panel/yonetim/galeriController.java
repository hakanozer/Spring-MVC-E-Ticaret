package com.admin.panel.yonetim;

import java.io.BufferedOutputStream;

import java.io.File;

import java.io.FileOutputStream;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
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

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import ozellikler.urunGaleriOzellik;
import ozellikler.urunlerOzellik;

@Controller
public class galeriController {

	private static final Logger logger = LoggerFactory.getLogger(galeriController.class);

	/*
	@RequestMapping(value = "/admin/urunGaleri", method = RequestMethod.GET, params = {"basarili"})
	public ModelAndView urunGaleriAc(@RequestParam String basarili) {
		return new ModelAndView("admin/urunGaleri","basarili",basarili);
	}
	
	@RequestMapping(value = "/admin/urunGaleri", method = RequestMethod.GET, params = {})
	public ModelAndView urunGaleriAc() {
		return new ModelAndView("admin/urunGaleri");
	}
	*/

	@RequestMapping(value = "/admin/urunGaleri", method = RequestMethod.GET)
	public ModelAndView urunGalAc(HttpServletRequest req, Model mod) {
		boolean bdurum = (req.getParameter("basarili") != null);
		boolean bhdurum = (req.getParameter("hata") != null);
		List<urunlerOzellik> ls = new ArrayList<urunlerOzellik>();
		List<urunGaleriOzellik> lsg = new ArrayList<urunGaleriOzellik>();
		try {
			DB db = new DB();
			String quey = "SELECT *from urunler";
			String galQuery = "select ur.uid, ur.radi, u.ubaslik, ur.rtarih  from urunresimler as ur  LEFT JOIN urunler as u on u.urid = ur.urunID";
			ResultSet rs = db.baglan().executeQuery(quey);
			ResultSet rss = db.baglan().executeQuery(galQuery);
			while(rs.next()){
				urunlerOzellik oz = new urunlerOzellik();
				oz.setUrid(rs.getString("urid"));
				oz.setUbaslik(rs.getString("ubaslik"));
				ls.add(oz);
			}
	        String path =  req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath()+"/resimlerr/";
			while(rss.next()){
				urunGaleriOzellik uga = new urunGaleriOzellik();
				uga.setUid(rss.getString("uid"));
				uga.setRadi(path + rss.getString("radi"));
				uga.setUbaslik(rss.getString("ubaslik"));
				uga.setRtarih(rss.getString("rtarih"));
				lsg.add(uga);
			}
			
			mod.addAttribute("ugaleri", lsg);
			mod.addAttribute("urun", ls);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		if(bdurum){
			String bgonder=req.getParameter("basarili").toString();
			return new ModelAndView("admin/urunGaleri","basarili",bgonder);
		}else if (bhdurum) {
			String bhata=req.getParameter("hata").toString();
			return new ModelAndView("admin/urunGaleri","hata",bhata);
		}else {
		}
		return new ModelAndView("admin/urunGaleri");
	}
	
	
	@RequestMapping(value = "/admin/multi", method = RequestMethod.GET)
	public String anaAcMulti() {
		return "uploadMultiple";
	}

	@RequestMapping(value = "/admin/uploadFile", method = RequestMethod.POST)
	public @ResponseBody
			ModelAndView uploadFileHandler(@RequestParam("name") String name,
					@RequestParam("file") MultipartFile file, @RequestParam("urun") String urun) {
		if (!file.isEmpty()) {
			name =  name + ".jpg";
			try {
				byte[] bytes = file.getBytes();
				String rootPath = System.getProperty("catalina.base");
				File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();
				File serverFile = new File(dir.getAbsolutePath()
						+ File.separator + name );
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));stream.write(bytes);
				stream.close();
				logger.info("Server File Location=" + serverFile.getAbsolutePath());
				
				// veritabanýna bilgiler yazýlýyor
				DB db = new DB();
				try {
					int yaz = db.baglan().executeUpdate("insert into urunResimler values(null, '"+urun+"', '"+name+"', now())");
				} catch (Exception e) {
					// TODO: handle exception
				}
				
				
				return new ModelAndView("redirect:urunGaleri","basarili",name);
			} catch (Exception e) {
				return new ModelAndView("redirect:urunGaleri","hata",name + " => " + e.getMessage());
			}
		} else {
			return new ModelAndView("redirect:urunGaleri","hata","Resim Dosyasý Boþ");
			
		}
	}


	@RequestMapping(value = "/admin/uploadMultipleFile", method = RequestMethod.POST)
	public @ResponseBody ModelAndView uploadMultipleFileHandler(@RequestParam("name") String[] names,@RequestParam("file") MultipartFile[] files, @RequestParam("urun") String urun, HttpServletRequest request) {
		if (files.length != names.length)
			return new ModelAndView("redirect:urunGaleri","hata","Resim Dosyasý Boþ");
		String message = "";
		DB db = new DB();
		for (int i = 0; i < files.length; i++) {
			MultipartFile file = files[i];
			Date now = new Date();
			String zaman = new SimpleDateFormat("yyyyMMddHHmmss", Locale.ENGLISH).format(now);
			String name = names[i];
			name = name+"_"+zaman+"_"+i+ ".jpg"; 
			try {
				byte[] bytes = file.getBytes();
				
				String rootPath = request.getSession().getServletContext().getRealPath("/");
		        File dir = new File(rootPath + File.separator + "resimlerr");
				
				// Creating the directory to store file
				//String rootPath = System.getProperty("catalina.home");
				//File dir = new File(rootPath + File.separator + "tmpFiles");
				if (!dir.exists())
					dir.mkdirs();
				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath()+ File.separator + name);
				BufferedOutputStream stream = new BufferedOutputStream(
						new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();
				logger.info("Server File Location=" + serverFile.getAbsolutePath());
				//message = message + "You successfully uploaded file=" + name+ "<br />";
				//return new ModelAndView("redirect:urunGaleri","basarili",name);
				try {
					int yaz = db.baglan().executeUpdate("insert into urunResimler values(null, '"+urun+"', '"+name+"', now())");
				} catch (Exception e) {
					// TODO: handle exception
				}
			} catch (Exception e) {
				return new ModelAndView("redirect:urunGaleri","hata",name + " => " + e.getMessage());
			}
		}
		return new ModelAndView("redirect:urunGaleri","basarili","Resimler Upload Edildi");
	}
	
	
	
	// ürün resim silme iþlemi
	@RequestMapping(value = "/admin/urunGaleriSil", method = RequestMethod.GET)
	public ModelAndView urunGaleriSil(@RequestParam String resimId) {
		
		DB db = new DB();
		try {
			int sil = db.baglan().executeUpdate("delete from urunresimler where uid = '"+resimId+"'");
			if(sil >0) {
				return new ModelAndView("redirect:urunGaleri","basarili","Resim Silme Baþarýlý");
			}
		} catch (Exception e) {
			return new ModelAndView("redirect:urunGaleri","hata" , "Silme Baþarýsýz " + e.getMessage());
		}
		return new ModelAndView("redirect:urunGaleri","hata","Silme Baþarýsýz" );

	}
	

}
