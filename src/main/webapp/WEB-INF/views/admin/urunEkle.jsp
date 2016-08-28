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
        Ürün Ekle
        <small>Ürün Ekle</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href='<spring:url value="/admin/bos"></spring:url>'><i class="fa fa-dashboard"></i> Anasayfa</a></li>
        <li class="active">Ürün Ekle</li>
      </ol>
    </section>
    <section class="content">
    
     	<div class="row">
     		<div class="col-md-8">
          <!-- general form elements -->
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Ürün Ekle Formu</h3>
            </div>
            
            <form action='<spring:url value="/admin/urunKaydet"></spring:url>' method="POST" role="form">
              <div class="box-body">
                <div class="form-group">
                  <label>Ürün Başlık</label>
                  <input name="urunBaslik" type="text" class="form-control"  placeholder="Ürün Adı">
                </div>
                <div class="form-group">
                  <label>Kategori Seçiniz</label>
                  <select name="kategori" class="form-control">
                  <c:if test="${not empty kategori }">
                  	<c:forEach var="item" items="${kategori }" >
                    	<option value="${item.ukatid}">${item.ukadi}</option>
                    </c:forEach>
                    </c:if>
                  </select>
                </div>
                
                <div class="form-group">
                  <label>Kısa Açıklama</label>
                  <textarea name="kisaAciklama" class="form-control" rows="3" placeholder="Kısa Açıklama"></textarea>
                </div>
                
                <div class="form-group">
                  <label>Detay</label>
                  <textarea name="detay" id="editor1" class="form-control" rows="3" placeholder="Detay"></textarea>
                </div>
                
                <div class="input-group">
	                <span class="input-group-addon">TL</span>
	                <input name="fiyat" type="text" class="form-control">
	                <span class="input-group-addon">.00</span>
	             </div>
                
              </div>
              <div class="box-footer">
                <button type="reset" class="btn btn-default">Temizle</button>
                <button type="submit" class="btn btn-primary pull-right">Kaydet</button>
              </div>
            </form>
          </div>
          <!-- /.box -->


        </div>
     	</div>
     
    </section>
  </div>
  <jsp:include page="/alt"></jsp:include>
  <div class="control-sidebar-bg"></div>
</div>

<script src='<spring:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js"></spring:url>'></script>
<script src="https://cdn.ckeditor.com/4.5.7/standard/ckeditor.js"></script>
<script>
$vk= jQuery.noConflict();
$vk(function () {
    // Replace the <textarea id="editor1"> with a CKEditor
    // instance, using default configuration.
    CKEDITOR.replace('editor1');
    //bootstrap WYSIHTML5 - text editor
    //$(".textarea").wysihtml5();
  });
</script>
</body>
</html>
    
    