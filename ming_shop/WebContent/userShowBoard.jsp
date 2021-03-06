<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>

<script src="https://www.gstatic.com/firebasejs/5.6.0/firebase.js"></script>
<script>
  // Initialize Firebase
  var firebaseConfig = {
    apiKey: "AIzaSyAfyOLf2EfPBmKF8kRisiLhiAFWF8n5mZI",
    authDomain: "ming-72780.firebaseapp.com",
    databaseURL: "https://ming-72780.firebaseio.com",
    projectId: "ming-72780",
    storageBucket: "ming-72780.appspot.com",
    messagingSenderId: "1058417843075",
    appId: "1:1058417843075:web:e978ff8e4382c98f6434b6"
  };
  firebase.initializeApp(firebaseConfig);
</script>
<body class="homepage is-preload">
	<%
		String USERID = (String) request.getSession().getAttribute("id");
	%>
	<%
		String key = (String) request.getParameter("key");
	%>
	<script>
		goodskey = parseInt("<%=key%>");
	
		
		function goback() {
			location.href="userBoard.jsp"
		}
	</script>

	<div id="page-wrapper">
		<section id="header">

			<!-- Logo -->
			<h1>
				<a href="newindex.jsp">Ming's DISNEY</a>
			</h1>

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a href="newindex.jsp">Main</a></li>
					<li><a href="#">Member</a>
						<ul>
							<%
								if (USERID == null) {
							%>

							<li><a href="userLogin.jsp">Log-in</a></li>
							<li><a href="userRegister.jsp">Sign-up</a></li>
							<li><a href="adminLogin.jsp">Admin Log-in</a></li>

							<%
								} else {
							%>
							<li><a href="userLogout.jsp">Log-out</a></li>

							<%
								}
							%>

						</ul></li>
					<li><a href="shopping.jsp">Shopping</a></li>
					<li><a href="userCart.jsp">Cart</a></li>
					<li><a href="userOrder.jsp">My Order</a>
					<li class="current"><a href="userBoard.jsp">Board</a></li>
				</ul>
			</nav>
		</section>
		
		
		<section id="main">
			<div class="container" style="width: 1000px;">
				<div class="row">
					<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="3"
									style="background-color: #eeeeee; text-align: center;">게시글 보기</th>
							</tr>
						</thead>

						<tbody id="showboard" >
							
						</tbody>
					</table>
	
					<input type="button" onclick="goback()" class="button alt"
							value="목록보기" />
				</div>
				<script>
				show_board();
				function show_board() {
					var board_data = firebase.database().ref('board/'+goodskey);
					board_data.once('value', function(snapshot) {
						var tmp = snapshot.val();
						
						sboard = document.getElementById("showboard");
						
						new_tr = document.createElement("tr");
						
						td_number = document.createElement("td");
						td_number.innerHTML = "글 제목";
						td_number.setAttribute("style","width: 20%;");
						new_tr.appendChild(td_number);
						
						td_title = document.createElement("td");
						td_title.innerHTML = tmp.board_title;
						td_title.setAttribute("colspan","2");
						new_tr.appendChild(td_title);
						
						sboard.appendChild(new_tr);
						
						new_tr2 = document.createElement("tr");
						
						td_id = document.createElement("td");
						td_id.innerHTML = "작성자";
						td_id.setAttribute("style","width: 20%;");
						new_tr2.appendChild(td_id);
						
						td_writer = document.createElement("td");
						td_writer.innerHTML = tmp.board_id;
						td_writer.setAttribute("colspan","2");
						new_tr2.appendChild(td_writer);
						
						sboard.appendChild(new_tr2);
						
						new_tr3 = document.createElement("tr");
						
						td_id = document.createElement("td");
						td_id.innerHTML = "글 내용";
						td_id.setAttribute("style","width: 20%;");
						new_tr3.appendChild(td_id);
						
						td_con = document.createElement("td");
						td_con.innerHTML = tmp.board_contents;
						td_con.setAttribute("colspan","2");
						td_con.setAttribute("style","min-height: 200px;");
						new_tr3.appendChild(td_con);
						
						sboard.appendChild(new_tr3);
						
						
					});
				}
				
				</script>
			</div>
		</section>
	</div>
</body>
</html>