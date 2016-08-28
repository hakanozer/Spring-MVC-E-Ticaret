<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<jsp:include page="/ust"></jsp:include>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">

<jsp:include page="/ustMenu"></jsp:include>
<jsp:include page="/solMenu"></jsp:include>

  <div class="content-wrapper">
    <section class="content-header">
      <h1>
        İletişim Yönetimi
        <small>İletişim </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href='<spring:url value="/admin/bos"></spring:url>'><i class="fa fa-dashboard"></i> Anasayfa</a></li>
        <li class="active">İletişim</li>
      </ol>
    </section>
    
    
   
    
    <section class="content">
    
    
    <div class="row">
   <div class="col-md-6">
          <div class="box box-primary">
            <div class="box-header with-border">
            
           <c:if test="${kayit }">
            	<div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-check"></i> Başarılı!</h4>
                ${kayit }
              </div>
            </c:if>
            <c:if test="${hata }">
            	<div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-ban"></i> Hata!</h4>
                ${hata }
              </div>
            </c:if>
            
              <h3 class="box-title">İletişim Bilgisi Ekle</h3>
            </div>
            
            <form action='<spring:url value="/admin/iletisimEkle"></spring:url>' method="post" role="form">
              <div class="box-body">
                <div class="form-group">
                  <label for="il">İl</label>
                  <input type="text" required="" name="il" class="form-control" id="il" placeholder="İl Girin">
                  <label for="ilce">İlçe</label>
                  <input type="text" required="" name="ilce" class="form-control" id="ilce" placeholder="ilce Girin">
              <label>Adres</label>
                  <textarea name="adres" class="form-control" rows="3" placeholder="Adres Girin"></textarea>
                     <label for="tel">Tel</label>
                  <input type="text" required="" name="tel" class="form-control" id="tel" placeholder="Tel Girin">
                     <label for="fax">Fax</label>
                  <input type="text" required="" name="fax" class="form-control" id="fax" placeholder="Fax Girin">
                         <label for="gsm">Gsm</label>
                  <input type="text" required="" name="gsm" class="form-control" id="gsm" placeholder="Gsm Girin">
                         <label for="mail">Mail</label>
                  <input type="text" required="" name="mail" class="form-control" id="mail" placeholder="Mail Girin">
                  
                </div>
               
                
              </div>
              <div class="box-footer">
                <button type="reset" class="btn btn-default">Temizle</button>
                <button type="submit" class="btn btn-primary pull-right">Kaydet</button>
              </div>
            </form>
          </div>

        </div>
    
    
    
    
    
    </div>
    
    
    
    
    
     
    </section>
    
   
    
  </div>
  <jsp:include page="/alt"></jsp:include>
  <div class="control-sidebar-bg"></div>
</div>
</body>
</html>
    
    