<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.osahub.ecomm.dao.shop.ProductDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.osahub.ecomm.bean.search.SearchBackingBean" %>
<%@ page import="com.google.appengine.api.images.ImagesService" %>
<%@ page import="com.google.appengine.api.images.ImagesServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobKey" %>

<%
	boolean invalidProductCode = false;
	ProductDao product = null;
	boolean showProduct = false;
	String productCode = "";
	try{
	productCode =  request.getParameter("productCode").trim();
	 
	if( productCode != null && productCode.length() ==8){
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
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>SWATI DESIGNER WEAR : <%if(showProduct)out.println(product.name);%></title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />

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

<!----------------Verticalmenu Code Start--------------->
<link rel="stylesheet" type="text/css" href="css/cssverticalmenu.css" />
<script type="text/javascript" src="js/cssverticalmenu.js"></script>
<!----------------Verticalmenu Code End--------------->
<!----------------Flexscroll Code Start--------------->
<link href="css/tutorsty.css" rel="stylesheet" type="text/css" />
<link href="css/flexcrollstyles.css" rel="stylesheet" type="text/css" />
<script type='text/javascript' src="js/flexcroll.js"></script>
	<script src='javascripts/imageZoom/jquery-1.8.3.min.js'></script>
<!----------------Flexscroll Code End----------------->
	<script src='javascripts/imageZoom/jquery.elevatezoom.js'></script>

<!--[if lte IE 6]>
	<script type="text/javascript" src="supersleight-min.js"></script>
<![endif]-->

<!--[if IE]>
 <style type="text/css">
  body {word-wrap: break-word;}
 </style>
<![endif]-->
</head>

<body>
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
<%	if(showProduct){
		out.println("<a href=\"collections.jsp?category="+product.category+"\"><img src=\"images/goback.png\"/ ></a>");
	}else
		out.println("Error Occurred !");
%>
    	
    </div>
    <div class="textarea2">
    <div id='mycustomscroll' class='flexcroll'>   
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
		<tr >
        <td >  		<%
		if(showProduct){
			if(product.image1 != null){
	        	ImagesService imagesService = ImagesServiceFactory.getImagesService();
	        	BlobKey blobky1 = product.image1;
	        	String image1 = imagesService.getServingUrl(product.image1);
	        	//out.println("<img id=\"zoom_01\" alt=\"product_image\" width=\"250px\" src=\""+image1+"\" data-zoom-image=\""+"http://admin.swatidesignerwear.com/serve?blob-key=" + product.image1.getKeyString()+"\" />");
				//out.println("<img style=\"z-index:1;\" id=\"zoom_01\" alt=\"product_image\" width=\"250px\" src=\""+image1+"\" data-zoom-image=\""+"http://127.0.0.1:8888/serve?blob-key=" + product.image1.getKeyString()+"\" />");

	        	out.println("<div class=\"magnify\">");
	        		//String url = "http://127.0.0.1:8888/serve?blob-key=" + product.image1.getKeyString();
	        		//String url = "http://admin.swatidesignerwear.com/serve?blob-key=" + product.image1.getKeyString();
	        		String url = "http://swatidesignerwear.com/serve?blob-key=" + product.image1.getKeyString();
					out.println("<div class=\"large\" style=\"background:url("+url+")  no-repeat\"></div>");
					out.println("<img class=\"small\" src=\""+url+"\" width=\"250\"/>");
				out.println("</div>");
			}
		}
			%>
        </td>
        <td style=" vertical-align:top;">
<%if(showProduct){
			out.println("<b>Product Code</b> <br/> "+product.productCode);
			out.println("<br/>");
			out.println("<br/>");
			out.println("<b>Name</b> <br/> "+product.name);
			out.println("<br/>");
			out.println("<br/>");
			out.println("<b>Description</b> <br/>"+product.description);
			out.println("<br/>");
			out.println("<br/>");
			/* ------------------------------------------------------------ASHISH------------------------------------------------------------ */
			
			out.println("<br/>");
			out.println("<br/>");
			out.println("<b>Stock Available</b><br/>");
			if(product.category.equalsIgnoreCase("2")){
				out.println("On order only");
			}
			else{
				if(product.outOfStock)
					out.println("Out of Stock");
				
				
			}
					
			out.println("<br/>");
			out.println("<br/>");
			
			if(showInterestedPanel){
    			out.println("<div class=\"showInterest\">");
    			out.println("Enter your Email here if you like this product");
				out.println("<div id=\"showInterest-container\">");
				out.println("<form  name=\"showInterestForm\" action=\"showInterest\" method=\"post\">");
        		out.println("<input name=\"customer\"  type=\"text\"  maxlength=\"50\" />");
        		out.println("<input name=\"productCode\" value=\""+productCode+"\" type=\"hidden\"  />");
        		out.println("<input name=\"submit\" id=\"submit\" type=\"image\" src=\"images/submit1.png\" onclick=\"this.form.submit();\"/>");
       			out.println("</form>");
				out.println("</div>");
			}else{
			    out.println("<div class=\"showInterestMessage\">");
    			if(errorWhileShowingInterest)
    				out.println("Please enter a valid email id. <a href=\"/showProduct.jsp?productCode="+productCode+"\">Click Here</a> to try again.");
    			else
    				out.println("We have received your response. One of our representative will contact you soon.");
			}    
		}
		if(invalidProductCode==true)
		{
			out.println("<h1>Invalid Product Code</h1>");
			out.println("<br/>");
			out.println("<a href=\"index.jsp\">Click Here to go back</a>");
		}
	%></td>
    	</tr>
	</table>
    </div>  
    </div>
	
</div>
<!---------------Right Area ----------------->
</div>
<!---------------Main Area End -------------->
<div class="footerarea">
<div class="footerarea">&nbsp;&nbsp;&copy;2013 swati | Connect using <a href="http://www.facebook.com/swaticreators" target="_blank" style="margin:0px 5px 0px 5px; display:inline-block; vertical-align:bottom;" title="facebook"><img src="images/facebook.png"  alt="Facebook"/></a> <!-- <a href="http://www.twitter.com" target="_blank" style="margin:0px 5px 0px 5px; display:inline-block; vertical-align:bottom;" title="twitter"><img src="images/twitter.png"  alt="Twitter"/></a>--> <a href="https://plus.google.com/107813831077998688087/posts" target="_blank" style="margin:0px 5px 0px 5px; display:inline-block; vertical-align:bottom;" title="google"><img src="images/google.png" alt="Google+"></img></a> <a href="http://instagram.com/swatidesignerwear" target="_blank" style="margin:0px 5px 0px 5px; display:inline-block; vertical-align:bottom;" title="instagram"><img src="images/instagram.png" alt="Instagram"></img></a>| Reach us at +91-9899464849, 9810620905  | Site Maintained By <a href="http://www.osahub.com/" target="_blank">osahub.com</a>&nbsp;
</div>
</div>
<!--
<script>
    $("#zoom_01").elevateZoom();
</script>
-->
</body>
</html>