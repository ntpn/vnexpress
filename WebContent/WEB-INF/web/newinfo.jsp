<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="javabean.New"%>

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
		<section class="main-content">
			<div class="padding">
				<div class="container">
					<div class="row">
						<div class="col-sm-8">
							<div class="single-post">
								<div class="type-standard">
									<article class="post type-post">
										<div class="top-content text-center">

											<%
												New anew = new New();
												if (request.getAttribute("anew") != null) {
													anew = (New) request.getAttribute("anew");
												} else {
											%>
											<p style="color: red;"><%=request.getAttribute("error").toString()%></p>
											<%
												}
											%>

											<span class="category">Thể loại: 
											<%
												if (anew.getCategory() != null) {
													for (int i = 0; i < anew.getCategory().size(); i++) {
											%> 
											<a
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
												<a href="standard.html"><%=anew.getTitle()%></a>
											<%
 											}
 										%>
											</h2>
											<!-- /.entry-title -->
											<%
												if (anew.getTime_post() != null) {
											%>
											<span><%=anew.getTime_post()%></span>
											<%
 											}
 										%>
											<!-- /.time -->
										</div>
										<!-- /.top-content -->

										<div class="entry-thumbnail">
											<img
												src="http://demos-jeweltheme.ipunu91y.maxcdn-edge.com/sasha/images/single/1.jpg"
												alt="Thumbnail Image">
										</div>
										<!-- /.entry-thumbnail -->

										<div class="entry-content">
											<%
											if (anew.getBody() != null) {
												for (int i = 0; i < anew.getBody().size(); i++) {
											%>
											<p>
												<%=anew.getBody().get(i)%>
											</p>
											<%
												}
											}
											%>

											<div class="post-meta">
												<p>
												<%
											if (anew.getBody() != null) {
												
											%>
													Tags:
													<%
													
													for (int i = 0; i < anew.getTags().size(); i++) {
												%>
													<a
														href="${pageContext.request.contextPath}/home?input=<%=anew.getTags().get(i)%>">#<%=anew.getTags().get(i)%></a>
													&nbsp;
													<!-- /.comments -->
													<%
														}
											}
													%>
												</p>
												<!-- /.post-social -->
											</div>
											<!-- /.post-meta -->
										</div>
										<!-- /.entry-content -->
									</article>
									<!-- /.post -->
								</div>
								<!-- /.type-standard -->





							</div>
							<!-- /.single-post -->
						</div>
					</div>
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
							Â©
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
					</div>

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
