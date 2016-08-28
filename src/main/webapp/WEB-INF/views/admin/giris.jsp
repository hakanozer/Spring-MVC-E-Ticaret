<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>AdminLTE 2 | Log in</title>
  <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <!-- Bootstrap 3.3.6 -->
  <link rel="stylesheet" href='<spring:url value="/resources/bootstrap/css/bootstrap.min.css"></spring:url>'>
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href='<spring:url value="/resources/dist/css/AdminLTE.min.css"></spring:url>'>
  <!-- iCheck -->
  <link rel="stylesheet" href='<spring:url value="/resources/plugins/iCheck/square/blue.css"></spring:url>'>

  <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="hold-transition login-page">
<div class="login-box">
  <div class="login-logo">
   <b>Spring MVC</b> Proje
  </div>
  
  <div class="login-box-body">
  
  <c:if test="${not empty basarili}">
          <div class="box box-success box-solid">
            <div class="box-header with-border">
              <h3 class="box-title">Giriş Başarılı</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             ${basarili}
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
	</c:if>
  
    <c:if test="${not empty basarisiz}">
          <div class="box box-success box-solid">
            <div class="box-header with-border" style="background: #ff0000;background-color: #ff0000;">
              <h3 class="box-title">Giriş Başarısız</h3>

              <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
             ${basarisiz}
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
	</c:if>
  
  
    <p class="login-box-msg">Admin Bilgilerinizi Giriniz</p>
    <form action='<spring:url value="/admin/girisYap"></spring:url>' method="post">
      <div class="form-group has-feedback">
        <input name="mail" type="email" class="form-control" placeholder="Email">
        <span class="glyphicon glyphicon-envelope form-control-feedback"></span>
      </div>
      <div class="form-group has-feedback">
        <input name="sifre" type="password" class="form-control" placeholder="Şifre">
        <span class="glyphicon glyphicon-lock form-control-feedback"></span>
      </div>
      <div class="row">
        <div class="col-xs-8">
          <div class="checkbox icheck">
            <label>
              <input type="checkbox" name="beni_hatirla"> Beni Hatırla
            </label>
          </div>
        </div>
        <!-- /.col -->
        <div class="col-xs-4">
          <button type="submit" class="btn btn-primary btn-block btn-flat">Giriş Yap</button>
        </div>
        <!-- /.col -->
      </div>
    </form>


  </div>
  <!-- /.login-box-body -->
</div>
<!-- /.login-box -->

<script src='<spring:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js"></spring:url>'></script>
<!-- Bootstrap 3.3.6 -->
<script src='<spring:url value="/resources/bootstrap/js/bootstrap.min.js"></spring:url>'></script>
<!-- iCheck -->
<script src='<spring:url value="/resources/plugins/iCheck/icheck.min.js"></spring:url>'></script>
<script>
  $(function () {
    $('input').iCheck({
      checkboxClass: 'icheckbox_square-blue',
      radioClass: 'iradio_square-blue',
      increaseArea: '20%' // optional
    });
  });
</script>
</body>
</html>
