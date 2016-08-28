<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <div class="col-md-3">
       <p class="lead">Kategoriler</p>
       <div class="list-group">
       
       <c:if test="${not empty kat }">
       	<c:forEach items="${kat}" var="item">
           <a href='<spring:url value="katDetay?katId=${item.ukatid }"></spring:url>' class="list-group-item">${item.ukadi}</a>
        </c:forEach>
       </c:if>
       
<script src="<c:url value="/resources/autoComplate/jquery.1.10.2.min.js" />"></script>
<script src="<c:url value="/resources/autoComplate/jquery.autocomplete.min.js" />"></script>
<link href="<c:url value="/resources/autoComplate/main.css" />" rel="stylesheet">


  <script>
  var $bb= jQuery.noConflict();
  $bb(document).ready(function() {

	  	$bb('#w-input-search').autocomplete({
		serviceUrl: '${pageContext.request.contextPath}/getTags',
		paramName: "tagName",
		delimiter: ",",
	   transformResult: function(response) {

		return {
		  //must convert json to javascript object before process
		  suggestions: $.map($.parseJSON(response), function(item) {
		      return { value: item.tagName, data: item.id };
		   })

		 };

        },

	  	select: function (event, ui) {
	        //$(this).val(b.item.value);
	        //$(".searchform1").submit();
	        alert(a);
	        return false;
	    },
		
		
		
	 });

  });
  </script>
       <div  class="list-group-item">
       <form action='<spring:url value="aramaSonuc"></spring:url>' method="GET">
  		<input id="w-input-search" name="urunAdi"  placeholder="Ürün Ara" style=" width: 100%; border: 1px solid #dddddd; ">
	 	<input type="submit" style="visibility: hidden;"  /> 
	 </form>
	
</div>
       </div>
   </div>