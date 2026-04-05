<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="A personal portfolio highlighting skills in programming, design, and project development gained through college coursework.">
	<meta name="author" content="Jake H. Talsky">
	<link rel="icon" href="favicon.ico">

	<title>My Online Portfolio</title>

	<%@ include file="/css/include_css.jsp" %>	

<!-- Carousel styles -->
<style type="text/css">
h2
{
	margin: 0;     
	color: #CEB888;
	padding-top: 50px;
	position: absolute;
	left: 50%;
	transform: translateX(-50%);
	font-size: 52px;
	font-family: "trebuchet ms", sans-serif;
	animation: fadeInDown 1s ease-in-out;
	text-shadow: 2px 2px 4px rgba(0,0,0,0.8);
	white-space: nowrap;
}
@keyframes fadeInDown {
	0% {
		opacity: 0;
		transform: translateX(-50%) translateY(-50px);
	}
	100% {
		opacity: 1;
		transform: translateX(-50%) translateY(0);
	}
}
.item
{
	background: #782F40;
	text-align: center;
	height: 300px !important;
}
.item::before
{
	content: "";
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 100%;
	background: rgba(0,0,0,0.4);
	z-index: 1;
}
.carousel-caption
{
	z-index: 2;
	animation: fadeIn 1.5s ease-in-out;
}
.carousel-caption h3
{
	color: #CEB888;
	font-weight: bold;
	text-shadow: 1px 1px 3px rgba(0,0,0,0.8);
}
@keyframes fadeIn
{
	from {opacity: 0; transform: translateY(30px);}
	to {opacity: 1; transform: translateY(0);}
}
.carousel
{
	margin: 20px 0px;
	box-shadow: 0 10px 20px rgba(0,0,0,0.4);
	border-radius: 10px;
	overflow: hidden;
	border: 2px solid #CEB888;
}
.bs-example
{
	margin: 20px;
	padding: 20px;
	border-radius: 15px;
	background: linear-gradient(135deg, #782F40, #5a2330);
}
.carousel-inner
{
	position: relative;
	height: 300px;
}
.carousel .item
{
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	opacity: 0;
	transition: opacity 1s ease-in-out;
	z-index: 1;
}
.carousel .item.active
{
	opacity: 1;
	position: relative;
	z-index: 2;
}
.carousel-link
{
	display: block;
	width: 100%;
	height: 100%;
	color: inherit;
	text-decoration: none;
	z-index: 2;
}
.carousel-link:hover
{
	text-decoration: none;
}
/* Carousel buttons */
.carousel-caption .btn
{
	background-color: #CEB888;
	border-color: #CEB888;
	color: #782F40;
	font-weight: bold;
}
.carousel-caption .btn:hover
{
	background-color: white;
	border-color: white;
	color: #782F40;
}
/* Carousel indicators */
.carousel-indicators li
{
	border-color: #CEB888;
}
.carousel-indicators .active
{
	background-color: #CEB888;
}
/* Carousel arrows */
.carousel-control
{
	color: #CEB888;
}
</style>
	
</head>
<body>
	
	<%@ include file="/global/nav_global.jsp" %>	
	
	<div class="container">
		<div class="starter-template">
			<div class="page-header">
				<%@ include file="/global/header.jsp" %>							
			</div>

			<!-- Start Bootstrap Carousel -->
			<div class="bs-example">
				<div
					id="myCarousel"
					class="carousel"
					data-interval="3000"
					data-pause="hover"
					data-wrap="true"
					data-keyboard="true"			
					data-ride="carousel">
				
					<!-- Carousel indicators -->
					<ol class="carousel-indicators">
						<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
						<li data-target="#myCarousel" data-slide-to="1"></li>
						<li data-target="#myCarousel" data-slide-to="2"></li>
						<li data-target="#myCarousel" data-slide-to="3"></li>
					</ol>

					<!-- Carousel items -->
					<div class="carousel-inner">

						<!-- Slide 1 -->
						<div class="active item" style="background: url(img/atlanta.png) no-repeat center center; background-size: cover;">
							<a href="https://www.linkedin.com/in/jake-talsky-3737a8212/"
							   target="_blank"
							   rel="noopener noreferrer"
							   class="carousel-link">
								<div class="container">
									<h2>Jake H. Talsky</h2>
									<div class="carousel-caption">
										<h3>LinkedIn</h3>
										<span class="btn btn-lg">Click Me!</span>
									</div>
								</div>
							</a>
						</div>

						<!-- Slide 2 -->
						<div class="item" style="background: url(img/Random_Turtle.jpg) no-repeat center center; background-size: cover;">
							<a href="https://bitbucket.org/"
							   target="_blank"
							   rel="noopener noreferrer"
							   class="carousel-link">
								<div class="container">
									<h2>Jake H. Talsky</h2>
									<div class="carousel-caption">
										<h3>Bitbucket</h3>
										<span class="btn btn-lg">Click Me!</span>
									</div>
								</div>
							</a>
						</div>

						<!-- Slide 3 -->
						<div class="item" style="background: url(img/fsu.png) no-repeat center center; background-size: cover;">
							<a href="https://github.com/"
							   target="_blank"
							   rel="noopener noreferrer"
							   class="carousel-link">
								<div class="container">
									<h2>Jake H. Talsky</h2>
									<div class="carousel-caption">
										<h3>GitHub</h3>
										<span class="btn btn-lg">Learn More!</span>
									</div>
								</div>
							</a>
						</div>

						<!-- Slide 4 -->
						<div class="item" style="background: url(img/favicon.png) no-repeat center center; background-size: 50% 50%;">
							<a href="https://webaim.org/resources/contrastchecker/"
							   target="_blank"
							   rel="noopener noreferrer"
							   class="carousel-link">
								<div class="container">
									<h2>Logo</h2>
									<div class="carousel-caption">
										<h3>JT</h3>
										<span class="btn btn-lg">Check Your Contrast!</span>
									</div>
								</div>
							</a>
						</div>

					</div><!-- end carousel-inner -->
				</div><!-- end carousel -->
			</div><!-- end bs-example -->
			<!-- End Bootstrap Carousel -->

			<%@ include file="/global/footer.jsp" %>

		</div><!-- end starter-template -->
	</div><!-- end container -->

	<%@ include file="/js/include_js.jsp" %>
	
</body>
</html>