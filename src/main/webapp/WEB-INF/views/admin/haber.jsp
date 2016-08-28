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
        Ürün Galeri Yönetimi
        <small>Ürün Galeri </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href='<spring:url value="/admin/bos"></spring:url>'><i class="fa fa-dashboard"></i> Anasayfa</a></li>
        <li class="active">Ürün Galeri</li>
      </ol>
    </section>
    <section class="content">
    
     	<div class="row">
     	<div class="col-md-6">
<div class="box box-primary">
            <div class="box-header with-border">
            
            <c:if test="${not empty basarili }">
            	${basarili }
            </c:if>
            
              <h3 class="box-title">Haber Ekle</h3>
            </div>
            <form action='<spring:url value="/admin/haberKaydet"></spring:url>' method="post" role="form">
              <div class="box-body"> 
                
               <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Haber Ekle Formu</h3>
            </div>
            
              <div class="box-body">
                <div class="form-group">
                  <label>Haber Başlık</label>
                  <input name="haberBaslik" type="text" class="form-control" placeholder="Haber Başlık">
                </div>
                
                  <label>Haber Kategori Seçiniz</label>
                  <select name="haberKategori" class="form-control">
                  <c:if test="${not empty haberKategori }">
                  	<c:forEach var="item" items="${haberKategori }">
                    	<option value="${item.hkatid}">${item.hkadi}</option>
                    </c:forEach>
                  </c:if>
                    
                    
                  </select>
                  
                    <div class="form-group">
                  <label>Haber İçerik</label>
                  <textarea name="icerik" id="editor1" class="form-control" rows="3" placeholder="İçerik"></textarea>
                </div>
            </div>
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
              <h3 class="box-title">Haber Listesi</h3>
            </div>
            
            <div class="box-body no-padding">
              <table class="table table-striped">
                <tbody><tr>
                  <th style="width: 10px">haberid</th>
                  <th style="width: 100px">haberKat</th>
                  <th>haberAdi</th>
                  <th style="width: 60px">haberTarih</th>
                  <th>İşlem</th>
                </tr>
                
                
<c:if test="${not empty liste }">
<c:forEach var="item" items="${liste }">

           
            <tr>
              <td>${ item.haberid }</td>
              <td>${ item.haberKat }</td>
              <td>${ item.haberAdi }</td>
              <td>${ item.haberTarih }</td>
              <td><a href="">${ item.haberid }</a></td>
            </tr>
            
            
            
            
</c:forEach>
</c:if>


           

            



    
            

           
            


                
                
               
              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>

</div>
   
   
   
   
   
   
   
   
   
   
   
   
   
                
                
                
           
                
                
                
            
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
    
    