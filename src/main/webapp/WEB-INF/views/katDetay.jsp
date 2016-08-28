<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>


<title>Site Başlığı</title>

<jsp:include page="/siteust"></jsp:include>

    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <jsp:include page="/sitesolMenu"></jsp:include>

            <div class="col-md-9">

                <div class="row">
                
<h4>Kategori: 
<c:if test="${not empty katAdi }">
${ katAdi }
</c:if>
</h4> 
<hr></hr>                

<c:if test="${not empty urunler }">
<c:forEach var="item" items="${urunler}">			
                    <div class="col-sm-4 col-lg-4 col-md-4">
                        <div class="thumbnail">
                            <img src="${item.radi }" alt="" style="width: 320px; height: 150px; " width="320" height="150">
                            <div class="caption">
                                <h4 class="pull-right">${item.ufiyat }</h4>
                                <h4><a href='<spring:url value="urunDetay?urunID=${item.uid }"></spring:url>'>${item.ubaslik }</a>
                                </h4>
                                <p>${item.ukisaAciklama }</p>
                            </div>
                            
                        </div>
                    </div>
 </c:forEach>	           
</c:if>

                    

                    

                    

                   


                </div>

            </div>

        </div>

    </div>


<jsp:include page="/siteFooter"></jsp:include>

<script src='<spring:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js"></spring:url>'></script>
<script src='<spring:url value="/resources/bootstrap/js/bootstrap.min.js"></spring:url>'></script>


</body>

</html>
