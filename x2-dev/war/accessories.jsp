
<%
	boolean userLoggedIn = false;
	String userName = "";
	String userEmail = "";

	//fields for login
	userEmail = (String) session.getAttribute("loggedInUserEmail");
	userName = (String) session.getAttribute("loggedInUserName");
	if (userEmail != null && userName != null) {
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
<script type="text/javascript">
	if ($(window).width() > 1024) {
		document.write("<"+"script src='js/jquery.preloader.js'></"+"script>");
	}
</script>
<script>
	jQuery(window).load(function() {
		$x = $(window).width();
		if ($x > 1024) {
			jQuery("#content .row").preloader();
		}

		jQuery('.spinner').animate({
			'opacity' : 0
		}, 1000, 'easeOutCubic', function() {
			jQuery(this).css('display', 'none')
		});
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
											<li><a href="#">Accessories</a></li>
											<li><a href="#">Art Work</a></li>
											<li><a href="#">G - Shop</a></li>
											<li><a href="#">Gallery</a></li>
										</ul></li>
									<li><a href="contact.jsp">Contact</a></li>
									<%
										if (!userLoggedIn) {
											out.println("<li class=\"sub-menu\"><a href=\"#\">Login</a>");
											out.println("<ul>");
											out.println("<li><a href=\"login\">Google</a></li>");
											out.println("</ul>");
											out.println("</li>");
										} else {
											out.println("<li class=\"sub-menu\"><a href=\"logout\">Logout</a>");
											out.println("<ul>");
											out.println("<li><a href=\"userProfile\">" + userName
													+ "</a></li>");
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
					<article class="span2">
						<!-- 
						<h3 class="extra">Search</h3>
						<form id="filter" action="" method="GET" accept-charset="utf-8">
							<h3>ACCESSORIES</h3>
							<ul class="list extra extra1">
								<li><a href="#">All</a></li>
								<li><a href="#">Imitation Jewelary</a></li>
								<li><a href="#">Bridal Sets</a></li>
								<li><a href="#">Hand Bags</a></li>
								<li><a href="#">Side chain</a></li>
								<li><a href="#">Belts</a></li>
								<li><a href="#">Miscellaneous</a></li>
							</ul>

							<div class="clearfix">
								<input type="text" name="s" onBlur="if(this.value=='') this.value=''" onFocus="if(this.value =='' ) this.value=''" >
								<a href="#" onClick="document.getElementById('search').submit()" class="btn btn-1">Apply</a>
			              	<a href="#" onClick="document.getElementById('search').submit()" class="btn btn-1">Cancel</a>
							</div>
						</form> -->
						<div class="accordion" id="accordion2">
							<div class="accordion-group">
								<div class="accordion-heading">
									<a class="accordion-toggle" data-toggle="collapse"
										data-parent="#accordion2" href="#collapseOne"> FASHION </a>
								</div>
								<div id="collapseOne" class="accordion-body collapse in">
									<div class="accordion-inner">Anim pariatur cliche...</div>
								</div>
							</div>
							<div class="accordion-group">
								<div class="accordion-heading">
									<a class="accordion-toggle" data-toggle="collapse"
										data-parent="#accordion2" href="#collapseTwo"> ACCESSORIES
									</a>
								</div>
								<div id="collapseTwo" class="accordion-body collapse">
									<div class="accordion-inner">
										<a href="#">All</a>
									</div>
									<div class="accordion-inner">Imitation Jewelary</div>
									<div class="accordion-inner">Bridal Sets</div>
									<div class="accordion-inner">Hand Bags</div>
									<div class="accordion-inner">Side chain</div>
									<div class="accordion-inner">Belts</div>
									<div class="accordion-inner">Miscellaneous</div>
								</div>
							</div>
						</div>
					</article>
					<article class="span10">
						<!--<h3>Accessories</h3>-->
						<div class="clear"></div>
						<ul class="thumbnails thumbnails-1 list-services">
							<li class="span3">
								<div class="thumbnail thumbnail-1">
									<img src="img/page2-img1.jpg" alt="">
									<section>
										<a href="collections.jsp?subCategory=21" class="link-1">Imitation
											Jewelary</a>
										<p>Deleniti atque corrupti quos dolores molestias
											excepturi sint occaecati cupiditate nonprovident similique
											sunt in culpa.</p>
									</section>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail thumbnail-1">
									<img src="img/page2-img3.jpg" alt="">
									<section>
										<a href="collections.jsp?subCategory=21" class="link-1">Bridal
											Sets</a>
										<p>Deleniti atque corrupti quos dolores molestias
											excepturi sint occaecati cupiditate nonprovident similique
											sunt in culpa.</p>
									</section>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail thumbnail-1">
									<img src="img/page2-img3.jpg" alt="">
									<section>
										<a href="collections.jsp?subCategory=21" class="link-1">Hand
											Bags </a>
										<p>Deleniti atque corrupti quos dolores molestias
											excepturi sint occaecati cupiditate nonprovident similique
											sunt in culpa.</p>
									</section>
								</div>
							</li>
						</ul>
						<ul class="thumbnails thumbnails-1 list-services">
							<li class="span3">
								<div class="thumbnail thumbnail-1">
									<img src="img/page2-img1.jpg" alt="">
									<section>
										<a href="collections.jsp?subCategory=21" class="link-1">Side
											chain </a>
										<p>Deleniti atque corrupti quos dolores molestias
											excepturi sint occaecati cupiditate nonprovident similique
											sunt in culpa.</p>
									</section>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail thumbnail-1">
									<img src="img/page2-img3.jpg" alt="">
									<section>
										<a href="collections.jsp?subCategory=21" class="link-1">Belts
										</a>
										<p>Deleniti atque corrupti quos dolores molestias
											excepturi sint occaecati cupiditate nonprovident similique
											sunt in culpa.</p>
									</section>
								</div>
							</li>
							<li class="span3">
								<div class="thumbnail thumbnail-1">
									<img src="img/page2-img3.jpg" alt="">
									<section>
										<a href="collections.jsp?subCategory=21" class="link-1">Miscellaneous
										</a>
										<p>Deleniti atque corrupti quos dolores molestias
											excepturi sint occaecati cupiditate nonprovident similique
											sunt in culpa.</p>
									</section>
								</div>
							</li>
						</ul>
					</article>
				</div>
				<div class='row'>
					<!-- Button to trigger modal -->
					<a href="#myModal" role="button" class="btn" data-toggle="modal">Launch demo modal</a>
									
					<div class="modal" id="myModal" tabindex="-1" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">×</button>
							<h3 id="myModalLabel">Modal header</h3>
						</div>
						<div class="modal-body">
							<p>One fine body…</p>
						</div>
						<div class="modal-footer">
							<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
							<button class="btn btn-primary">Save changes</button>
						</div>
					</div>
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
	<!--============================== modals =================================-->


	<!--============================== scripts =================================-->
	<script type="text/javascript" src="js/bootstrap.js"></script>
	<script type="text/javascript" src="assets/js/bootstrap-modal.js"></script>
	<script>
		$(function() {
			$(".collapse").collapse();
		});
	</script>
	<script>
		$('#myModal').modal({
			show: false
			keyboard: true
		});
	</script>
</body>
</html>