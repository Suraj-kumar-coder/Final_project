<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
 <%@page isELIgnored="false"%> 
  <%@ page import="com.db.DBConnect" %>
  <%@ page import="com.dao.AppointmentDao" %>
  <%@ page import="com.entity.Appointment" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.paint-card {
  box-shadow :0 0 20px 0 rgba(0,0,0.3);
}

.backImg {
	background: linear-gradient(rgba(0, 0, 0, 0.4), rgba(0, 0, 0, 0.4)),
	url("image/hospital.jpg");
	height: 40vh;
	width: 100%;
	background-size: cover;
	background-repeat: no-repeat;	
}

</style>
<%@include file="../component/allcss.jsp" %>
</head>
<body>
     <c:if test= "${empty doctObj}">
		<c:redirect url="../user_login.jsp"></c:redirect>
	</c:if>
	
	 <%@include file="navbar.jsp" %>
	   
	   <div class="container-fulid backImg p-5">
			<p class="text-center fs-2 text-white"></p>
		</div>
		
		  <div class="container p-3">
			<div  class="row">
			  
			  <div class="col-md-6 offset-md-3">
					<div class="card paint-card">
						<div class="card-body">
							<p class="text-center fs-3">Patient comment</p>
							
							
							<% int id = Integer.parseInt(request.getParameter("id"));
							AppointmentDao dao = new AppointmentDao(DBConnect.getConn());
							Appointment ap=dao.getAppointmentById(id);  %>
							  
							  	<form class="row" action="../updateStatus" method="post">
							  	    <div class="col-md-6">
									<label >Patient Name</label>
									<input  type="text" readonly value="<%=ap.getFullname() %>" class="form-control" >
								</div>
								
								<div class="col-md-6">
									<label >Age</label>
									<input  type="text" readonly value="<%=ap.getAge() %>" class="form-control" >
								</div>
								
								<div class="col-md-6">
									<label >Mob no</label>
									<input  type="text" readonly value="<%=ap.getPhNo() %>" class="form-control" >
								</div>
								
								<div class="col-md-6">
									<label >Diseases</label>
									<input  type="text" readonly value="<%=ap.getDiseases() %>" class="form-control" >
								</div>
								
								<div class="col-md-6">
								<br>
									<label >Comment</label>
									<textarea required name="comm" class="form-control" row="3" cols=""></textarea>
								</div>
								
								
									<input  type="hidden" name ="id" value="<%=ap.getId() %>" >
									<input type="hidden" name="did" value="<%=ap.getDoctorId()%>">
									<button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
								
						</form>
							
			       </div>
			    </div>
			  </div>
		</div>
	</div>
</body>
</html>