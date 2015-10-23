<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.osahub.ecomm.dao.shop.ProductDao" %>
<%@ page import="com.osahub.ecomm.bean.admin.AdminBackingBean" %>
<%@ page import="com.google.appengine.api.users.UserServiceFactory" %>
<%@ page import="com.osahub.ecomm.bean.search.SearchBackingBean" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.images.Image" %>
<%@ page import="com.google.appengine.api.images.ImagesService" %>
<%@ page import="com.google.appengine.api.images.ImagesServiceFactory" %>
<%@ page import="com.google.appengine.api.images.Transform" %>
<%@ page import="com.google.appengine.api.blobstore.BlobKey" %>

<%
	BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	BlobKey blobKey;
	Boolean showAdminPanel;
	int loginStatus = AdminBackingBean.isAdminLoggedIn(request);
	if( loginStatus == 1)
		showAdminPanel = true;
	else
		showAdminPanel = false;
		
	//ProductDao product = (ProductDao)session.getAttribute("ProductDao");
	String productCode = (String)session.getAttribute("productCode");
	SearchBackingBean bean = null;
	ProductDao product = null;
%>
<!DOCTYPE html>


<head>
	<meta charset="utf-8" />
	<meta name="google-site-verification" content="PTE87OTN6vP3pRBFWyp-heGWkZ2hywOcVx6S2Jq4uUo" />
	<!-- Set the viewport width to device width for mobile -->
	<meta name="viewport" content="width=device-width" />
	<title>X2 Entertainments : Admin Panel</title>
	<!-- Included CSS Files -->
	<link rel="stylesheet" href="stylesheets/app.css">
	<link rel="stylesheet" href="css/datepicker.css">
	<link rel="stylesheet" href="stylesheets/offcanvas.css">
	<link rel="stylesheet" href="stylesheets/foundation.css">
	<link rel="stylesheet" href="stylesheets/tikakaran.css">
	<link href='http://fonts.googleapis.com/css?family=Droid+Sans+Mono' rel='stylesheet' type='text/css'>
	<script src="javascripts/foundation/modernizr.foundation.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
</head>

<body id="page" >
	<!-- Header and Nav -->
	<div class="row">
    	<div class="three columns">
      		<h1>
			<img id="zoom_01" alt="logo" src="img/logo.gif" data-zoom-image="img/logo.gif"/>
		</h1>
    	</div>
		<div class="nine columns" id = "nav-tab">
			<dl class="tabs pill">
        <%		  
	    
	    
	    	if(showAdminPanel){
	    		out.println("<dd class=\"active\"><a href=\"#add\">Add Event</a></dd>");
	    		//out.println("<dd><a href=\"#update\">Update Event</a></dd>");
	    		//out.println("<dd><a href=\"#email\">Send Mails</a></dd>");
	    		out.println("<dd><a href=\""+UserServiceFactory.getUserService().createLogoutURL("/admin.jsp")+"\">Logout</a></dd>");
	    	}
	    	else{
	    		out.println("<dd class=\"active\"><a href=\"#main-content\">X2 Entertainments Admin Panel</a></dd>");
	    		out.println("<dd><a href=\""+UserServiceFactory.getUserService().createLoginURL("/admin.jsp#add")+"\">Admin Login</a></dd>");
	    	}
	    		
	    %>
        		
      		</dl>
   		</div> 
    
	</div>
	<!-- End Header and Nav -->
	
	<!-- First Band (Slider) -->
  	<!-- The Orbit slider is initialized at the bottom of the page by calling .orbit() on #slider -->
  	<div class="row">
    	<div class="twelve columns">
      	<hr/>
	 	<ul class="tabs-content ">  
	    <%
	    		if(loginStatus == 0)
	    			out.println("Click on Admin Login button to login.");
	    		else if( loginStatus == 2)
	    			out.println("Access Denied! <br/>You need to logout from other google account(s) first.<br/> <a href=\""+UserServiceFactory.getUserService().createLogoutURL("/admin.jsp")+"\">Click Here</a> to try again");
	    		else
	    			out.println("Admin is logged in.");
	    				
	    %>
	      	<li id = "addTab"> 
				<!-- Registration Form -->
        		<h3>Add an Event</h3>
        		<form name="addProduct" class="nice custom" action="<%if(showAdminPanel) out.println(blobstoreService.createUploadUrl("/addProduct"));else out.println("");%>" method="post" enctype="multipart/form-data" onsubmit="return checkform(this);")>
        		            		

					<label for="category">Event Category</label>
					<select id="category" name="category">
						<option value="1">Public Events</option>
						<option value="2">Outdoor Events</option>
						<option value="3">Private Parties</option>
						<option value="4">Covering Private Parties</option>
						<option value="5">Concept Based Personal Events</option>
						<option value="6">Décor</option>
						<option value="7">Night Club and Lounge Promotions</option>
						<option value="8">Pub Consultancy</option>
						<option value="9">Artiste Management and Promotion</option>
						<option value="10">Providing Entertainment Staff</option>
						<option value="11">Providing best caterers & Catering services</option>
						<option value="12">Domestic & International DJ'S</option>
					</select>
					
        			<label for="productCode" class="error" id="iError">Please enter an proper Event Code</label>
        			<input type="text" class="input-text four" id="productCode" maxlength="8" placeholder="Event Code" name = "productCode"/>
