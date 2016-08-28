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
        Ürünler
        <small>Ürün listesi</small>
      </h1>
      <ol class="breadcrumb">
        <li><a href='<spring:url value="/admin/bos"></spring:url>'><i class="fa fa-dashboard"></i> Anasayfa</a></li>
        <li class="active">Ürünler</li>
      </ol>
    </section>
    <section class="content">
    
     	<div class="row">
     	<div class="col-xs-12">
			<div class="box">
            <div class="box-header">
              <h3 class="box-title">Ürün Listesi</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <table id="example1" class="table table-bordered table-striped">
                <thead>
                <tr>
                  <th>id</th>
                  <th>Adı</th>
                  <th>Kategori</th>
                  <th>Fiyat</th>
                  <th>Tarih</th>
                </tr>
                </thead>
                <tbody>
                
                <c:if test="${not empty urun }">
                <c:forEach var="item" items="${urun }">
                <tr>
                  <td>${item.urid }</td>
                  <td>${item.ubaslik }</td>
                  <td>${item.katAdi }</td>
                  <td>${item.ufiyat }</td>
                  <td>${item.uTarih }</td>
                </tr>
                </c:forEach>
                </c:if>
                
                
                </tfoot>
              </table>
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
    
    