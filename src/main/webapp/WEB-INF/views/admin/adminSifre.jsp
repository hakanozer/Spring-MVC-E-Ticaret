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
        Admin Şifre Değiştirme
        <small>Admin Şifre Değiştirme </small>
      </h1>
      <ol class="breadcrumb">
        <li><a href='<spring:url value="/admin/bos"></spring:url>'><i class="fa fa-dashboard"></i> Anasayfa</a></li>
        <li class="active">Admin Şifre Değiştirme</li>
      </ol>
    </section>
    <section class="content">
    
     	<div>
     	<c:if test="${not empty basarili}">
     		${basarili }
     	</c:if>
     			
     	<c:if test="${not empty basarisiz}">
     		${basarisiz }
     	</c:if>
     	
     	</div>
     	<div class="box box-info">
            <div class="box-header with-border">
              <h3 class="box-title">Şifre Değiştir</h3>
            </div>
            <!-- /.box-header -->
            <!-- form start -->
            <form action='<spring:url value="/admin/sifreDegistir"></spring:url>' class="form-horizontal" method="POST" role="form">
              <div class="box-body">
                <div class="form-group">
                  <label for="inputEmail3" class="col-sm-2 control-label">Eski Şifre</label>

                  <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputEmail3" placeholder="eskiSifre" name="eskiSifre">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Password</label>

                  <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputPassword3" placeholder="Yeni sifre" name="yeniSifre">
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputPassword3" class="col-sm-2 control-label">Password</label>

                  <div class="col-sm-10">
                    <input type="password" class="form-control" id="inputPassword3" placeholder="Yeni sifre" name="yeniSifreTekrar">
                  </div>
                </div>
            
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="reset" class="btn btn-default">iptal</button>
                <button type="submit" class="btn btn-info pull-right">Değiştir</button>
              </div>
              <!-- /.box-footer -->
            </form>
          </div>
     
    </section>
  </div>
  <jsp:include page="/alt"></jsp:include>
  <div class="control-sidebar-bg"></div>
</div>
</body>
</html>
    
    