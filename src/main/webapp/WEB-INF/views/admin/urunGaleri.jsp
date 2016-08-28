<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
					Ürün Galeri Yönetimi <small>Ürün Galeri </small>
				</h1>
				<ol class="breadcrumb">
					<li><a href='<spring:url value="/admin/bos"></spring:url>'><i
							class="fa fa-dashboard"></i> Anasayfa</a></li>
					<li class="active">Ürün Galeri</li>
				</ol>
			</section>
			<section class="content">



				<div class="col-md-6">
				<div class="box box-primary">

					<c:if test="${not empty basarili }">
					${basarili }
					</c:if>
					<c:if test="${not empty hata }">
					${hata }
					</c:if>

					<div class="box-header with-border">
						<h3 class="box-title">Ürün Galeri Ekle</h3>
					</div>
<script src='/panel/resources/plugins/jQuery/jquery-2.2.3.min.js'></script>
<script>
	$(document).ready(function(){
		$('#ekle').click(function(){
			$('#adFile').append('<input class="form-control" type="file" name="file">');
			$('#adName').append('<input class="form-control" type="text" name="name" placeholder="Dosya Adı !">');
		});
	});
</script>

					
<div class="btn-group">
  <button id="ekle" type="button" class="btn btn-default"><i class="fa fa-plus" aria-hidden="true"></i></button>
</div>

						<form role="form" method="POST"
							action='<spring:url value="/admin/uploadMultipleFile"></spring:url>'
							enctype="multipart/form-data">
							<div class="box-body">
								<div class="form-group" id="adFile">
									<input class="form-control" type="file" name="file">
								</div>
								<div class="form-group">
				                  <label>Ürünler</label>
				                  <select name="urun" class="form-control">
				                  
				                  <c:if test="${not empty urun }">
				                  <c:forEach var="item" items="${urun }">
				                    <option value="${item.urid }">${item.ubaslik }</option>
				                    </c:forEach>
				                    </c:if>
				                  </select>
				                </div>
								<div class="form-group" id="adName">
									<input class="form-control" type="text" name="name" placeholder="Dosya Adı !">
								</div>
								<div class="form-group">
									<input class="form-control" type="submit" value="Yükleme Yap">
								</div>
							</div>
						</form>

					</div>
				</div>



<div class="col-md-6">

<div class="box">
            <div class="box-header">
              <h3 class="box-title">Resimler</h3>
            </div>
            
            <div class="box-body no-padding">
              <table class="table table-striped">
                <tbody><tr>
                  <th style="width: 10px">ID</th>
                  <th style="width: 100px">Resim</th>
                  <th>Ürün</th>
                  <th style="width: 60px">Tarih</th>
                  <th>İşlem</th>
                </tr>
                
                
<c:if test="${not empty ugaleri }">
<c:forEach var="item" items="${ugaleri }">
           
            <tr>
              <td>${item.uid }</td>
              <td><img alt="" src="${item.radi }" width="100" height="100"> </td>
              <td>${item.ubaslik }</td>
              <td>${item.rtarih }</td>
              <td><a href='<spring:url value="/admin/urunGaleriSil?resimId=${item.uid }"></spring:url>' class="btn btn-block btn-danger btn-sm">Sil</a></td>
            </tr>
            
</c:forEach>
</c:if>
                
                
               
              </tbody></table>
            </div>
            <!-- /.box-body -->
          </div>

</div>










			</section>
		</div>
		<jsp:include page="/alt"></jsp:include>
		<div class="control-sidebar-bg"></div>
	</div>
</body>
</html>

