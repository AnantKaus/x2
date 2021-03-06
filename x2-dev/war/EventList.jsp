
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
<%@ page import= "java.text.DateFormatSymbols"%>
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
	
			bean = new ProductBackingBean();
			showProductCategories = false;
			products = bean.SearchProductBySubCategory(productSubCategory);
		
		
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
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>X2 Entertainments</title>

        <!-- Bootstrap -->
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- custom css -->
        <link href="css/style.css" rel="stylesheet" type="text/css" media="screen">
        <!-- font awesome for icons -->
        <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
        <!-- <link href="font-awesome-4.1.0/css/font-awesome.min.css" rel="stylesheet"> -->
        <!--flex slider-->
        <link href="css/flexslider.css" rel="stylesheet" type="text/css" media="screen">
        <!-- animated css  -->
        <link href="css/animate.css" rel="stylesheet" type="text/css" media="screen">
        <!--web fonts-->      
        <link href='http://fonts.googleapis.com/css?family=Roboto+Slab:400,300,100,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>

        <!--owl carousel css-->
        <link href="css/owl.carousel.css" rel="stylesheet" type="text/css" media="screen">
        <link href="css/owl.theme.css" rel="stylesheet" type="text/css" media="screen">
        <!--popups css-->
        <link href="css/magnific-popup.css" rel="stylesheet" type="text/css">
        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
          <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
          <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->


    </head>
    <body data-spy="scroll" data-offset="80">


        <section id="navigation">
            <div class="navbar  navbar-inverse navbar-fixed-top navbar-trans" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="index.html">X2 Entertainments</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li><a href="index.html#home">Home</a></li>
                            <li><a href="index.html#about">About</a></li>
                            <li ><a href="index.html#services">Services</a></li>
                            <li class="active"><a href="EventList.html">Work</a></li>
                            <li><a href="index.html#contact">Contact</a></li>
                        </ul>
                    </div><!--/.nav-collapse -->
                </div><!--/.container -->
            </div><!--navbar-default-->
        </section><!--navigation section end here-->
        <section id="home" data-stellar-background-ratio="0.5">
            <div class="parallax-overlay"></div> 
            <div class="home-content text-center">
                <div class="container">
                    <div class="blog-intro-text bg-heading">
                        <h5>Welcome to our WORK</h5>
                        <div class="center-heading text-center">
                            <h2>Our Portfolio</h2>
                            <span class="icon"><i class="fa fa-bars"></i></span> 
                        </div><!--center heading-->
                        <!-- <div class=" text-center">
                            <p><a href="blog.html#blog-wrapper" class="btn btn-lg btn-border-white">Read our blog </a></p>
                        </div> -->
                    </div>
                </div>
            </div>
        </section><!--blog intro section end-->  
        <div class="divided-50"></div>
        <section id="blog-wrapper" class="section-padding">
            <div class="container">
                <div class="row">
                    <div class="col-sm-12">
