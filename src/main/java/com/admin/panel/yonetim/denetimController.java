package com.admin.panel.yonetim;

import java.io.IOException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class denetimController {

	// admin b�l�m� i�in �st taraftaki css ve js dosyalar�n�n �a�r�lmas�
	@RequestMapping(value = "/ust", method = RequestMethod.GET)
	public String ustGit(ModelAndView model) {
		return "admin/header";
	}

	// admin b�l�m� i�in alt taraftaki css ve js dosyalar�n�n �a�r�lmas�
	@RequestMapping(value = "/alt", method = RequestMethod.GET)
	public String altGit(ModelAndView model) {
		return "admin/footer";
	}

	// admin b�l�m� i�in �st men�
	@RequestMapping(value = "/ustMenu", method = RequestMethod.GET)
	public String ustMenu(ModelAndView model, HttpServletRequest req) {
		model.addObject("adi",req.getSession().getAttribute("adi"));
		model.addObject("soyadi",req.getSession().getAttribute("soyadi"));
		return "admin/ustMenu";
	}

	// admin b�l�m� i�in �st men�
	@RequestMapping(value = "/solMenu", method = RequestMethod.GET)
	public String solMenu(ModelAndView model) {
		return "admin/solMenu";
	}

	// admin b�l�m� i�in �st men�
	@RequestMapping(value = "admin/bos", method = RequestMethod.GET)
	public String bosAc(ModelAndView model) {
		return "admin/bos";
	}
	
	// admin ��k�� yap
	@RequestMapping(value = "admin/cikis", method = RequestMethod.GET)
	public String cikisYap(ModelAndView model, HttpServletRequest req, HttpServletResponse res) {
		req.getSession().invalidate(); // t�m sessionlar� sil
		Cookie cerez = new Cookie("aid", "");
		cerez.setMaxAge(0);
		res.addCookie(cerez);
		return "admin/giris";
	}
}
