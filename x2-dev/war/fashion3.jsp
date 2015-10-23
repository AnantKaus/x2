
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
<title>Services</title>
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
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/superfish.js"></script>
<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
<script type="text/javascript">if($(window).width()>1024){document.write("<"+"script src='js/jquery.preloader.js'></"+"script>");}	</script>
<script>		
		 jQuery(window).load(function() {	
		 $x = $(window).width();		
	if($x > 1024)
	{			
	jQuery("#content .row").preloader();    }			 
		
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
									<li><a href="index.jsp">About</a></li>
									<li class="active" class="sub-menu"><a href="#">Products</a>
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

		<!--============================== content =================================-->

		<div id="content">
			<div class="ic">More Website Templates @ Osahub.com.
				November19, 2012!</div>
			<div class="container">
				<div class="row">
					<article class="span12">
						<h3>Fashion > Ethinic Wear > Women</h3>
					</article>
					<div class="clear"></div>
					<ul class="thumbnails thumbnails-1 list-services">
						<li class="span4">
							<div class="thumbnail thumbnail-1">
								<img src="img/page2-img1.jpg" alt="">
								<section>
									<a href="collections.jsp?subCategory=11" class="link-1">Lehnga </a>
									<p>Deleniti atque corrupti quos dolores molestias excepturi
										sint occaecati cupiditate nonprovident similique sunt in
										culpa.</p>
								</section>
							</div>
						</li>
						<li class="span4">
							<div class="thumbnail thumbnail-1">
								<img src="img/page2-img3.jpg" alt="">
								<section>
									<a href="collections.jsp?subCategory=11" class="link-1">Saree</a>
									<p>Deleniti atque corrupti quos dolores molestias excepturi
										sint occaecati cupiditate nonprovident similique sunt in
										culpa.</p>
								</section>
							</div>
						</li>
						<li class="span4">
							<div class="thumbnail thumbnail-1">
								<img src="img/page2-img3.jpg" alt="">
								<section>
									<a href="collections.jsp?subCategory=11" class="link-1">Suit</a>
									<p>Deleniti atque corrupti quos dolores molestias excepturi
										sint occaecati cupiditate nonprovident similique sunt in
										culpa.</p>
								</section>
							</div>
						</li>
					</ul>
					<ul class="thumbnails thumbnails-1 list-services">
						<li class="span4">
							<div class="thumbnail thumbnail-1">
								<img src="img/page2-img3.jpg" alt="">
								<section>
									<a href="collections.jsp?subCategory=11" class="link-1">Kurti </a>
									<p>Deleniti atque corrupti quos dolores molestias excepturi
										sint occaecati cupiditate nonprovident similique sunt in
										culpa.</p>
								</section>
							</div>
						</li>
						<li class="span4">
							<div class="thumbnail thumbnail-1">
								<img src="img/page2-img3.jpg" alt="">
								<section>
									<a href="collections.jsp?subCategory=11" class="link-1">Others </a>
									<p>Deleniti atque corrupti quos dolores molestias excepturi
										sint occaecati cupiditate nonprovident similique sunt in
										culpa.</p>
								</section>
							</div>
						</li>
					</ul>
				</div>
			</div>
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
			<div class="privacy pull-left">
				Website designed & maintained by <a href="http://www.osahub.com/"
					target="_blank" rel="nofollow">osahub.com</a>
			</div>
		</div>
	</footer>
	<script type="text/javascript" src="js/bootstrap.js"></script>
</body>
</html>