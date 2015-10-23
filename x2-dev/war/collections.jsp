
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
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.osahub.ecomm.dao.shop.ProductDao"%>
<%@ page import="java.util.List"%>
<%@ page import="com.osahub.ecomm.bean.product.ProductBackingBean"%>
<%@ page import="com.osahub.ecomm.bean.search.SearchBackingBean"%>
<%@ page import="com.google.appengine.api.images.ImagesService"%>
<%@ page import="com.google.appengine.api.images.ImagesServiceFactory"%>
<%@ page import="com.google.appengine.api.blobstore.BlobKey"%>

<%
	String productSubCategory =  null;	
	ProductBackingBean bean = null;
	List<ProductDao> products = null;
	boolean showProductCategories = true;
	
	try{
		productSubCategory =  request.getParameter("subCategory").trim();
		int temp = Integer.parseInt(productSubCategory);
	 
		if( productSubCategory != null && productSubCategory.length() == 2){
			bean = new ProductBackingBean();
			showProductCategories = false;
			products = bean.SearchProductBySubCategory(productSubCategory);
		}
		
		if(products==null)
			showProductCategories = false;
		else
			showProductCategories = true;
			
	}catch(Exception e){
		showProductCategories = false;
	}
%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Folio</title>
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
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300'
	rel='stylesheet' type='text/css'>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/superfish.js"></script>
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
		<!--============================== content =================================-->
		<div id="content">
			<div class="container">
				<div class="row">
					<article class="span3">
						<!--<h3 class="extra">Search</h3>-->
						<form id="filter" action="" method="GET" accept-charset="utf-8">
							<h3>Filter by Gender</h3>
							<ul class="list extra extra1">
								<li><a href="#">Male</a></li>
								<li><a href="#">Female</a></li>
							</ul>
							<h3>Filter by Price</h3>
							<ul class="list extra extra1">
								<li><input id="" type="range" min="1" max="100000"
									value="25" step="5"></li> 1000....10000....50000....100000
								<li><a href="#">Suscipit lobortis nisl ut aliquip</a></li>
								<li><a href="#">Commodo consequat</a></li>
							</ul>
							<h3>Filter by Age</h3>
							<div class="wrapper">
								<ul class="list extra2 list-pad ">
									<li><a href="#">November 2012</a></li>
									<li><a href="#">October 2012</a></li>
									<li><a href="#">September 2012</a></li>
									<li><a href="#">August 2012</a></li>
								</ul>
							</div>
							<div class="clearfix">
								<!-- <input type="text" name="s" onBlur="if(this.value=='') this.value=''" onFocus="if(this.value =='' ) this.value=''" > -->
								<a href="#" onClick="document.getElementById('search').submit()"
									class="btn btn-1">Apply</a> <a href="#"
									onClick="document.getElementById('search').submit()"
									class="btn btn-1">Cancel</a>
							</div>
						</form>
					</article>
					<article class="span9">
						<%
			        if(showProductCategories)
						out.println("<h3>"+bean.getSubCategoryName(Integer.parseInt(productSubCategory))+"</h3>");
					else
						out.println("Error Occured! <a href=\"index.html\">Click Here to go back</a> redirect to 404 page");
%>
						<div class="clear"></div>
						<ul class="portfolio clearfix">
							<%
					if(showProductCategories)
					{
						ImagesService imagesService = ImagesServiceFactory.getImagesService();
						for(ProductDao product : products ){
							BlobKey blobky1 = product.image1;
							String image1 = imagesService.getServingUrl(product.image1);
							image1=image1+"=s280";
							out.println("<li class=\"box\"><a href=\"showProduct.jsp?productCode="+product.productCode+"\" ><img alt=\"\" src=\""+image1+"\"></a></li>");
							//out.println("<li class=\"box\"><a href=\"showProduct.jsp?productCode="+product.productCode+"\" class=\"magnifier\"><img alt=\"\" src=\""+image1+"\"></a></li>");
						}
					} else {
						out.println("Invalid Category");
					}
%>
						</ul>
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