<div class="well">
			  <div class="input-append date" id="dp3" data-date="12-02-2012" data-date-format="dd-mm-yyyy">
				<input class="span2" size="16" type="text" value="12-02-2012" id="date" name="date" readonly>
				<span class="add-on"><i class="icon-calendar"></i></span>
			  </div>
          </div>

					<label for="myFile">Choose a Event Image</label>
					<label for="image1_small" class="error" id="file1Error">Please choose an image for Event</label>
            		<input type="file" class="medium blue radius button" id="image1_small" placeholder="Small Product Image" name="image1_small">
            		<br/>
					<br/>
<!-- 
					<label for="subCategory">Event Sub Category</label>
					<select id="subCategory" name="subCategory">
						<option value="11">Fashion1</option>
						<option value="12">Fashion2</option>
						<option value="21">Accessories1</option>
						<option value="22">Accessories2</option>
						<option value="31">Art Work1</option>
						<option value="32">Art Work2</option>
						<option value="41">G-Shop1</option>
						<option value="43">G-Shop2</option>
						<option value="51">Gallery1</option>
						<option value="53">Gallery2</option>
					</select>
 -->        		
        			<label for="name" class="error" id="nError">Please enter Event name in proper format</label>
        			<input type="text" class="input-text four" id="name" placeholder="Event's Name" maxlength="120" name = "name"/>
        		
        			<label for="description" class="error" id="mError">Please enter Event's description</label>
        			<input type="text" class="input-text eight numbers" id="description" maxlength="200" placeholder="Events's Description" name = "description" />
        		<!-- 
        			<label for="mrp" class="error" id="lError">Please enter valid MRP</label>
        			<input type="text" class="input-text four" id="mrp" maxlength="7" placeholder = "Product's MRP" name = "mrp" />
        		
        			<label for="stockAvailable" class="error" id="qrError">Please enter valid no of quantity</label>
        			<input type="text" class="input-text four" id="stockAvailable" maxlength="3" placeholder = "Product's quantity in stock" name = "stockAvailable" />
 -->        		
        			        			<br/>
        			<input type="submit" class="medium blue radius button" value="Submit" />
        		</form>
			</li>  
	      	<li id = "updateTab"> 
				<!-- Registration Form -->
