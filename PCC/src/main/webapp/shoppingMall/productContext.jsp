<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>PCC - Shop</title>
<!-- Standard Favicon -->
<link rel="icon" type="image/x-icon" href="../images/pcc/pcc.png" />

<!-- Library - Google Font Familys -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../revolution/css/settings.css">


<!-- RS5.0 Layers and Navigation Styles -->
<link rel="stylesheet" type="text/css"
	href="../revolution/css/layers.css">
<link rel="stylesheet" type="text/css"
	href="../revolution/css/navigation.css">

<!-- Library - Bootstrap v3.3.5 -->
<link rel="stylesheet" type="text/css" href="../libraies/lib.css">
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet"
	integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN"
	crossorigin="anonymous">

<!-- Custom - Common CSS -->
<link rel="stylesheet" type="text/css" href="../css/plugins.css">
<link rel="stylesheet" type="text/css" href="../css/navigation-menu.css">
<link rel="stylesheet" type="text/css" href="../css/shortcode.css">
<link rel="stylesheet" type="text/css" href="../css/style.css">

<!-- fontawesome -->
<link href="../revolution/fonts/fontawesome-all.css">
<!-- css -->
<link rel="stylesheet" type="text/css" href="../css/login.css">
</head>


<body data-offset="200" data-spy="scroll" data-target=".ow-navigation">
	<div class="main-container">
		<!-- Loader -->
		<div id="site-loader" class="load-complete">
			<div class="loader">
				<div class="loader-inner ball-clip-rotate">
					<div></div>
				</div>
			</div>
		</div>
		<!-- Loader /- -->
		<%@ include file="../pages/header.jsp"%>

		<!-- Header -->

		<!--	內容開始	-->
		<main> <!-- Page Banner -->
		<div class="page-banner container-fluid no-padding">
			<!-- Container -->
			<div class="container">
				<div class="banner-content">
					<h3>購物商城</h3>
					<p>our vision is to be Earth's most customer centric company</p>
				</div>
				<ol class="breadcrumb">
					<li><a href="../index.html" title="Home">首頁</a></li>

					<!-- 須回到購物商城的首頁 也就是 熱賣商品中心 -->
					<li class="active"><a href="#">購物商城</a></li>
					<!-- 須回到購物商城的首頁 也就是 熱賣商品中心 -->
				</ol>
			</div>
			<!-- Container /- -->
		</div>
		<!-- Page Banner /- --> <!-- Product Section2 -->
		<div
			class="product-section product-section1 product-section2 container-fluid no-padding">
			<!-- Container -->
			<div class="container">
				<div class="row">
					<!-- Widget Area -->
					<div
						class="col-md-4 col-sm-4 col-xs-12 widget-area no-right-padding">
						<!-- Widget Search -->
						<aside class="widget widget_search">
						<h3 class="widget-title">Search</h3>
						<div class="input-group">
							<form action="/PCC/searchProduct.shopping" method="get"
								id="searchForm">
								<input class="form-control" id="searchText" name="searchText"
									placeholder="Search You Wants Here . . ." type="text">
								<span id="serch-btn" class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="icon icon-Search"></i>
									</button>
								</span>
							</form>
						</div>
						</aside>
						<!-- Widget Search /- -->
						<!-- Widget Categories -->
						<aside class="widget widget_categories">
						<h3 class="widget-title">Categories</h3>

						<ul>
							<c:forEach var="category" items="${categorys}">

								<li class="categoryli">
									<form action="<c:url value="/searchCatagory.shopping"/>"
										method="get">
										<a href="#">${category.categoryName}<span>(${category.sumCategory})
										</span>
										</a> <input type="text" name="category"
											value="${category.categoryName}" hidden />
									</form>
								</li>

							</c:forEach>
						</ul>

						</aside>
						<!-- Widget Categories /-  -->
						<!-- Widget Price -->
						<aside class="widget widget_price_filter">
						<h3 class="widget-title">filter by price</h3>
						<div class="price-filter">
							<div id="slider-range"></div>
							<div class="price-input">
								<span id="amount"></span> <span id="amount2"></span>
							</div>
							<a href="#" title="filter">Filter</a>
						</div>
						</aside>
						<!-- Widget Price /- -->
						<!-- Widget Latest Post -->
						<aside class="widget widget_latest_post">
						<h3 class="widget-title">recent posts</h3>

						<c:forEach var="asideProducts" items="${asideProducts}">
							<div class="latest-box">
								<div class="post-box">
									<!-- 思考一下 少 點圖跳到相關頁面 -->
									<a href="#"><img src="../images/latest-post-1.jpg"
										alt="Post"></a>
									<h5>
										<a href="#" title="need max shop.">${asideProducts.productName}</a>
									</h5>
									<div class="star-rating">
										<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star"></i> <i class="fa fa-star"></i> <i
											class="fa fa-star-o"></i>
									</div>
									<span class="price"><del>${asideProducts.price}</del>${asideProducts.price}</span>
									<!-- /思考一下 -->

								</div>
							</div>
						</c:forEach> </aside>
						<!-- Widget Latest Post /- -->
						<!-- Widget Tags -->
						<aside class="widget widget_tags">
						<h3 class="widget-title">popular tags</h3>
						<div class="tags-box">
							<c:forEach var="category" items="${categorys}">

								<a href="#" class="categoryli">${category.categoryName}
									<form action="<c:url value="/searchCatagory.shopping"/>"
										method="get">
										<input type="text" name="category"
											value="${category.categoryName}" hidden />
									</form>
								</a>
							</c:forEach>
						</div>
						</aside>
						<!-- Widget Tags -->
					</div>
					<!-- Widget Area /- -->

					<!-- Content Area -->
					<div
						class="col-md-8 col-sm-7 col-xs-12 content-area product-section2 no-left-padding">
						<!-- Products -->
						<div>
							<h1>
								<span itemprop="name">${productPage.productName}</span>商品編號： <span id="Id${productPage.productId}">${productPage.productId}</span>
							</h1>
							<p>
								<span itemprop="description">1024
									短版設計坑條針織搭配窄管寧褲化身韓妞STYLE~ </span>
							</p>

						</div>
						<table class="infolist">
							<colgroup>
								<col width="19%"></col>
								<col width="81%"></col>
							</colgroup>

							<tr class="webprice">
								<th scope="row">原價</th>
								<td><span class="price">${productPage.price}元</span></td>
							</tr>
							<tr class="cp_promo">
								<th scope="row">特價</th>
								<td><span class="price">${productPage.price}元</span></td>
							</tr>

							<tr class="js-cccart">
								<th scope="row">付款方式</th>
								<td>
									<ul class="list paytypes clearfix">
										<li>
											<div class="paytype">
												信用卡 <img
													src="https://s.yimg.com/f/i/tw/mall/yps/ico_credi_201008.png"
													alt="接受信用卡刷卡">
											</div>
										</li>
										<li>
											<div class="paytype">
												ATM轉帳 <img
													src="https://s.yimg.com/f/i/tw/mall/yps/ico_atm_0109.gif"
													alt="接受ATM轉帳付款">
											</div>
										</li>
										<li class="familymart">
											<div class="paytype">
												全家付款取貨 <img
													src="https://s.yimg.com/qs/mall/yps/ico_famimart.gif"
													alt="全家付款取貨">
											</div>
										</li>
										<li class="sevenmart">
											<div class="paytype">
												7-11付款取貨 <img
													src="https://s.yimg.com/f/i/tw/mall/yps/ico_711.gif"
													alt="接受超商付款取貨">
											</div>
										</li>
									</ul>
								</td>
							</tr>
							<tr>

								<th scope="row">交貨方式</th>
								<td>
									<ul>
										<li><a href="#" title="貨運 / 宅配" class="trans"
											hpp="r_shipfee">貨運 / 宅配 (購物滿599元免運費) </a>、 <a href="#"
											title="7-11取貨付款" class="trans" hpp="r_shipfee">7-11取貨付款
												(購物滿599元免運費) </a>、 <a href="#" title="全家取貨付款" class="trans"
											hpp="r_shipfee">全家取貨付款 (購物滿599元免運費) </a></li>
									</ul>
								</td>
							</tr>

							<tr>
								<th scope="row">尺寸與規格</th>
								<td><select name="spec_id">
										<option selected>請選擇</option>
								</select></td>
							</tr>

						</table>


						<div>
							<button class="button button-default"
								data-ylk="sec:buyinfo;slk:立即購買;" id="e2e-item-checkout-top"
								hpp="add_cart_top" OnClick="ywaAddToCart('p0000145205549');"
								type="submit" value="我要購買">立即購買</button>
							<button class="button button-white"
								data-ylk="sec:buyinfo;slk:加入購物車;" id="e2e-item-add2cart-top"
								type="button">
								<span class="sprite sprite-cart-default"></span> <span>加入購物車</span>
							</button>
						</div>


						<!-- [WD] inc/ps_item_tab.html//-->
						<div id="ypsitb" class="ypsmodule ypstab">
							<div class="hd"></div>
							<div class="bd clearfix">
								<ul>
									<li class="on"><span>商品詳細說明</span> <em></em></li>
								</ul>
							</div>
							<div class="ft"></div>
						</div>

									<!-- 之後商品內容在這邊 -->

									<!-- /之後商品內容在這邊 -->



					</div>
				</div>
		</main>
		<!--	內容結束	-->

		<!-- Footer Main 1 -->
		<%@ include file="../pages/footer.jsp"%>
		<!-- Footer Main 1 -->
		<!-- Container /- -->
	</div>
	<form id="startForm" action="/PCC/star.shopping" method="post">
		<input name=pageName type="text" value="prodcutPage" hidden/> 
		<input
			id=startInput type="text" value="${start}" hidden />

	</form>
		<input id="productId" type="text" value="${productPage.productId}" hidden/>
			

	<!-- JQuery v1.12.4 -->
	<!-- 	<script src="../js/jquery.min.js"></script> -->

	<!-- Library - Js -->
	<script src="../libraies/lib.js"></script>
	<script src="../libraies/jquery.countdown.min.js"></script>

	<!-- RS5.0 Core JS Files -->
	<script type="text/javascript"
		src="../revolution/js/jquery.themepunch.tools.min.js"></script>
	<script type="text/javascript"
		src="../revolution/js/jquery.themepunch.revolution.min.js"></script>
	<script type="text/javascript"
		src="../revolution/js/extensoins/revolution.extension.video.min.js"></script>
	<script type="text/javascript"
		src="../revolution/js/extensoins/revolution.extension.slideanims.min.js"></script>
	<script type="text/javascript"
		src="../revolution/js/extensoins/revolution.extension.layeranimation.min.js"></script>
	<script type="text/javascript"
		src="../revolution/js/extensoins/revolution.extension.navigation.min.js"></script>
	<script type="text/javascript"
		src="../revolution/js/extensoins/revolution.extension.actions.min.js"></script>

	<!-- Library - Google Map API -->
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDW40y4kdsjsz714OVTvrw7woVCpD8EbLE"></script>

	<!-- Library - Theme JS -->
	<script src="../js/functions.js"></script>
	<!-- login  -->
	<script type="text/javascript" src="../js/login.js"></script>
	<script type="text/javascript">
		$(document)	.ready(function() {
							var starInput = $('#startInput').val();
							
							console.log(productId);
							ViewCart();
							//為了初始化的載入
							if (starInput == "") {
								$('#startForm').submit();
							}


							// 搜尋欄搜尋商品名
							$('#serch-btn').click(function() {
								// alert("已點");
								var searchText = $('#searchText').val();
								// alert(searchText);
								if (searchText.trim().length == 0) {
									alert('請輸入搜尋條件');
									$('#filter').val('').focus();
								} else {
									$('#searchForm').submit();
								}
							})
							// 分類欄點選分類
							$(".categoryli").click(function() {
								// alert(".categoryli被點選");
								var formid = $(this).find("input").val();

								// alert(formid);
								if (formid != '') {
									$(this).find("form").submit();
								}

							});

							// 加入購物車

							$("#e2e-item-add2cart-top").click(function() {
								var productId = $("#productId").val();
								var producIdCartLi = $("#" + productId + "SS");
								$.ajax({url : "/PCC/addCart.shopping",
										type : "POST",
										data : {
												"productId" : productId
												},
										success : function(data) {
											if (producIdCartLi.text() == "") {
												var item = $("#"+ data.productId);
													item.css("display","");
											}
											// 抓數量的數字
											$("#"+ data.productId+ "span").text(data.quantity);
											// 只要購物車內有東西，就打開View Cart 和Check Out
											ViewCart();
										}
								});

							});

			//點圖轉跳頁面

							$(".productItem").click(function() {
								var id = $(this).attr("id");
								$.ajax({url : "/PCC/controller.shopping",
										type : "GET",
										data : {
												"productId" : id
												},
										success : function(data) {
										location.replace("/PCC/shoppingMall/productContext.jsp");
										}
								});

							});

	});
		// 是否打開 ViweCart和Check out
		function ViewCart() {
			var sum = 0;
			$(".cartSpan").each(function() {
				var number = parseInt($(this).text());

				sum = sum + number;
			});
			if (sum == 0) {
				$("#cartButtonLi").css("display", "none");

			} else {
				$("#cartButtonLi").css("display", "");
			}

		}
	</script>
</body>
</html>


