<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.model.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<title>Hotel Management System</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords"
	content="Ballet Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template, 
	SmartPhone Compatible web template, free WebDesigns for Nokia, Samsung, LG, Sony Ericsson, Motorola web design" />
<script type="application/x-javascript">
	
	
	
	
	
	 addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } 





</script>
<!-- Custom Theme files -->
<link href="css/bootstrap.css" type="text/css" rel="stylesheet"
	media="all">
<link href="css/style.css" type="text/css" rel="stylesheet" media="all">
<link href="css/font-awesome.css" rel="stylesheet">
<!-- font-awesome icons -->
<link href="css/index.css" rel="stylesheet" type="text/css" media="all" />
<!-- filter css -->
<link rel="stylesheet" href="css/swipebox.css">
<!-- //Custom Theme files -->
<!-- js -->
<script src="js/jquery-2.2.3.min.js"></script>
<!-- //js -->
<!-- web-fonts -->
<link
	href="//fonts.googleapis.com/css?family=Roboto+Condensed:300,300i,400,400i,700,700i"
	rel="stylesheet">
<link
	href="//fonts.googleapis.com/css?family=Raleway:100,100i,200,200i,300,300i,400,400i,500,500i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- //web-fonts -->
</head>
<body>
	<!-- header -->
	<div class="header">
		<nav class="navbar navbar-default">
		<div class="container">
			<div class="navbar-header navbar-left wthree">
				<h1>
					<a href="index.jsp">Hotel<span>The Royal Stay</span></a>
				</h1>
			</div>
			<!-- navigation -->
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<div class="header-right wthree">
				<div class="top-nav-text">
					<p>Call Us: +00 111 2222 333</p>

				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse navbar-right"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav navbar-left cl-effect-14">
						<li><a href="admin_home.jsp" class="active">Home</a></li>
						<li><a href="admin_add_food.jsp" class="active">Add Dish</a></li>
						<li><a href="admin_view_bookings.jsp" class="active">View Bookings</a></li>
						<li><a href="admin_customer_view.jsp" class="active">View Customers</a></li>
						<li><a href="admin_view_orders.jsp" class="active">View orders</a></li>
						<li><a href="index.jsp" class="active">Logout</a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				<!-- //navigation -->
			</div>
			<div class="clearfix"></div>
		</div>
		</nav>
	</div>
	<div
		style="margin: 2cm 12cm; color: black; font-style: Sans-serif; font-size: 18px">

		<h2>Add Dish Here</h2>
		<br>
		<jsp:useBean id="foodObj" class="com.model.FoodItems" />
		<form action="">
			<table id="customers">
				<tr>
					<th>Food Name:</th>
					<td><input type="text" placeholder="Enter name"
						name="foodName" required></td>
				</tr>
				<tr>
					<th>Price</th>
					<td><input type="text" placeholder="Enter price"
						name="foodPrice" required></td>
				</tr>
				<tr>
					<th>Type:</th>
					<td><select name="foodType" > 
						<option value="Breakfast"> Breakfast </option>
						<option value="Lunch"> Lunch </option>
						<option value="Dinner"> Dinner </option>
						<option value="Snacks"> Snacks </option>
						<option value="Beverages"> Beverages </option>
					</select></td>
				</tr>
				<tr>
					<td></td>
					<td><input type="submit" value="Create" name="create"></td>
				</tr>
			</table>
		</form>
		<%
		if(request.getParameter("create")!=null)
		{
			%>
		<jsp:setProperty property="*" name="foodObj" />
		<%
		if(foodObj.createFoodItem()==1)
		{
		 %>
		<script type="text/javascript">
		 	alert("added successfully!!")
		 	window.location.href= "admin_add_food.jsp";
		 	</script>
		<%
		}
		else
		{
			%>
		<script type="text/javascript">
		 	alert("unable to add!!!!!")
		 	window.location.href= "admin_add_food.jsp";
		 	</script>
		<%
		}
		}
		%>


	</div>
</body>
</html>