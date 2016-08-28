package ozellikler;

public class urunResimOzellik {

	// select *from urunler left JOIN urunresimler on urunler.urid = urunresimler.urunID GROUP BY urunler.urid order by urunler.urid DESC limit 0,6
	

	private String ubaslik;
	private String ukisaAciklama;
	private String ufiyat;
	private String uid;
	private String radi;
	private String rtarih;
	private String ukatAdi;
	private String udetay;
	private String utarih;
	
	public String getUdetay() {
		return udetay;
	}
	public void setUdetay(String udetay) {
		this.udetay = udetay;
	}
	public String getUtarih() {
		return utarih;
	}
	public void setUtarih(String utarih) {
		this.utarih = utarih;
	}
	public String getUkatAdi() {
		return ukatAdi;
	}
	public void setUkatAdi(String ukatAdi) {
		this.ukatAdi = ukatAdi;
	}
	public String getUbaslik() {
		return ubaslik;
	}
	public void setUbaslik(String ubaslik) {
		this.ubaslik = ubaslik;
	}
	public String getUkisaAciklama() {
		return ukisaAciklama;
	}
	public void setUkisaAciklama(String ukisaAciklama) {
		this.ukisaAciklama = ukisaAciklama;
	}
	public String getUfiyat() {
		return ufiyat;
	}
	public void setUfiyat(String ufiyat) {
		this.ufiyat = ufiyat;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getRadi() {
		return radi;
	}
	public void setRadi(String radi) {
		this.radi = radi;
	}
	public String getRtarih() {
		return rtarih;
	}
	public void setRtarih(String rtarih) {
		this.rtarih = rtarih;
	}
	
	
	
	
}
