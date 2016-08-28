<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<title>Site Başlığı</title>
<jsp:include page="/siteust"></jsp:include>



    <script type="text/javascript" src='<spring:url value="/resources/lib/jquery-1.10.1.min.js"></spring:url>'></script>
    <script type="text/javascript" src='<spring:url value="/resources/lib/jquery.mousewheel-3.0.6.pack.js"></spring:url>'></script>
    <script type="text/javascript" src='<spring:url value="/resources/source/jquery.fancybox.js?v=2.1.5"></spring:url>'></script>
    <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/source/jquery.fancybox.css?v=2.1.5"></spring:url>" media="screen" />
        <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/source/helpers/jquery.fancybox-buttons.css?v=1.0.5"></spring:url>" media="screen" />
    <script type="text/javascript" src='<spring:url value="/resources/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></spring:url>'></script>
            <link rel="stylesheet" type="text/css" href="<spring:url value="/resources/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7"></spring:url>" media="screen" />
    
    <script type="text/javascript" src='<spring:url value="/resources/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></spring:url>'></script>
    <script type="text/javascript" src='<spring:url value="/resources/source/helpers/jquery.fancybox-media.js?v=1.0.6"></spring:url>'></script>
    
    <link href="<spring:url value="/resources/bootstrap/css/bootstrap.min.css"></spring:url>" rel="stylesheet">
	<script type="text/javascript">
	var $aa= jQuery.noConflict();
	$aa(document).ready(function() {
			/*
			 *  Simple image gallery. Uses default settings
			 */

			 $aa('.fancybox').fancybox();

			/*
			 *  Different effects
			 */

			// Change title type, overlay closing speed
			$aa(".fancybox-effects-a").fancybox({
				helpers: {
					title : {
						type : 'outside'
					},
					overlay : {
						speedOut : 0
					}
				}
			});

			// Disable opening and closing animations, change title type
			$aa(".fancybox-effects-b").fancybox({
				openEffect  : 'none',
				closeEffect	: 'none',

				helpers : {
					title : {
						type : 'over'
					}
				}
			});

			// Set custom style, close if clicked, change title type and overlay color
			$aa(".fancybox-effects-c").fancybox({
				wrapCSS    : 'fancybox-custom',
				closeClick : true,

				openEffect : 'none',

				helpers : {
					title : {
						type : 'inside'
					},
					overlay : {
						css : {
							'background' : 'rgba(238,238,238,0.85)'
						}
					}
				}
			});

			// Remove padding, set opening and closing animations, close if clicked and disable overlay
			$aa(".fancybox-effects-d").fancybox({
				padding: 0,

				openEffect : 'elastic',
				openSpeed  : 150,

				closeEffect : 'elastic',
				closeSpeed  : 150,

				closeClick : true,

				helpers : {
					overlay : null
				}
			});

			/*
			 *  Button helper. Disable animations, hide close button, change title type and content
			 */

			 $aa('.fancybox-buttons').fancybox({
				openEffect  : 'none',
				closeEffect : 'none',

				prevEffect : 'none',
				nextEffect : 'none',

				closeBtn  : false,

				helpers : {
					title : {
						type : 'inside'
					},
					buttons	: {}
				},

				afterLoad : function() {
					this.title = 'Image ' + (this.index + 1) + ' of ' + this.group.length + (this.title ? ' - ' + this.title : '');
				}
			});


			/*
			 *  Thumbnail helper. Disable animations, hide close button, arrows and slide to next gallery item if clicked
			 */

			 $aa('.fancybox-thumbs').fancybox({
				prevEffect : 'none',
				nextEffect : 'none',

				closeBtn  : false,
				arrows    : false,
				nextClick : true,

				helpers : {
					thumbs : {
						width  : 50,
						height : 50
					}
				}
			});

			/*
			 *  Media helper. Group items, disable animations, hide arrows, enable media and button helpers.
			*/
			$aa('.fancybox-media')
				.attr('rel', 'media-gallery')
				.fancybox({
					openEffect : 'none',
					closeEffect : 'none',
					prevEffect : 'none',
					nextEffect : 'none',

					arrows : false,
					helpers : {
						media : {},
						buttons : {}
					}
				});

			/*
			 *  Open manually
			 */

			 $aa("#fancybox-manual-a").click(function() {
				$.fancybox.open('1_b.jpg');
			});

			 $aa("#fancybox-manual-b").click(function() {
				$.fancybox.open({
					href : 'iframe.html',
					type : 'iframe',
					padding : 5
				});
			});

			 $aa("#fancybox-manual-c").click(function() {
				$.fancybox.open([
					{
						href : '1_b.jpg',
						title : 'My title'
					}, {
						href : '2_b.jpg',
						title : '2nd title'
					}, {
						href : '3_b.jpg'
					}
				], {
					helpers : {
						thumbs : {
							width: 75,
							height: 50
						}
					}
				});
			});


		});
	</script>

    <div class="container">
    
    <c:if test="${not empty urun }">
<c:forEach var="item" items="${urun }">
    
        <div class="row">
            <jsp:include page="/sitesolMenu"></jsp:include>
            <div class="col-md-9">
                <div class="row">

					<h3>${item.ubaslik }</h3>
					<hr>
					<div class="col-md-6">

<a class="fancybox" href="<spring:url value="${item.radi }"></spring:url>" data-fancybox-group="gallery" title="${item.ubaslik }"><img  alt='${item.ubaslik }' title='${item.ubaslik }' src='<spring:url value="${item.radi }"></spring:url>' width="200" height="200"/></a>

					</div>
					
					<div class="col-md-3">
					<div>${item.ukisaAciklama }</div>
					<div>${item.ufiyat }</div>
					<div>${item.utarih }</div>
					<div><a href="<spring:url value="katDetay?katId=${item.ukatAdi }"></spring:url>">Benzer Ürünler</a></div>
					</div>
					
					

                </div>
            </div>
        </div>
        <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-9">
        <hr>
        <p>${item.udetay }</p>
        </div>
		</div>
        </c:forEach>					
</c:if>
        
    </div>
<jsp:include page="/siteFooter"></jsp:include>
<script src='<spring:url value="/resources/plugins/jQuery/jquery-2.2.3.min.js"></spring:url>'></script>
<script src='<spring:url value="/resources/bootstrap/js/bootstrap.min.js"></spring:url>'></script>
</body>
</html>
