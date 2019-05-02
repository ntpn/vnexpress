<%@page import="com.sun.media.jfxmedia.events.NewFrameEvent"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Khai báo thư viện-->
<%@ page import="java.util.List"%>
<%@ page import="javabean.New"%>
<%@ page import="javabean.SetOfNews"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="javafx.scene.image.Image"%>

<!doctype html>
<html class="no-js" lang="">
<head>
<meta charset="utf-8">
<meta http-equiv="x-ua-compatible" content="ie=edge">
<title>Sasha - Blogging HTML5 Template</title>
<meta name="description" content="Sasha - Blogging HTML5 Template">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="apple-touch-icon" href="apple-touch-icon.png">

<!-- Import Icon Packs -->
<link rel="stylesheet" href="assets/css/font-awesome.min.css">
<link rel="stylesheet" href="assets/css/elegent-icons.css">

<!-- Import External Scrpit CSS Files -->
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/owl.carousel.css">

<!-- Import Template CSS Files -->
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/header.css">
<link rel="stylesheet" href="assets/css/themes.css">
<link rel="stylesheet" href="assets/css/responsive.css">

<!-- <script src="//cdnjs.cloudflare.com/ajax/libs/less.js/2.7.2/less.min.js"></script> -->
<script src="assets/js/modernizr-2.8.3.min.js"></script>



</head>


<body>

	<div class="overlay-wrapper">

		<header class="masthead">
			<div class="header-top">
				<div class="container">
					<div class="menu-search">
						<div class="form-trigger">
							<i class="icon_search"></i>
						</div>
						<form action="${pageContext.request.contextPath}/home"
							method="get">
							<input type="text" name="input" id="menu-search"
								placeholder="SearchInput"%>> <input type="submit"
								name="search" value="search">
						</form>
					</div>
				</div>
				<!-- /.container -->
			</div>
			<!-- /.header-top -->

			<div class="header-bottom">
				<div class="container"></div>
				<!-- /.container -->
			</div>
			<!-- /.header-bottom -->
		</header>
		<!-- /.masthead -->





		<section class="main-content">
			<div class="padding">
				<div class="container">
					<div class="row">
						<div class="col-sm-8">
							<div class="list-posts">
								<%
									SetOfNews setOfNews = new SetOfNews();
									String serverOfPages = "home";
									ArrayList<New> news = new ArrayList<New>();
									if ((request.getAttribute("listOfNews") == null)) {
								%>
								Không có thông tin để hiển thị.
								<%
									} else {
										setOfNews = (SetOfNews) request.getAttribute("listOfNews");
										//news = newsfeed.getSet();
										if (request.getAttribute("mode") == "search") {
								%>
								<p>
									Có
									<%=setOfNews.getNum()%>
									kết quả tìm kiếm.
								</p>
								<%
									} else if (request.getAttribute("mode") == "category") {
										serverOfPages = "searchCategory";
								%>
								<h4>
									Thể loại:
									<%=request.getAttribute("input")%>
								</h4>
								<%
									}
										for (New anew : setOfNews.getSet()) {
								%>

								<article class="post type-post media">
									<div class="entry-thumbnail media-left pull-left">
										<img width="50px" height="50px"
											src="http://2.bp.blogspot.com/-vn4DQlyYFH8/VBAqy7F2bOI/AAAAAAAAPfI/ctEgLtEEZMM/s1600/anh-dep-ve-mua.jpg"
											alt="Thumbnail Image">
									</div>
									<!-- /.entry-thumbnail -->
									<div class="entry-content media-body">
										<span class="category">Thể loại: <%
											if (anew.getCategory() != null) {
														for (int i = 0; i < anew.getCategory().size(); i++) {
										%> <a
											href="${pageContext.request.contextPath}/searchCategory?input=<%=anew.getCategory().get(i)%>"><%=anew.getCategory().get(i)%></a>
											&nbsp;<!-- /.comments --> <%
 	}
 			}
 %>
										</span>
										<!-- /.category -->
										<h2 class="entry-title">
											<%
												if (anew.getTitle() != null) {
											%>
											<a
												href="${pageContext.request.contextPath}/newinfo?id=<%=anew.getId()%>"><%=anew.getTitle()%></a>
											<%
												}
											%>
										</h2>
										<!-- /.entry-title -->
										<%
											if (anew.getTime_post() != null) {
										%>
										<span class="time"><%=anew.getTime_post()%></span>
										<%
											}
										%>
										<!-- /.time -->
										<%
											if (anew.getBody() != null) {
										%>
										<p><%=anew.getBody().get(0)%></p>
										<a
											href="${pageContext.request.contextPath}/newinfo?id=<%=anew.getId()%>"
											class="btn">Read more</a>
										<%
											}
										%>
										<!-- /.btn -->
									</div>
									<!-- /.entry-content -->
								</article>
								<!-- /.post -->

								<%
									}
								%>
								<!-- /.pagination -->

								<ul>
									<%
										long numPages = setOfNews.getNum()/10;
											int pages = 0;
											if (setOfNews.getNum() % 10 != 0) {
												numPages += 1;
											}
											if (request.getAttribute("pages") != null) {
												pages = (int) Integer.parseInt(request.getAttribute("pages").toString());
											}
											if (pages > 0) {
									%>
									<li><a
										href="${pageContext.request.contextPath}/<%=serverOfPages%>?input=<%=request.getAttribute("input").toString()%>&search=search&pages=<%=pages-1%>">Previous</a></li>
									<%
										}

											if (pages < numPages - 1) {
									%>
									<li><a
										href="
											${pageContext.request.contextPath}/<%=serverOfPages%>?input=<%=request.getAttribute("input").toString()%>&search=search&pages=<%=pages+1%>">Next</a></li>
									<%
										}
									%>

								</ul>

								<!-- /.pagination -->
							</div>

							<%
								}
							%>
							<div class="col-sm-4">

								<!-- /.sidebar -->
							</div>
						</div>
					</div>
					<!-- /.row -->
				</div>
				<!-- /.container -->
			</div>
			<!-- /.padding -->
		</section>
		<!-- /.main-content -->



		<footer class="site-footer colophon">
			<div class="container">
				<div class="row">
					<div class="col-sm-3">
						<a href="./" class="footer-logo pull-left"><img
							src="http://demos-jeweltheme.ipunu91y.maxcdn-edge.com/sasha/images/logo4.png"
							alt="Logo"></a>
						<!-- /.footer-logo -->
					</div>

					<div class="col-sm-6">
						<div class="copyright text-center">
							©
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with <i
								class="fa fa-heart-o" aria-hidden="true"></i> by <a
								href="https://colorlib.com" target="_blank">Colorlib</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</div>
						<!-- /.copyright -->
						<div class="col-sm-3">
							<div class="footer-social pull-right">
								<a href="#"><i class="fa fa-instagram"></i></a> <a href="#"><i
									class="fa fa-facebook"></i></a> <a href="#"><i
									class="fa fa-twitter"></i></a> <a href="#"><i
									class="fa fa-pinterest-p"></i></a>
							</div>
							<!-- /.footer-social -->
						</div>
					</div>

					<div class="col-sm-3">

						<!-- /.footer-social -->
					</div>
				</div>
				<!-- /.row -->
			</div>
			<!-- /.container -->
		</footer>
		<!-- /.site-footer -->

	</div>
	<!-- /.overlay -->

	<script src="assets/js/plugins.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>
