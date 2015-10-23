
<%
	boolean userLoggedIn = false;
	String userName = "";
	String userEmail= "";
	
	//fields for login
	userEmail = (String)session.getAttribute("loggedInUserEmail");
	userName = (String)session.getAttribute("loggedInUserName");
	if(userEmail!=null && userName!=null){
		userLoggedIn = true;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>About</title>
<meta charset="utf-8">
<link rel="icon" href="img/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="img/favicon.ico" type="image/x-icon" />
<meta name="description" content="Your description">
<meta name="keywords" content="Your keywords">
<meta name="author" content="Your name">
<link rel="stylesheet" href="css/bootstrap.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/responsive.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/style.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/touchTouch.css" type="text/css"
	media="screen">
<link rel="stylesheet" href="css/kwicks-slider.css" type="text/css"
	media="screen">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/superfish.js"></script>
<script type="text/javascript" src="js/jquery.flexslider-min.js"></script>
<script type="text/javascript" src="js/jquery.kwicks-1.5.1.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript" src="js/touchTouch.jquery.js"></script>
<script type="text/javascript">if($(window).width()>1024){document.write("<"+"script src='js/jquery.preloader.js'></"+"script>");}	</script>

<script>		
		 jQuery(window).load(function() {	
		 $x = $(window).width();		
	if($x > 1024)
	{			
	jQuery("#content .row").preloader();    }	
		 
     jQuery('.magnifier').touchTouch();			
    jQuery('.spinner').animate({'opacity':0},1000,'easeOutCubic',function (){jQuery(this).css('display','none')});	
  		  }); 
				
	</script>

<!--[if lt IE 8]>
  		<div style='text-align:center'><a href="http://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="http://www.theie6countdown.com/img/upgrade.jpg"border="0"alt=""/></a></div>  
 	<![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<!--<![endif]-->
<!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <link rel="stylesheet" href="css/ie.css" type="text/css" media="screen">
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400' rel='stylesheet' type='text/css'>
  <![endif]-->
</head>

<body>
	<div class="spinner"></div>
	<!--============================== header =================================-->
	<header>
		<div class="container clearfix">
			<div class="row">
				<div class="span12">
					<div class="navbar navbar_">
						<div class="container">
							<h1 class="brand brand_">
								<a href="index.jsp"><img alt="" src="img/logo.gif"> </a>
							</h1>
							<a class="btn btn-navbar btn-navbar_" data-toggle="collapse"
								data-target=".nav-collapse_">Menu <span class="icon-bar"></span>
							</a>
							<div class="nav-collapse nav-collapse_  collapse">
								<ul class="nav sf-menu">
									<li class="active"><a href="index.jsp">About</a></li>
									<li class="sub-menu"><a href="#">Products</a>
										<ul>
											<li><a href="fashion.jsp">Fashion</a></li>
											<li><a href="accessories.jsp">Accessories</a></li>
											<li><a href="#">Art Work</a></li>
											<li><a href="#">G - Shop</a></li>
											<li><a href="#">Gallery</a></li>
										</ul>
									</li>
									<li><a href="contact.jsp">Contact</a></li>
									<%
					                 	if(!userLoggedIn){
					                 		out.println("<li class=\"sub-menu\"><a href=\"#\">Login</a>");
					                 			out.println("<ul>");
					                 				out.println("<li><a href=\"login\">Google</a></li>");
					                 			out.println("</ul>");
					                 		out.println("</li>");
					                 	}else{
					                 		out.println("<li class=\"sub-menu\"><a href=\"logout\">Logout</a>");
					               				out.println("<ul>");
					      							out.println("<li><a href=\"userProfile\">"+userName+"</a></li>");
					      							out.println("<li><a href=\"showCart\">Show Cart</a></li>");
												out.println("</ul>");
											out.println("</li>");
					                 	}
					                 %>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</header>
	<div class="bg-content">
		<div class="container">
			<div class="row">
				<div class="span12">
					<!--============================== slider =================================-->
					<div class="flexslider">
						<ul class="slides">
							<li><a href="fashion.html"><img src="img/slide-1.jpg"
									alt="Fashion"></a></li>
							<li><a href="accessories.html"><img
									src="img/slide-2.jpg" alt="Accessories"></a></li>
							<li><a href="artwork.html"><img src="img/slide-3.jpg"
									alt="Art Work"></a></li>
							<li><a href="gshop.html"><img src="img/slide-4.jpg"
									alt="G - Shop"></a></li>
							<li><a href="gallery.html"><img src="img/slide-5.jpg"
									alt="Gallery"></a></li>
						</ul>
					</div>
					<span id="responsiveFlag"></span>
					<div class="block-slogan">
						<h2>Welcome to FAAGG!</h2>
						<div>
							<p>
								<a href="#" class="link-1">FAAGG</a> is an online platform/ramp
								for upcoming & renowned Designers & Artists from different
								verticals to showcase their work or even they can host their
								very own exhibition in FAAG Gallery.
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!--============================== content =================================-->

		<div id="content" class="content-extra">
			<div class="ic">More Website Templates @ osahub.com.
				November19, 2012!</div>
			<!-- Featured Product START -->
			<div class="row-1">
				<div class="container">
					<h3>Featured Products</h3>
					<div class="row">
						<ul class="thumbnails thumbnails-1">
							<li class="span3">
								<div class="thumbnail thumbnail-1">
									<!--<h3>Featured Products</h3> -->
									<img src="img/page1-img1.jpg" alt="">
									<section>
										<strong>Product Name</strong>
										<p>product description and other related details</p>
										<a href="#" class="btn btn-1">Show Details</a>
									</section>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail thumbnail-1">
									<!-- <h3>Nature</h3> -->
									<img src="img/page1-img2.jpg" alt="">
									<section>
										<strong>Product Name</strong>
										<p>product description and other related details</p>
										<a href="#" class="btn btn-1">Show Details</a>
									</section>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail thumbnail-1">
									<!--  <h3>Love story</h3> -->
									<img src="img/page1-img3.jpg" alt="">
									<section>
										<strong>Product Name</strong>
										<p>product description and other related details</p>
										<a href="#" class="btn btn-1">Show Details</a>
									</section>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail thumbnail-1">
									<!--  <h3 class="title-1 extra">Fine art</h3> -->
									<img src="img/page1-img4.jpg" alt="">
									<section>
										<strong>Product Name</strong>
										<p>product description and other related details</p>
										<a href="#" class="btn btn-1">Show Details</a>
									</section>
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- Featured Product END -->
			<!-- 
    <div class="container">
          <div class="row">
        <article class="span6">
              <h3>Shortly about me</h3>
              <div class="wrapper">
            <figure class="img-indent"><img src="img/page1-img5.jpg " alt="" /></figure>
            <div class="inner-1 overflow extra">
                  <div class="txt-1">Sed ut perspictis unde omnis natus error volupatem accusantium doloue laudantium, totam rem.</div>
                  Aperiam, eaque ipsa quae ab illo  veritatis et beatae vitae dicta sunt explicabo nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed
                  <div class="border-horiz"></div>
                  <div class="overflow">
                <ul class="list list-pad">
                      <li><a href="#">Campaigns</a></li>
                      <li><a href="#">Portraits</a></li>
                      <li><a href="#">Fashion</a></li>
                      <li><a href="#">Fine Art</a></li>
                    </ul>
                <ul class="list">
                      <li><a href="#">Advertising</a></li>
                      <li><a href="#">Lifestyle</a></li>
                      <li><a href="#">Love story</a></li>
                      <li><a href="#">Landscapes</a></li>
                    </ul>
              </div>
                </div>
          </div>
            </article>
        <article class="span6">
              <h3>Latest photoshoots</h3>
              <ul class="list-photo">
            <li><a href="img/image-blank.png" class="magnifier" ><img src="img/page1-img6.jpg " alt="" /></a></li>
            <li><a href="img/image-blank.png" class="magnifier" ><img src="img/page1-img7.jpg " alt="" /></a></li>
            <li><a href="img/image-blank.png" class="magnifier" ><img src="img/page1-img8.jpg " alt="" /></a></li>
            <li class="last"><a href="img/image-blank.png" class="magnifier" ><img src="img/page1-img9.jpg " alt="" /></a></li>
            <li><a href="img/image-blank.png" class="magnifier" ><img src="img/page1-img10.jpg " alt="" /></a></li>
            <li><a href="img/image-blank.png" class="magnifier" ><img src="img/page1-img11.jpg " alt="" /></a></li>
            <li><a href="img/image-blank.png" class="magnifier" ><img src="img/page1-img12.jpg " alt="" /></a></li>
            <li class="last"><a href="img/image-blank.png" class="magnifier" ><img src="img/page1-img13.jpg " alt="" /></a></li>
            <li><a href="img/image-blank.png" class="magnifier" ><img src="img/page1-img14.jpg " alt="" /></a></li>
            <li><a href="img/image-blank.png" class="magnifier" ><img src="img/page1-img15.jpg " alt="" /></a></li>
            <li><a href="img/image-blank.png" class="magnifier" ><img src="img/page1-img16.jpg " alt="" /></a></li>
            <li class="last"><a href="img/image-blank.png" class="magnifier" ><img src="img/page1-img17.jpg " alt="" /></a></li>
          </ul>
            </article>
      </div>
        </div>
             -->
		</div>

	</div>

	<!--============================== footer =================================-->
	<footer>
		<div class="container clearfix">
			<ul class="list-social pull-right">
				<li><a class="icon-1" href="#"></a></li>
				<!--<li><a class="icon-2" href="#"></a></li>-->
				<li><a class="icon-3" href="#"></a></li>
				<li><a class="icon-4" href="#"></a></li>
			</ul>
			<!-- <div class="privacy pull-left"> <p>&copy; <a href="#" target="_blank">FAAGG</a> 2014</p></div> -->
			<div class="privacy pull-left">
				Website designed & maintained by <a href="http://www.osahub.com/"
					target="_blank" rel="nofollow">osahub.com</a>
			</div>
		</div>
	</footer>
	<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>