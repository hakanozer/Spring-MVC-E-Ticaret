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
        Ürün Kategori Yönetimi
        <small>Ürün Kategori Yönetimi</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href='<spring:url value="/admin/bos"></spring:url>'><i class="fa fa-dashboard"></i> Anasayfa</a></li>
        <li class="active">Kategori Yönetimi</li>
      </ol>
    </section>
    <section class="content">hata
    
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
            
              <h3 class="box-title">Yeni Kategori Ekle</h3>
            </div>
            <form action='<spring:url value="/admin/urunKategoriEkle"></spring:url>' method="post" role="form">
              <div class="box-body">
                <div class="form-group">
                  <label for="kategoriadi">Kategori Adı</label>
                  <input type="text" required name="kategoriadi" class="form-control" id="kategoriadi" placeholder="Kategori Adı">
                </div>
                <div class="form-group">
                  <label>Detay</label>
                  <textarea name="detay" class="form-control" rows="3" placeholder="Detay Bölümü"></textarea>
                </div>
                
              </div>
              <div class="box-footer">
                <button type="reset" class="btn btn-default">Temizle</button>
                <button type="submit" class="btn btn-primary pull-right">Kaydet</button>
              </div>
            </form>
          </div>

        </div>
        <div class="col-md-6">
			<div class="box">
            <div class="box-header">
              <h3 class="box-title">Kategori Listesi</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body no-padding">
              <table class="table table-striped">
                <tbody><tr>
                  <th style="width: 10px">ID</th>
                  <th style="width: 100px">Adı</th>
                  <th style="width: 100px">Detay</th>
                  <th style="width: 100px">Tarih</th>
                  <th style="width: 50px">İşlem</th>
                </tr>
                
                
                <c:if test="${ not empty kategori }">
                <c:forEach var="item" items="${kategori}">
                <tr>
                  <td>${item.ukatid}</td>
                  <td>${item.ukadi}</td>
                  <td>${item.ukdetay}</td>
                  <td>${item.uktarih}</td>
                  <td>
                  	<a href='<spring:url value="/admin/urunKatSil?katsilID=${item.ukatid }"></spring:url>' class="btn btn-block btn-danger btn-sm">Sil</a>
                  </td>
                </tr>
                </c:forEach>
                </c:if>
                
                
                
              </tbody></table>
            </div>
            <!-- /.box-body -->
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
    
    