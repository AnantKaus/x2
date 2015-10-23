<%
	
	String subscription = null;
	subscription = (String)session.getAttribute("subscriptionStatus");
	session.setAttribute("subscriptionStatus", null);
	boolean showSubscriptionPanel = true;
	boolean errorWhileSubscribing = true;
	if(subscription!=null){
		showSubscriptionPanel = false;
		if(subscription.equalsIgnoreCase("success"))
			errorWhileSubscribing = false;
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Swati Designer Wear | Home</title>
<link href="css/styles.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/slides.js"></script>
<script type="text/javascript" src="js/fadeslideshow.js"></script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.vticker-min.js"></script>
<script type="text/javascript">
$(function(){
	$('#news-container').vTicker({ 
		speed: 600,
		pause: 3000,
		animation: 'fade',
		mousePause: true,
		showItems: 1
	});
});
</script>
<script type="text/javascript">

var mygallery=new fadeSlideShow({
	wrapperid: "fadeshow2", //ID of blank DIV on page to house Slideshow
	dimensions: [300, 420], //width/height of gallery in pixels. Should reflect dimensions of largest image
	imagearray: [
		["images/1.jpg", "collections.jsp?category=1", "", "Exclusve range of Sarees"],
		["images/2.jpg", "collections.jsp?category=2", "", "Exclusve range of Lehngas"],
		["images/3.jpg", "collections.jsp?category=5", "", "Exclusve range of Kurtis and Tunics"]//<--no trailing comma after very last image element!
	],
	displaymode: {type:'auto', pause:2500, cycles:0, wraparound:false},
	persist: false, //remember last viewed slide and recall within same session?
	fadeduration: 500, //transition duration (milliseconds)
	descreveal: "ondemand",
	togglerid: ""
})


var mygallery2=new fadeSlideShow({
	wrapperid: "fadeshow1", //ID of blank DIV on page to house Slideshow
	dimensions: [328, 400], //width/height of gallery in pixels. Should reflect dimensions of largest image
	imagearray: [
		["images/4.jpg", "collections.jsp?category=3", "", "Exclusve range of Suits"],
		["images/5.jpg", "collections.jsp?category=1", "", "Exclusve range of Sarees"],
		["images/6.jpg", "collections.jsp?category=4", "", "Exclusve range of Anarkalis"]//<--no trailing comma after very last image element!
	],
	displaymode: {type:'auto', pause:2500, cycles:0, wraparound:false},
	persist: false, //remember last viewed slide and recall within same session?
	fadeduration: 500, //transition duration (milliseconds)
	descreveal: "ondemand",
	togglerid: ""
})
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
            <li><a href="#">home</a></li>
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
<div class="midarea">
	<!--
    <div class="r_top"></div>
	<div class="midbtm"  id="fadeshow2"></div>
    -->
	<div class="r_top2"></div>
	<div class="midbtm2"  id="fadeshow2"></div>
	<!--<div class="midbtm" style="padding:60px 0px 0px 25px"><a href="#"><img src="images/img2.jpg" /></a></div>-->
</div>
<!---------------Mid Area End --------------->
<!---------------Mid Area2 ------------------->
<div class="midarea2"></div>
<!---------------Mid Area 2End --------------->

<!---------------Right Area ----------------->
<div class="rightarea">
	<div class="r_top"></div>
    <!-- <div class="right_top"><a href="#"><img src="images/img3.jpg" /></a></div>-->
   <div class="right_top" id="fadeshow1"></div>
    <div class="r_btm"></div>
<%
if(showSubscriptionPanel){
    out.println("<div class=\"subscribe\">");
    out.println("Enter your Email to get updates about our new collection");
    out.println("<div id=\"subscribe-container\">");
		out.println("<form  name=\"subscriptionForm\" action=\"subscribe\" method=\"post\">");
        	out.println("<input name=\"subscriber\"  type=\"text\"  maxlength=\"50\" />");
        	out.println("<input name=\"submit\" id=\"submit\" type=\"image\" src=\"images/subscribe.png\" onclick=\"this.form.submit();\"/>");
        out.println("</form>");
	out.println("</div>");
	
}else{
    out.println("<div class=\"subscribeMessage\">");
    if(errorWhileSubscribing)
    	out.println("Please enter a valid email id. <a href=\"index.jsp\">Click Here</a> to try again.");
    else
    	out.println("You have been successfully subscribed to our mailing list. Now we will keep you informed about our latest collection.");
}    
%>
</div>
</div>
<!---------------Right Area ----------------->

</div>
<!---------------Main Area End -------------->
<div class="footerarea">&nbsp;&nbsp;&copy;2013 swati | Connect using <a href="http://www.facebook.com/swaticreators" target="_blank" style="margin:0px 5px 0px 5px; display:inline-block; vertical-align:bottom;" title="facebook"><img src="images/facebook.png"  alt="Facebook"/></a> <!-- <a href="http://www.twitter.com" target="_blank" style="margin:0px 5px 0px 5px; display:inline-block; vertical-align:bottom;" title="twitter"><img src="images/twitter.png"  alt="Twitter"/></a>--> <a href="https://plus.google.com/107813831077998688087/posts" target="_blank" style="margin:0px 5px 0px 5px; display:inline-block; vertical-align:bottom;" title="google"><img src="images/google.png" alt="Google+"></img></a> <a href="http://instagram.com/swatidesignerwear" target="_blank" style="margin:0px 5px 0px 5px; display:inline-block; vertical-align:bottom;" title="instagram"><img src="images/instagram.png" alt="Instagram"></img></a>| Reach us at +91-9899464849, 9810620905  | Site Maintained By <a href="http://www.osahub.com/" target="_blank">osahub.com</a>&nbsp;
</div>
</div>
</body>
</html>
