<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
   <footer class="main-footer">
    <div class="pull-right hidden-xs">
      <b>Version</b> 2.3.5
    </div>
    <strong>Copyright &copy; 2014-2016 <a href="http://almsaeedstudio.com">Almsaeed Studio</a>.</strong> All rights
    reserved.
  </footer>
     
<!-- jQuery 2.2.3 -->
<script src='<spring:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js"></spring:url>'></script>
<!-- jQuery UI 1.11.4 -->
<script src="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- Resolve conflict in jQuery UI tooltip with Bootstrap tooltip -->
<script>
  $.widget.bridge('uibutton', $.ui.button);
</script>
<!-- Bootstrap 3.3.6 -->
<script src='<spring:url value="/resources/bootstrap/js/bootstrap.min.js"></spring:url>'></script>
<!-- Morris.js charts -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/raphael/2.1.0/raphael-min.js"></script>
<script src='<spring:url value="/resources/plugins/morris/morris.min.js"></spring:url>'></script>
<!-- Sparkline -->
<script src='<spring:url value="/resources/plugins/sparkline/jquery.sparkline.min.js"></spring:url>'></script>
<!-- jvectormap -->
<script src='<spring:url value="/resources/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></spring:url>'></script>
<script src='<spring:url value="/resources/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></spring:url>'></script>
<!-- jQuery Knob Chart -->
<script src='<spring:url value="/resources/plugins/knob/jquery.knob.js"></spring:url>'></script>
<!-- daterangepicker -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.11.2/moment.min.js"></script>
<script src='<spring:url value="/resources/plugins/daterangepicker/daterangepicker.js"></spring:url>'></script>
<!-- datepicker -->
<script src='<spring:url value="/resources/plugins/datepicker/bootstrap-datepicker.js"></spring:url>'></script>
<!-- Bootstrap WYSIHTML5 -->
<script src='<spring:url value="/resources/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></spring:url>'></script>
<!-- Slimscroll -->
<script src='<spring:url value="/resources/plugins/slimScroll/jquery.slimscroll.min.js"></spring:url>'></script>
<!-- FastClick -->
<script src='<spring:url value="/resources/plugins/fastclick/fastclick.js"></spring:url>'></script>
<!-- AdminLTE App -->
<script src='<spring:url value="/resources/dist/js/app.min.js"></spring:url>'></script>
<!-- AdminLTE dashboard demo (This is only for demo purposes) -->
<script src='<spring:url value="/resources/dist/js/pages/dashboard.js"></spring:url>'></script>
<!-- AdminLTE for demo purposes -->
<script src='<spring:url value="/resources/dist/js/demo.js"></spring:url>'></script>

