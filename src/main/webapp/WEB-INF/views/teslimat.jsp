<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<title>Site Başlığı</title>
<jsp:include page="/siteust"></jsp:include>
    <div class="container">
        <div class="row">
            <jsp:include page="/sitesolMenu"></jsp:include>
            <div class="col-md-9">
                <div class="row">

					<div class="row">
			            <div class="col-lg-12">
			                <h1 class="page-header">Teslimat
			                    <small>Teslimat için defatlı bilgiler</small>
			                </h1>
			                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sint, explicabo dolores ipsam aliquam inventore corrupti eveniet quisquam quod totam laudantium repudiandae obcaecati ea consectetur debitis velit facere nisi expedita vel?</p>
			            </div>
			        </div>
					
                </div>
            </div>
        </div>
    </div>
<jsp:include page="/siteFooter"></jsp:include>
<script src='<spring:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js"></spring:url>'></script>
<script src='<spring:url value="/resources/bootstrap/js/bootstrap.min.js"></spring:url>'></script>
</body>
</html>
