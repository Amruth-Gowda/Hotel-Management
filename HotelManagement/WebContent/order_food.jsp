<%@page import="com.model.Order"%>
<%@page import="com.model.FoodItems"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
						<li><a href="user_home.jsp" class="active">Home</a></li>
						<li><a href="order_food.jsp" class="active">Order Food</a></li>
						<li><a href="user_book_room.jsp" class="active">Book Room</a></li>
						<li><a href="user_about.jsp" class="active">About</a></li>
						<li><a href="index.jsp" class="active">Log out</a></li>
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
		style="margin: 1cm 7cm; color: black; font-style: Sans-serif; font-size: 18px">

		Dishes List!!!! <br>
		<script>
			function confirmOrder() {
				return confirm("Are you sure, you wanna place the order????");
			}
		</script>
		<form method="post">
			
			<table id="customers">

				<tr>
					<th>Dish No.</th>
					<th>Name</th>
					<th>Type</th>
					<th>Price</th>
					<th>Quantity</th>
				</tr>
				<%
					FoodItems foodItems = new FoodItems();
					ResultSet result = foodItems.getAllFoodItems();
				%>
				<%
					while (result.next()) {
				%>
				<tr>
					<td><%=result.getInt("food_id")%></td>
					<input type="hidden" name="dishId" value="<%=result.getInt("food_id")%>" />
					<td><%=result.getString("food_name")%></td>
					<td><%=result.getString("food_type")%></td>
					<td>&#8377; <%=result.getString("food_price")%></td>
					<input type="hidden" name="dishPrice" value="<%=result.getInt("food_price")%>" />
					<td><select name="quantity" required>
							<option value=0 default>select</option>
							<option value=1>1</option>
							<option value=2>2</option>
							<option value=3>3</option>
							<option value=4>4</option>
							<option value=5>5</option>
							<option value=6>6</option>
					</select></td>
				</tr>
				<%
					}
				%>
				<tr>
					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><input type="submit" name="order" value="Order"
						onclick="return confirmOrder()" /></td>
				</tr>
			</table>
		</form>
	</div>
	<%
		if (request.getParameter("order") != null) {
				User user = (User) session.getAttribute("user_details");
				int userId = user.getUserId();
				int counter = 0;
				String[] dishIds = request.getParameterValues("dishId");
				String[] dishPrices = request.getParameterValues("dishPrice");
				String[] quantities = request.getParameterValues("quantity");
				for (int i = 0; i < quantities.length; i++) {
					if (Integer.parseInt(quantities[i]) > 0) {
						int dishId = Integer.parseInt(dishIds[i]);
						double dishPrice = Integer.parseInt(dishPrices[i]);
						int quantity = Integer.parseInt(quantities[i]);
						/* System.out.println("Dish Id: " + dishId);
						System.out.println("Quantity Id: " + quantity);
						System.out.println("Dish Price: " + dishPrice); */
						Order order = new Order();
						int res = order.placeOrder(userId, dishId, dishPrice, quantity);
						if(res==1){
							counter += 1;
						}
					}
				}
				if(counter>0){
					%>
						<script type="text/javascript">
							alert("Order Placed Successfully!!!!");
							window.href.location="order_food.jsp";
						</script>
					<%
				}
				else{
					%>
					<script type="text/javascript">
						alert("Oops! Can't place an Order");
						window.href.location="order_food.jsp";
					</script>
					<%
				}
			}
	%>
</body>
</html>