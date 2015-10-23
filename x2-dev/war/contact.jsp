
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
<title>Contact</title>
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
<script src="js/forms.js"></script>
<script>		
   jQuery(window).load(function() {	
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
									<li ><a href="index.jsp">About</a></li>
									<li class="sub-menu"><a href="#">Products</a>
										<ul>
											<li><a href="fashion.jsp">Fashion</a></li>
											<li><a href="accessories.jsp">Accessories</a></li>
											<li><a href="#">Art Work</a></li>
											<li><a href="#">G - Shop</a></li>
											<li><a href="#">Gallery</a></li>
										</ul>
									</li>
									<li  class="active"><a href="#">Contact</a></li>
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
					<article class="span8">
						<h3>Contact us</h3>
						<div class="inner-1">
							<form id="contact-form">
								<div class="success">
									Contact form submitted! <strong>We will be in touch
										soon.</strong>
								</div>
								<fieldset>
									<div>
										<label class="name"> <input type="text"
											value="Your name"> <br> <span class="error">*This
												is not a valid name.</span> <span class="empty">*This field
												is required.</span>
										</label>
									</div>
									<div>
										<label class="phone"> <input type="tel"
											value="Telephone"> <br> <span class="error">*This
												is not a valid phone number.</span> <span class="empty">*This
												field is required.</span>
										</label>
									</div>
									<div>
										<label class="email"> <input type="email"
											value="Email"> <br> <span class="error">*This
												is not a valid email address.</span> <span class="empty">*This
												field is required.</span>
										</label>
									</div>
									<div>
										<label class="message"> <textarea>Message</textarea> <br>
											<span class="error">*The message is too short.</span> <span
											class="empty">*This field is required.</span>
										</label>
									</div>
									<div class="buttons-wrapper">
										<a class="btn btn-1" data-type="reset">Clear</a> <a
											class="btn btn-1" data-type="submit">Send</a>
									</div>
								</fieldset>
							</form>
							
						</div>
					</article>
					<article class="span4">
						<h3>Contact info</h3>
						<div class="map">
							<iframe
								src="http://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=Brooklyn,+New+York,+NY,+United+States&amp;aq=0&amp;sll=37.0625,-95.677068&amp;sspn=61.282355,146.513672&amp;ie=UTF8&amp;hq=&amp;hnear=Brooklyn,+Kings,+New+York&amp;ll=40.649974,-73.950005&amp;spn=0.01628,0.025663&amp;z=14&amp;iwloc=A&amp;output=embed">
							</iframe>
						</div>
						<address class="address-1">
							<strong>Grewis<br> 8901 Marmora Road<br>
								Glasgow, D04 89GR.
							</strong>
							<div class="overflow">
								<span>Freephone:</span>+1 800 559 6580<br> <span>Telephone:</span>+1
								800 603 6035<br> <span>FAX:</span>+1 800 889 9898 <br>
								<span>E-mail:</span> <a href="#" class="mail-1">mail@demolink.org</a><br>
								<span>Skype:</span> <a href="#" class="mail-1">@skypename</a>
							</div>
						</address>
					</article>
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