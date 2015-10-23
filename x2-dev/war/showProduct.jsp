<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.osahub.ecomm.dao.shop.ProductDao"%>
<%@ page import="java.util.List"%>
<%@ page import="com.osahub.ecomm.bean.search.SearchBackingBean"%>
<%@ page import="com.google.appengine.api.images.ImagesService"%>
<%@ page import="com.google.appengine.api.images.ImagesServiceFactory"%>
<%@ page import="com.google.appengine.api.blobstore.BlobKey"%>
<%@ page import="com.osahub.ecomm.bean.product.ProductBackingBean"%>
<%
	boolean invalidProductCode = false;
	ProductDao product = null;	
	ProductBackingBean productBean = null;
	boolean showProduct = false;
	String productCode = "";
	try{
	productCode =  request.getParameter("productCode").trim();
	 
	if( productCode != null && productCode.length() ==8){
		productBean = new ProductBackingBean();
		SearchBackingBean bean = new SearchBackingBean();
		
		product = bean.SearchProductById(productCode);
		if(product != null)
			showProduct = true;
		else
			invalidProductCode = true;
	}else
		invalidProductCode = true;	
	
	
	}catch(Exception exn){
		invalidProductCode = true;	
	}	


	//fields for show interest section
	String interest = null;
	interest = (String)session.getAttribute("interestedStatus");
	session.setAttribute("interestedStatus", null);
	boolean showInterestedPanel = true;
	boolean errorWhileShowingInterest = true;
	if(interest!=null){
		showInterestedPanel = false;
		if(interest.equalsIgnoreCase("success"))
			errorWhileShowingInterest = false;
	}
	
	//field to check logged in user
	boolean userLoggedIn = false;
	String userName = "";
	String userEmail= "";
	String interestedUserEmail= "";
	
	//fields for login
	userEmail = (String)session.getAttribute("loggedInUserEmail");
	userName = (String)session.getAttribute("loggedInUserName");
	if(userEmail!=null && userName!=null){
		userLoggedIn = true;
		interestedUserEmail = userEmail;
	}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>FAAGG : Product Detail</title>

<!----------------Hover zoom over product start--------------->
<link href="css/stylez.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/prefixfree.js"></script>
<script type="text/javascript" src="js/jquery-1.7.1.min.js"></script>

<script>
	$(document).ready(function(){

	var native_width = 0;
	var native_height = 0;

	//Now the mousemove function
	$(".magnify").mousemove(function(e){
		//When the user hovers on the image, the script will first calculate
		//the native dimensions if they don't exist. Only after the native dimensions
		//are available, the script will show the zoomed version.
		if(!native_width && !native_height)
		{
			//This will create a new image object with the same image as that in .small
			//We cannot directly get the dimensions from .small because of the 
			//width specified to 200px in the html. To get the actual dimensions we have
			//created this image object.
			var image_object = new Image();
			image_object.src = $(".small").attr("src");
			
			//This code is wrapped in the .load function which is important.
			//width and height of the object would return 0 if accessed before 
			//the image gets loaded.
			native_width = image_object.width;
			native_height = image_object.height;
		}
		else
		{
			//x/y coordinates of the mouse
			//This is the position of .magnify with respect to the document.
			var magnify_offset = $(this).offset();
			//We will deduct the positions of .magnify from the mouse positions with
			//respect to the document to get the mouse positions with respect to the 
			//container(.magnify)
			var mx = e.pageX - magnify_offset.left;
			var my = e.pageY - magnify_offset.top;
			
			//Finally the code to fade out the glass if the mouse is outside the container
			if(mx < $(this).width() && my < $(this).height() && mx > 0 && my > 0)
			{
				$(".large").fadeIn(100);
			}
			else
			{
				$(".large").fadeOut(100);
			}
			if($(".large").is(":visible"))
			{
				//The background position of .large will be changed according to the position
				//of the mouse over the .small image. So we will get the ratio of the pixel
				//under the mouse pointer with respect to the image and use that to position the 
				//large image inside the magnifying glass
				var rx = Math.round(mx/$(".small").width()*native_width - $(".large").width()/2)*-1;
				var ry = Math.round(my/$(".small").height()*native_height - $(".large").height()/2)*-1;
				var bgp = rx + "px " + ry + "px";
				
				//Time to move the magnifying glass with the mouse
				var px = mx - $(".large").width()/2;
				var py = my - $(".large").height()/2;
				//Now the glass moves with the mouse
				//The logic is to deduct half of the glass's width and height from the 
				//mouse coordinates to place it with its center at the mouse coordinates
				
				//If you hover on the image now, you should see the magnifying glass in action
				$(".large").css({left: px, top: py, backgroundPosition: bgp});
			}
		}
	})
})
	</script>

