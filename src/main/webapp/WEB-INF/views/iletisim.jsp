<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>
<title>Site Başlığı</title>
<jsp:include page="/siteust"></jsp:include>
<div class="container">
	<div class="row">
		<jsp:include page="/sitesolMenu"></jsp:include>
		<section class="content">

			<div class="row">
				<div class="col-md-6">





					<div class="box">

						<!-- /.box-header -->
						<div class="box-body no-padding">
						
									<c:if test="${not empty iletisim }">
										<c:forEach var="item" items="${iletisim }">

	<dl style="text-align:center"; class="contactPage">
						<dt>İşletme Adı</dt>
						<dd>Spring MVC Admin</dd>
						<dt>İl</dt>
						<dd>${item.il }</dd>
						<dt>İlçe</dt>
						<dd>${item.ilce }</dd>
						<dt>Adres</dt>
						<dd>${item.adres }</dd>
						<dt>Tel</dt>	
						<dd>${item.tel }</dd>			
						<dt>Faks</dt>
						<dd>${item.fax }</dd>
						<dt>Gsm</dt>
						<dd>${item.gsm }</dd>
						<dt>Mail</dt>
						<dd>${item.mail }</dd>
					</dl>
										</c:forEach>
									</c:if>
							
						</div>
						<!-- /.box-body -->
					</div>






				




				</div>
			</div>

		</section>


	</div>
</div>
<jsp:include page="/siteFooter"></jsp:include>
<script
	src='<spring:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js"></spring:url>'></script>
<script
	src='<spring:url value="/resources/bootstrap/js/bootstrap.min.js"></spring:url>'></script>
</body>
</html>