<%
				if(productCode == null){	
					out.println("<h3>Search Event</h3>");
					//out.println("<form name=\"searchProductById\"  class=\"nice custom\" action=\"searchById\" method=\"post\" onsubmit=\"return checkSearchForm(this);\")>");
	    				out.println("<label for=\"productCodeSearch\" class=\"error\" id=\"productCodeSearchError\">Please enter an proper Event Code</label>");
						out.println("<input type=\"text\" class=\"input-text four\" id=\"productCodeSearch\" maxlength=\"8\" placeholder=\"Event Code\" name = \"productCodeSearch\"/>");
						out.println("<br/>");
						//out.println("<input type=\"submit\" class=\"medium blue radius button\" value=\"Search\" />");
					out.println("</form>");
				}

				else{	
					bean = new SearchBackingBean();
					product = bean.SearchProductById(productCode);
					out.println("<h3>Update Event : "+product.productCode+"</h3>");
					//out.println("<form name=\"updateProduct\" class=\"nice custom\" action=\"updateProduct\" method=\"post\" onsubmit=\"return checkUpdateForm(this);\")>");
					
					if(product.image1 != null){
			        	ImagesService imagesService = ImagesServiceFactory.getImagesService();
			        	String image1_small = imagesService.getServingUrl(product.image1);
			        	out.println("<img id=\"zoom_2\" alt=\"product_image\" src=\""+image1_small+"\" />");
	        			out.println("<br/>");
					}else{
			        	out.println("<b>No Image found for this Event.</b>");
					}

	        			//out.println("<label for=\"categoryUpdate\" class=\"error\" id = \"eUpdateError\">Please Enter Correct Product Category</label>");


        				out.println("Event's Name :");
	        			out.println("<label for=\"nameUpdate\" class=\"error\" id=\"nUpdateError\">Please enter Event name in proper format</label>");
	        			out.println("<input type=\"text\" class=\"input-text four\"  maxlength=\"120\"  id=\"nameUpdate\" value=\""+product.name+"\" name = \"nameUpdate\"/>");

        				out.println("Event's Composition and Description :");
	        			out.println("<label for=\"descriptionUpdate\" class=\"error\" id=\"mUpdateError\">Please enter Event's description</label>");
	        			out.println("<input type=\"text\" class=\"input-text eight numbers\"  maxlength=\"200\"  id=\"descriptionUpdate\" value=\""+product.description+"\" name = \"descriptionUpdate\" />");

        				out.println("Product's MRP :");
	        			out.println("<label for=\"mrpUpdate\" class=\"error\" id=\"lUpdateError\">Please enter valid MRP</label>");
	        			//out.println("<input type=\"text\" class=\"input-text four\"  maxlength=\"7\"  id=\"mrpUpdate\" value=\""+product.mrp+"\" name = \"mrpUpdate\" />");

        				out.println("Product's quantity in stock :");
	        			out.println("<label for=\"stockAvailableUpdate\" class=\"error\" id=\"qrUpdateError\">Please enter valid no of quantity</label>");
	        			//out.println("<input type=\"text\" class=\"input-text four\"  maxlength=\"3\"  id=\"stockAvailableUpdate\" value=\""+product.stockAvailable+"\" name = \"stockAvailableUpdate\" />");
	        			
	        			out.println("Display Event On Website ?");
	        			String String3="";
	        			String String4="";
	        			if(product.showOnWebsite){
	        				String3 = "CHECKED><span class=\"custom radio checked\">";
	        				String4 = "><span class=\"custom radio \">";
	        			}else{
	        				String3 = "><span class=\"custom radio \">";
	        				String4 = "CHECKED><span class=\"custom radio checked\">";
	        			}
	        				
	        			out.println("<label for=\"showOnWebsite\"><input name=\"showOnWebsite\" type=\"radio\" value=\"true\" id=\"showOnWebsite\" style=\"display:none;\" "+String3+"</span> Yes</label>");
	        			out.println("<label for=\"showOnWebsite\"><input name=\"showOnWebsite\" type=\"radio\" value=\"false\" id=\"showOnWebsite\" style=\"display:none;\" "+String4+"</span> No</label>");

	        			

	        			out.println("<br/>");
	        			out.println("<input type=\"submit\" class=\"medium blue radius button\" value=\"Submit\" />");
	        		out.println("</form>");

        			out.println("<br/>");
	        		//out.println("<form name=\"cancelUpdateProduct\" class=\"nice custom\" action=\"updateProduct\" method=\"get\" onsubmit=\"\")>");
	        			out.println("<input type=\"submit\" class=\"medium blue radius button\" value=\"Cancel\" />");
	        		//out.println("</form>");
				}
