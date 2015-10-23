<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.osahub.ecomm.dao.shop.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.osahub.ecomm.bean.product.ProductBackingBean" %>
<%@ page import="com.osahub.ecomm.bean.search.SearchBackingBean" %>
<%@ page import="com.google.appengine.api.images.ImagesService" %>
<%@ page import="com.google.appengine.api.images.ImagesServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobKey" %>

<%
	String productSubCategory =  null;	
	ProductBackingBean bean = null;
	List<ProductDao> products = null;
	boolean showProductCategories = true;
	try{
		String productCategory="";
		productSubCategory =  request.getParameter("category").trim();
		int temp = Integer.parseInt(""/* productCategory */);
	 
		if( productCategory != null && productCategory.length() == 1){
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Swati Designer Wear | Collections</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.vticker-min.js"></script>
<script type="text/javascript">
$(function(){
	$('#news-container').vTicker({ 
		speed: 500,
		pause: 3000,
		animation: 'fade',
		mousePause: false,
		showItems: 1
	});
});
</script>

<!----------------Verticalmenu Code Start--------------->
<link rel="stylesheet" type="text/css" href="css/cssverticalmenu.css" />
<script type="text/javascript" src="js/cssverticalmenu.js"></script>
<!----------------Verticalmenu Code End--------------->

<!--[if lte IE 6]>
	<script type="text/javascript" src="supersleight-min.js"></script>
<![endif]-->

<!--[if IE]>
 <style type="text/css">
  body {word-wrap: break-word;}
 </style>
<![endif]-->

<script language="javascript" type="text/javascript">
        function loadImages()
         {
            if (document.getElementById)
            {  // DOM3 = IE5, NS6
                document.getElementById('loading').style.visibility = 'hidden';
            }
            else
            {
                if (document.layers) 
                {  // Netscape 4
                    document.hidepage.visibility = 'hidden';
                }
                else 
                {  // IE 4
                    document.all.hidepage.style.visibility = 'hidden';
                }
            }
        }
    </script>
</head>

<body onLoad="loadImages()">
<div id="loading" style=" position:fixed; width:50%; top:50%; left:50%px; text-align:right; z-index:0;"><img src="loading.gif"  border="0" /></div>
<div class="wrapper">
<!---------------Main Area ------------------>
<div class="mainarea">

<!---------------Left Area ------------------>
<div class="leftarea">
	<div class="logoarea"></div>
    <div class="menuarea">
            <ul id="verticalmenu" class="glossymenu">
            <li><a href="index.jsp">home</a></li>
            <li><a href="about.html">about us</a></li>
            <li><a href="#">collections</a>
                <ul>
                 <li><a href="collections.jsp?category=1">Sarees</a></li>
                 <li><a href="collections.jsp?category=2">Lehenga</a></li>
                 <li><a href="collections.jsp?category=3">Suits</a></li>
                 <li><a href="collections.jsp?category=4">Anarkali</a></li>
                   <li><a href="collections.jsp?category=5">Kurtis & Tunics</a></li>
                </ul>
            </li>
            <li><a href="contact.html">contact us</a></li>
           
            </ul>
    </div>
</div>
<!---------------Left Area End -------------->
<!---------------Mid Area ------------------->
<div class="inner_rightarea">
	<div class="closebtn"><a href="index.jsp"><img src="images/close_btn.jpg"/ ></a></div>
    <div class="title">&nbsp;&nbsp;&nbsp;&nbsp;
<%	if(showProductCategories)
		out.println(bean.getCategoryName(Integer.parseInt(""/* productCategory */)));
	else
		out.println("Error Occured! <a href=\"index.jsp\">Click Here to go back</a>");
%> </div>
    <div class="galleryarea">
		<ul id="slideshow">
<%
	if(showProductCategories)
	{
		ImagesService imagesService = ImagesServiceFactory.getImagesService();
		for(ProductDao product : products ){
			BlobKey blobky1 = product.image1;
			String image1 = imagesService.getServingUrl(product.image1);
			image1=image1+"=s480";
			//out.println("<a href=\"showProduct.jsp?productCode="+product.productCode+"\">"+product.name+"</a>");
        	out.println("<li>");
				//out.println("<h3>"+product.name+"</h3>");
				out.println("<h3></h3>");
            	out.println("<a href=\"showProduct.jsp?productCode="+product.productCode+"\"><img src=\""+image1+"\"  /></a>");
            	out.println("<span >"+image1+"</span>");
            	out.println("<p><a href=\"showProduct.jsp?productCode="+product.productCode+"\"><img src=\"images/details.png\"/ ></a></p>");
			out.println("</li>");
		}
	} else {
		out.println("Invalid Category");
		out.println("<br/>");
	}
%>
	</ul>
<div id="wrapper">
		<div id="fullsize">
			<div id="imgprev" class="imgnav" title="Previous Image"></div>
			<div id="imglink"></div>
			<div id="imgnext" class="imgnav" title="Next Image"></div>
			<div id="image"></div>
			<div id="information">
				<h3></h3>
				<p></p>
			</div>
		</div>
		<div id="thumbnails">
			<div id="slideleft" title="Slide Left"></div>
			<div id="slidearea">
				<div id="slider"></div>
			</div>
			<div id="slideright" title="Slide Right"></div>
		</div>
	</div>
<script type="text/javascript" src="js/compressed.js"></script>
<script type="text/javascript" src="js/script.js"></script>
<script type="text/javascript">
	$('slideshow').style.display='none';
	$('wrapper').style.display='block';
	var slideshow=new TINY.slideshow("slideshow");
	window.onload=function(){
		slideshow.auto=true;
		slideshow.speed=5;
		slideshow.link="linkhover";
		slideshow.info="information";
		slideshow.thumbs="slider";
		slideshow.left="slideleft";
		slideshow.right="slideright";
		slideshow.scrollSpeed=4;
		slideshow.spacing=5;
		slideshow.active="#fff";
		slideshow.init("slideshow","image","imgprev","imgnext","imglink");
	}
</script></div>

</div>
<!---------------Right Area ----------------->
</div>
<!---------------Main Area End -------------->
<div class="footerarea">&nbsp;&nbsp;&copy;2013 swati | Connect using <a href="http://www.facebook.com/swaticreators" target="_blank" style="margin:0px 5px 0px 5px; display:inline-block; vertical-align:bottom;" title="facebook"><img src="images/facebook.png"  alt="Facebook"/></a> <!-- <a href="http://www.twitter.com" target="_blank" style="margin:0px 5px 0px 5px; display:inline-block; vertical-align:bottom;" title="twitter"><img src="images/twitter.png"  alt="Twitter"/></a>--> <a href="https://plus.google.com/107813831077998688087/posts" target="_blank" style="margin:0px 5px 0px 5px; display:inline-block; vertical-align:bottom;" title="google"><img src="images/google.png" alt="Google+"></img></a> <a href="http://instagram.com/swatidesignerwear" target="_blank" style="margin:0px 5px 0px 5px; display:inline-block; vertical-align:bottom;" title="instagram"><img src="images/instagram.png" alt="Instagram"></img></a>| Reach us at +91-9899464849, 9810620905  | Site Maintained By <a href="http://www.osahub.com/" target="_blank">osahub.com</a>&nbsp;
</div>
</div>
</body>
</html>
