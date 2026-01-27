<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="A personal portfolio highlighting skills in programming, design, and project development gained through college coursework.">
	<meta name="author" content="Jake H. Talsky">
	<link rel="icon" href="img/favicon.ico">

	<title>My Online Portfolio</title>

	<%@ include file="/css/include_css.jsp" %>	

<!-- Carousel styles -->
<style type="text/css">
h2
{
	margin: 0;     
	background: linear-gradient(to right, #f06, #ff9);
	background-clip: text;
	-webkit-background-clip: text;
	-webkit-text-fill-color: transparent;
	color: transparent;
	padding-top: 50px;
	font-size: 52px;
	font-family: "trebuchet ms", sans-serif;
	animation: fadeInDown 1s ease-in-out;
}
@keyframes fadeInDown
{
	0% {opacity: 0; transform: translateY(-50px);}
	100% {opacity: 1; transform: translateY(0);}
}
.item
{
	background: #333;    
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
	z-index:2;
	animation: fadeIn 1.5s ease-in-out;
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
}
.bs-example
{
  margin: 20px;
  padding: 20px;
  border-radius: 15px;
  background: linear-gradient(135deg, #f06, #ff9);
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
</style>
	
</head>
<body>
	
	<%@ include file="/global/nav_global.jsp" %>	
	
	<div class="container">
		 <div class="starter-template">
						<div class="page-header">
						<%@ include file="/global/header.jsp" %>							
						</div>

<!-- Start Bootstrap Carousel  -->
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
        </ol>   
       <!-- Carousel items -->
        <div class="carousel-inner">

				 <div class="active item" style="background: url(img/robot.jpg) no-repeat left center; background-size: cover;">
					 <div class="container">
						 <div class="carousel-caption">
								<h3>First slide label.</h3>
							 <p class="lead">Cras justo odio, dapibus ac facilisis in, egestas eget quam. Donec id elit non mi porta gravida at eget.</p>
							 <a class="btn btn-large btn-primary" href="#">Learn more</a>
						 </div>
					 </div>
				 </div>					

         <div class="item" style="background: url(img/Random_Turtle.jpg) no-repeat left center; background-size: cover;">
                <h2>Slide 2</h2>
                <div class="carousel-caption">
                  <h3>Second slide label</h3>
                  <p>Aliquam sit amet gravida nibh, facilisis gravida odio.</p>
						 <!--  <img src="img/slide2.png" alt="Slide 2">									 -->						
                </div>
            </div>

         <div class="item" style="background: url(img/keyboard.jpg) no-repeat left center; background-size: cover;">
                <h2>Slide 3</h2>
                <div class="carousel-caption">
                  <h3>Third slide label</h3>
                  <p>Praesent commodo cursus magna, vel scelerisque nisl consectetur.</p>
						<!--  <img src="img/slide3.png" class="img-responsive" alt="Slide 3">							 -->								
                </div>
            </div>

        </div>
        <!-- Carousel nav -->
        <a class="carousel-control left" href="#myCarousel" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="carousel-control right" href="#myCarousel" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
    </div>
</div>
<!-- End Bootstrap Carousel  -->

 	<%@ include file="/global/footer.jsp" %>

	</div> <!-- end starter-template -->
</div> <!-- end container -->

 	<%@ include file="/js/include_js.jsp" %>
	
</body>
</html>