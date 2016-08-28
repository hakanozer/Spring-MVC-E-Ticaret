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
        Haber Kategori Yönetimi
        <small>Haber Kategori </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href='<spring:url value="/admin/bos"></spring:url>'><i class="fa fa-dashboard"></i> Anasayfa</a></li>
        <li class="active">Haber Kategori</li>
      </ol>
    </section>
    <section class="content">
    
     	<div class="row">
     	<div class="col-md-6">
          <div class="box box-primary">
            <div class="box-header with-border">
              
            
              <h3 class="box-title">Haber Kategori Düzenle</h3>
            </div>
            <form action='<spring:url value="/admin/haberKategoriGuncelle"></spring:url>' method="post" role="form">
             <input type="hidden" value="${haberkategori[0].hkatid }" name="hkatid"/>
              <div class="box-body">
                <div class="form-group">
                  <label for="hkategoriadi">Kategori Adı</label>
                  <input type="text" value="${haberkategori[0].hkadi }" required name="hkategoriadi" class="form-control" id="hkategoriadi" placeholder="Kategori Adı">
                </div>
                <div class="form-group">
                  <label>Detay</label>
                  <textarea name="hdetay" class="form-control" rows="3" placeholder="Detay Bölümü">${haberkategori[0].hkdetay }</textarea>
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
    
    