<%
					if(showProductCategories)
					{
						ImagesService imagesService = ImagesServiceFactory.getImagesService();
						for(ProductDao product : products ){
							BlobKey blobky1 = product.image1;
							String image1 = imagesService.getServingUrl(product.image1);
							//image1=image1+"=s280";

%>
	                        <div class="blog-post-wrap">
	                            <div class="row">
	                                <div class="col-sm-2 margin-btm-30 hidden-xs">
	                                    <div class="post-date   text-right">
	                                        <h2> <%=product.createdOn.substring(0, 2) %></h2>
	                                        <span> <%=new DateFormatSymbols().getMonths()[Integer.parseInt(product.createdOn.substring(3, 5))]+" "+ product.createdOn.substring(6)%></span>
	                                    </div>
	                                    <%-- <%= product.createdOn.getDate() %>
	                                    <%= product.createdOn.getMonth()+1 %>
	                                    <%= product.createdOn.getYear() %>
	                                     --%>
	                                    <div class="post-left-info">
	                                        <p><i class="fa fa-tag"></i> <a href="#"><%=product.category %></a></p>
	                                    </div>
	                                </div>
	                                <div class="col-sm-10">
	                                    <div class="blog-post-info">
	                                        <a href="EventList.jsp">
	                                            <img src="<%=image1 %>" class="img-responsive" alt="">
	                                        </a>
	                                        <h3><a href="EventList.jsp"><%=product.name %></a></h3>
	                                        <p class="text-left">
	                                            <a href="event.jsp?id=<%=product.productCode%>" class="btn btn-dark btn-sm">
	                                                Read more
	                                            </a>
	                                        </p>
	                                    </div>
	                                </div>
	                            </div>
	                        </div><%
							//out.println("<li class=\"box\"><a href=\"showProduct.jsp?productCode="+product.productCode+"\" ><img alt=\"\" src=\""+image1+"\"></a></li>");
							//out.println("<li class=\"box\"><a href=\"showProduct.jsp?productCode="+product.productCode+"\" class=\"magnifier\"><img alt=\"\" src=\""+image1+"\"></a></li>");
						}
					} else {
						out.println("Error Occured! <a href=\"index.html\">Click Here to go back</a> redirect to 404 page");
					}
%>

                     <!--    <div class="blog-post-wrap">
                            <div class="row">
                                <div class="col-sm-2 margin-btm-30 hidden-xs">
                                    <div class="post-date   text-right">
                                        <h2>27</h2>
                                        <span>Aug 2014</span>
                                    </div>
                                    <div class="post-left-info">
                                        <p><i class="fa fa-tag"></i> <a href="#">Category</a></p>
                                        <p><i class="fa fa-comment"></i> <a href="#">3 Views</a></p>
                                    </div>
                                </div>
                                <div class="col-sm-10">
                                    <div class="blog-post-info">
                                        <a href="blog.html#">
                                            <img src="img/blog-1.jpg" class="img-responsive" alt="">
                                        </a>
                                        <h3><a href="event.html#">Reading news in free time</a></h3>
                                        <p class="text-left">
                                            <a href="event.html" class="btn btn-dark btn-sm">
                                                Read more
                                            </a>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div> -->



                    </div>
                </div>
            </div>
        </section><!--blog wrapper-->
        <footer id="footer">
            <div class="container text-center">
                <a href="index.html" class="to-top">X2 Entertainments</a>
               <span>&copy; 2014. Maintained by <a target="_blank" href="http://www.osahub.com">OSAHUB</a> </span>
            </div>
        </footer>
        <!--scripts and plugins -->
        <!--must need plugin jquery-->
        <script src="js/jquery.min.js"></script>        
        <!--bootstrap js plugin-->
        <script src="bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <!--easing plugin for smooth scroll-->
        <script src="js/jquery.easing.1.3.min.js" type="text/javascript"></script>
        <script src="http://designmylife.co.in/quick/quick-trans-nav/js/jquery.sticky.js" type="text/javascript"></script>
        <!--digit countdown plugin-->
        <script src="http://cdnjs.cloudflare.com/ajax/libs/waypoints/2.0.3/waypoints.min.js"></script>
        <!--digit countdown plugin-->
        <script src="js/jquery.counterup.min.js" type="text/javascript"></script>
        <!--on scroll animation-->
        <script src="js/wow.min.js" type="text/javascript"></script> 
        <script src="js/jquery.flexslider-min.js" type="text/javascript"></script>
        <script src="js/jquery.mixitup.min.js" type="text/javascript"></script>
        <script src="js/jquery.stellar.min.js" type="text/javascript"></script>
        <!--owl carousel slider-->
        <script src="js/owl.carousel.min.js" type="text/javascript"></script>
        <!--popup js-->
        <script src="js/jquery.magnific-popup.min.js" type="text/javascript"></script>
        <!--customizable plugin edit according to your needs-->
        <script src="js/custom.js" type="text/javascript"></script>
    </body>
</html>