<!----------------Hover zoom over product end--------------->


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
	jQuery("#content .row").preloader();}	
	
	jQuery(".list-blog li:last-child").addClass("last"); 
	jQuery(".list li:last-child").addClass("last"); 

	
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
			<div class="ic">More Website Templates @ Osahub.com.
				November19, 2012!</div>
			<div class="container">
				<div class="row">
					<article class="span6">
						<div class="inner-1">
							<ul class="list-blog">
								<li>
									<!-- <div class="name-author"><a href="index.html">Home</a></div> -->
									<div class="name-author">Home</div> <%
			if(!showProduct)
				out.println("Error Occurred ! redirect to 404 page");
			else{
				//out.println("<div class=\"name-author\"><a href=\"#\">>"+product.category+"</a></div>");
				//out.println("<div class=\"name-author\"><a href=\"#\">>"+product.subCategory+"</a></div>");
				out.println("<div class=\"name-author\">> "+productBean.getCategoryName(Integer.parseInt(product.category))+"</div>");
			
				out.println("<div class=\"clear\"></div> ");
				//out.println("<h3>"+product.productCode+"</h3>");
				out.println("<div class=\"clear\"></div>  ");
				
	        	ImagesService imagesService = ImagesServiceFactory.getImagesService();
	        	BlobKey blobky1 = product.image1;
	        	String image1 = imagesService.getServingUrl(product.image1);
        		String url = "http://127.0.0.1:8888/serve?blob-key=" + product.image1.getKeyString();
        		//String url = "http://dev.faagg.com/serve?blob-key=" + product.image1.getKeyString();
        		
        		
	        	out.println("<div class=\"magnify\">");
					out.println("<div class=\"large\" style=\"background:url("+url+")  no-repeat\"></div>");
					out.println("<img class=\"small\" src=\""+url+"\" width=\"100%\"/>");
				out.println("</div>");
        		
				//out.println("<p>"+product.description+"</p>");
	           /*
	           *<time datetime="2012-11-09" class="date-1">9.11.2012</time>
	           *<div class="name-author">by <a href="#">Admin</a></div>
	           *<a href="#" class="comments">11 comments</a>
	           */
			}
%>



								</li>

							</ul>
						</div>
					</article>
					<article class="span6">
						<h3 class="extra">Description</h3>
						<ul class="list extra extra1">
							<li>Product Code : <%=product.productCode%></li>
							<li>Name : <%=product.name%></li>
							<li>Description : <%=product.description%></li>
						
						</ul>

						<h3>Buy NOW!</h3>
						<form id="addToCart" action="addToCart" method="POST"
							accept-charset="utf-8">
							<div class="clearfix">
								<input name="productCode" value="<%=productCode %>"
									type="hidden" /> <a href="#"
									onClick="document.getElementById('addToCart').submit()"
									class="btn btn-1">Add to Cart</a>
							</div>
						</form>

						<h3>Instant Query</h3>
						<%
			if(showInterestedPanel){
    			//out.println("<div class=\"showInterest\">");
    			out.println("Enter your Email/Contact No. to enquire about this product");
				out.println("<div id=\"showInterest-container\">");
				out.println("<form  name=\"search\" id=\"search\" accept-charset=\"utf-8\"  action=\"showInterest\" method=\"post\">");
       			out.println("<div class=\"clearfix\">");
        		out.println("<input name=\"customer\"  type=\"text\" value=\""+interestedUserEmail+"\" maxlength=\"50\" />");
        		out.println("<input name=\"productCode\" value=\""+productCode+"\" type=\"hidden\"  />");
				out.println("<a href=\"#\" onClick=\"document.getElementById('search').submit()\" class=\"btn btn-1\">Submit</a> </div>");
        		//out.println("<input name=\"submit\" id=\"submit\" type=\"image\" src=\"images/submit1.png\" onclick=\"this.form.submit();\"/>");
				out.println("</div>");
       			out.println("</form>");
			}else{
			    out.println("<div class=\"showInterestMessage\">");
    			if(errorWhileShowingInterest)
    				out.println("Please enter a valid email id. <a href=\"/showProduct.jsp?productCode="+productCode+"\">Click Here</a> to try again.");
    			else
    				out.println("We have received your response. One of our representative will contact you soon.");
			} 
%>

						<!--  <form id="search" name="showInterestForm" action="showInterest" method="POST" >
            <div class="clearfix">
              <input type="text" name="customer"  maxlength="50" onBlur="if(this.value=='') this.value=''" onFocus="if(this.value =='' ) this.value=''" >
              <a href="#" onClick="document.getElementById('search').submit()" class="btn btn-1">Search</a>
            </div>
          </form>
          
          <h3>Archive</h3>
         <div class="wrapper">
          <ul class="list extra2 list-pad ">
            <li><a href="#">November 2012</a></li>
            <li><a href="#">October 2012</a></li>
            <li><a href="#">September 2012</a></li>
            <li><a href="#">August 2012</a></li>
            <li><a href="#">July 2012</a></li>
            <li><a href="#">June 2012</a></li>
          </ul>
            <ul class="list extra2">
            <li><a href="#">May 2012</a></li>
            <li><a href="#">April 2012</a></li>
            <li><a href="#">March 2012</a></li>
            <li><a href="#">February 2012</a></li>
            <li><a href="#">January 2012</a></li>
            <li><a href="#">December 2011</a></li>
          </ul>
          </div>
           -->
					</article>
				</div>
			</div>
			<!-- to give gap -->
			<div class="block-slogan"></div>
			<!-- Related Product START -->
			<div class="row-1">
				<div class="container">
					<h3>Related Products</h3>
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
			<!-- Related Product END -->
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