%>				
			</li> 
			<!-- 
			<li id = "emailTab"> 
        		<h3>Send E-Mails</h3>
        		
				<div class="twelve columns">
	        		<form name="sendEmail" class="nice custom" action="sendEmail" method="post" onsubmit="return checkEmailForm(this);")>
	        			
    					<div class="row">
							<div class="twelve columns">
			        			<label for="productCode">Sender : </label>
			        			<input type="text" class="input-text four" id="sender" maxlength="8" readonly value="admin@x2entertainments.com" placeholder="Product Code" name = "sender"/>
		        			</div>
	        			</div>
    					<div class="row">
			        		<label>Recipient Details : </label>
		        			<div class="six columns">
			        			<input type="text" class="input-text four" id="recipientEmail" placeholder="Email" maxlength="120" name = "recipientEmail"/>
			        			<label for="recipientEmail" class="error" id="nError">Please enter recipient email id in proper format</label>
			        		</div>
		        			<div class="six columns">
			        			<input type="text" class="input-text four" id="recipientName" placeholder="Name" maxlength="120" name = "recipientName"/>
			        			<label for="recipientName" class="error" id="nError">Please enter recipient email id in proper format</label>
			        		</div>
	        			</div>
    					<div class="row">
							<div class="twelve columns">
			        			<label >Subject : </label>
			        			<input type="text" class="input-text four" id="subject" maxlength="500"  placeholder="Subject" name = "subject"/>
			        			<label for="subject" class="error" id="subjectError">Please enter proper subject of the email.</label>
		        			</div>
	        			</div>
    					<div class="row">
							<div class="twelve columns">
						<label>Body :</label>
						<textarea name="aboutMe" id="aboutMe" placeholder="Content of the email"></textarea>
						<label for="aboutMe" class="error" id="aboutMeError">Please enter some information about vaccination center</label>
		        			</div>
	        			</div>
	        			
	       			<br/>
	        			<input type="submit" class="medium blue radius button" value="Send Mail" />
	        		</form>
	        	</div>
			</li>  -->
	  </ul>
	  
	  </div>
	  </div>
 
  
  <!-- Footer -->
  
  <footer class="row">
    <div class="twelve columns">
      <hr />
      <div class="row">
        <div class="six columns">
          <p>&copy; <a href="http://www.osahub.com" target="_blank">OSAHUB</a> 2014</p>
        </div>
      </div>
    </div> 
  </footer>
 

	<!-- modal window for success -->
	<div id ="successModal" class="reveal-modal medium">
		<h2>Great Job!</h2>
		<p>One more event has been added.</p>
		<p>Keep up the good work :)</p>
	</div>
 

	<!-- modal window for error -->
	<div id ="errorModal1" class="reveal-modal medium">
		<h2>Error Occured!</h2>
		<p>There was an error while adding event. Please try again.</p>
		<p>If the error still persists, contact admin@osahub.com</p>
	</div>
 

	<!-- modal window for error -->
	<div id ="errorModal2" class="reveal-modal medium">
		<h2>Error Occured!</h2>
		<p>event Code that you have entered already exists.</p>
		<p>Please try again with a different event Code.</p>
	</div>
 

	<!-- modal window for error -->
	<div id ="errorModal3" class="reveal-modal medium">
		<h2>Error Occured!</h2>
		<p>No event Found for event Code that you have entered.</p>
		<p>Please try again with a different event Code.</p>
	</div>
 

	<!-- modal window for error -->
	<div id ="successModalUpdate" class="reveal-modal medium">
		<h2>Cheers!</h2>
		<p>event has been updated successfully.</p>
	</div>
 

	<!-- email sending success -->
	<div id ="successEmailService" class="reveal-modal medium">
		<h2>Success!</h2>
		<p>Email has been sent successfully.</p>
	</div>
	
	<!-- email sending error -->
	<div id ="errorEmailService" class="reveal-modal medium">
		<h2>Error!</h2>
		<p>Error while sending Email.</p>
	</div>
	

	
	
	<!-- Included JS Files -->
  <script src='javascripts/imageZoom/jquery-1.8.3.min.js'></script>
  <script src='javascripts/imageZoom/jquery.elevatezoom.js'></script>
  <script src="javascripts/foundation/jquery.js"></script>
  <script src="javascripts/foundation/jquery.foundation.reveal.js"></script>
  <script src="javascripts/foundation/jquery.foundation.orbit.js"></script>
  <script src="javascripts/foundation/jquery.foundation.forms.js"></script>
  <script src="javascripts/foundation/jquery.placeholder.js"></script>
  <script src="javascripts/foundation/jquery.foundation.tooltips.js"></script>
  <script src="javascripts/foundation/jquery.foundation.alerts.js"></script>
  <script src="javascripts/foundation/jquery.foundation.buttons.js"></script>
  <script src="javascripts/foundation/jquery.foundation.accordion.js"></script>
  <script src="javascripts/foundation/jquery.foundation.navigation.js"></script>
  <script src="javascripts/foundation/jquery.foundation.mediaQueryToggle.js"></script>
  <script src="javascripts/foundation/jquery.foundation.tabs.js"></script>
  <script src="javascripts/foundation/jquery.offcanvas.js"></script>
  <script src="javascripts/foundation/app.js"></script>
  <!-- Put this above your </body> tag -->
<script type="text/javascript">

$(window).load(function() {
	$('.close-modal').click(function(){
		$('.close-modal').trigger('reveal:close');
	});
	
    $('#slider').orbit({
    	animationSpeed:1200,
    	advanceSpeed:5000
    	 	});
    
    
  });

