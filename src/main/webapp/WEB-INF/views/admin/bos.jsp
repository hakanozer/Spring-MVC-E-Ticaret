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
    
     	<div>Burası çalışma alanı</div>
     
    </section>
  </div>
  <jsp:include page="/alt"></jsp:include>
  <div class="control-sidebar-bg"></div>
</div>
</body>
</html>
    
    