function getParameterByName(name){
	  name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
	  var regexS = "[\\?&]" + name + "=([^&#]*)";
	  var regex = new RegExp(regexS);
	  var results = regex.exec(window.location.search);
	  if(results == null)
	    return "";
	  else
	    return decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	

 
  
  $(document).ready(function(){
	 //$('.numbers') .forcenumeric();
		$('.error').hide();
		var status = getParameterByName('status')
		//if successfully created an product
		if(status == '001'){
			$('#successModal').reveal();
		}
		
		//if any error occured while fetching record from ProductDao
		if(status == '002'){
			$('#errorModal1').reveal();
		}
		
		//if productId entered already exists
		if(status == '003'){
			$('#errorModal2').reveal();
		}
		
		//if no product found for productId entered
		if(status == '004'){
			$('#errorModal3').reveal();
		}
		
		//if successfully updated an product
		if(status == '005'){
			$('#successModalUpdate').reveal();
		}
		
		//if successfully sent an email
		if(status == '006'){
			$('#successEmailService').reveal();
		}
		
		//if error while sending an email
		if(status == '007'){
			$('#errorEmailService').reveal();
		}
		
		$('.backJob').click(function(){
			$('#backJobModal').reveal();
			
		});
		
		
		
  });
  
 function isEmail(email){
	  var regex = /^([a-zA-Z0-9_\.\-\+])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	  return regex.test(email);
 }
 
 function isNumeric(num){
	 var regex = /^[0-9]+$/
	 return regex.test(num);
 }
  
 
 function checkFForm(){
	 $('.error').hide();

	//check for name
	 if($('#fName').val().length<3 || isNumeric($('#fName').val())){
			$('#fNameError').show();
			return false;
	}
		
	//check for email
	 if($('#fEmail').val().length<3 || !isEmail($('#fEmail').val())){
		$('#fEmailError').show();
		return false;
	}
		
	//check for number
	 if($('#fNumber').val().length<10 || $('#fNumber').val().length>12 || !isNumeric($('#fNumber').val())){
			$('#fNumberError').show();
			return false;
	}

	//check for message
	if($('#fQuery').val().length<3){
		 $('#fQueryError').show();
		 return false;
	 }
 }
 

 
 
 
  //registration forms validation
function checkform(){
	$('.error').hide();
	
	var result = true;
	

  	if($('#image1_small').val().length < 4){
		  $('#file1Error').show();
		  result = false;
	  }
	
  	if($('#productCode').val().length != 8){
		  $('#iError').show();
		  result = false;
	  }
	  
	  //check if name is valid and doesnot contain digits.
	  if($('#name').val().length<5 || isNumeric($('#name').val())){
		  $('#nError').show();
		  result = false;
	  
	  }

	  	//check category number
		var catg = $('#category').val();
	  if(catg.length==1){
			  
		  if(!isNumeric(catg)){
			  $('#eError').show();
			  result = false;
		  }
	  }else{
			  $('#eError').show();
			  result = false;
		  }		  
	  
	//check description number
	var description = $('#description').val();
	if(description.length < 10 ){
		$('#mError').show();
		result = false;
	}
	
	  if($('#mrp').val().length>6 || $('#mrp').val().length<1 || !isNumeric($('#mrp').val())){
		  $('#lError').show();
		  result = false;
	  
	  }
	
  	if($('#stockAvailable').val().length < 1 || $('#stockAvailable').val().length > 3 || !isNumeric($('#stockAvailable').val())){
		  $('#qrError').show();
		  result = false;
	  }

	return result;
}
  

//email forms validation
function checkEmailForm(){
	return true;
}


//registration forms validation
function checkSearchForm(){
	$('.error').hide();
	var result = true;
	
	if($('#productCodeSearch').val().length != 8){
		  $('#productCodeSearchError').show();
		  result = false;
	  }
	return result;
}


function checkUpdateForm(){
	$('.error').hide();
	
	var result = true;
	
 
	  //check if name is valid and doesnot contain digits.
	  if($('#nameUpdate').val().length<5 || isNumeric($('#nameUpdate').val())){
		  $('#nUpdateError').show();
		  result = false;
	  
	  }	  
	  
	//check description number
	var description = $('#descriptionUpdate').val();
	if(description.length < 10 ){
		$('#mUpdateError').show();
		result = false;
	}
	
	  if($('#mrpUpdate').val().length>6 || $('#mrpUpdate').val().length<1 || !isNumeric($('#mrpUpdate').val())){
		  $('#lUpdateError').show();
		  result = false;
	  
	  }
	
  	if($('#stockAvailableUpdate').val().length < 1 || $('#stockAvailableUpdate').val().length > 3 || !isNumeric($('#stockAvailableUpdate').val())){
		  $('#qrUpdateError').show();
		  result = false;
	  }

	return result;
}

	
	
</script>
  
  

</body>