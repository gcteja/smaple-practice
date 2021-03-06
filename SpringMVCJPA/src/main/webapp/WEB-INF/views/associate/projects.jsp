<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page contentType="text/html" pageEncoding="UTF-8" isELIgnored="false" %>
<html>
<head>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.13/js/jquery.dataTables.min.js"></script>
<script type="text/javascript"  src="https://cdn.datatables.net/1.10.13/js/dataTables.jqueryui.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/dataTables.jqueryui.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<title>Projects</title>
<script>
  $(document).ready( function() {
	  $.ajaxSetup({ cache: false });
	  	$("#projectsTable").dataTable({  		
   		"aaSorting": [[ 1, "desc" ]], 		
		"iDisplayLength": 10,	
		"oLanguage": { "sSearch": "Filter results: "}
	});	

	  	$( "#projectsTable tbody tr" ).click( function() {
	      var projectId = $(this).data( "profileKey" );
			 /* document.location.href = "getProject.html?projectId=" + projectId + "&ctsId="+$("#ctsId").val(); */
	  		document.location.href = "getProject.html?projectId=" + projectId;
	    });
	  	
	  	$("#addProjectBtn").click(function(){
			
			document.location.href = "addProject.html";
		});
  });
</script>
</head>
<style>
body {
    background-color: powderblue;
  }
table {
    width: auto;
    margin-left: auto;
    margin-right: auto;
}
h1 {
  text-align: center;
  font-family: Helvetica, Geneva, Arial,
        SunSans-Regular, sans-serif }
</style>
<body>
<div>	
	<h1>Projects</h1>
	<div style="float: right;" ><a href="home.html?uname=${user.ctsId}">Home</a></div><br>
	<div style="float: right;" ><a href="login.html">Logout</a></div> <br>
	<div style="float: right;" id="addProjectBtn"><input type="button" value="Add Project"/></div>
	<br>
		<%-- <input type="hidden" id="ctsId"  value="${ctsId}"> --%>
	<table id="projectsTable" style="width:100%; display: block;" class="display">
		<thead>
			<tr>
				<!-- <th>Department</th>
				<th>Client</th>
				<th>Sector</th>
				<th>UBS Service Line</th>
				<th>UBS Segment</th>
				<th>Sub Sector</th> -->
				
				<th>Project Id</th>
				<th>Project Name</th>
				<th>Process</th>
				<th>Sector</th>
				<th>Sub Sector</th>
				<!-- <th>Region</th> -->
				<th>Project Manager CTS ID</th>
				<th>Project Manager Name</th>
				<th>Delivery Lead CTS ID</th>
				<th>Delivery Lead Name</th>
				<th>Account ID</th>
				<th>Account Name</th>
				<th>Account Manager CTS ID</th>
				<th>Account Manager Name</th>
				<th>Project Billable Status</th>
				<th>Active Status</th>
				<th>Effective Date</th>
				<th>Expiry Date</th>
				<th>Updated By</th>
				<!-- <th>Updated Date</th> -->
			</tr>
		</thead>
		<tbody>
			<c:forEach var="project" items="${projects}" varStatus="idx">
			<tr data-profile-key="${project.projectId}" style="cursor: pointer;color: blue;">
					
					<td>${project.projectId}</td>
					<td style="text-transform: capitalize;">${project.project_Name}</td>
					<td style="text-transform: capitalize;">${project.processName}</td>
					<td style="text-transform: capitalize;">${project.sector_Name}</td>
					<td style="text-transform: capitalize;">${project.sub_Sector_Name}</td>
					<%-- <td style="text-transform: capitalize;">${project.region}</td> --%>
					<td style="text-transform: capitalize;">${project.projectManagerCTSId}</td>
					<td style="text-transform: capitalize;">${project.project_Manager_Name}</td>
					<td>${project.delivery_Lead_CTS_Id}</td>
					<td style="text-transform: capitalize;">${project.delivery_Lead_Name}</td>
					<td>${project.account_Id}</td>
					<td style="text-transform: capitalize;">${project.account_Name}</td>
					<td style="text-transform: capitalize;">${project.account_Manager_CTS_Id}</td>
					<td style="text-transform: capitalize;">${project.account_Manager_Name}</td>
					<td style="text-transform: capitalize;">${project.project_Billable_Status}</td>
					<td style="text-transform: capitalize;">${project.active_Status}</td>
					<td>${project.effective_Date}</td>
					<td>${project.expiry_Date}</td>
					<td>${project.updated_By}</td>
					<%-- <td>${project.updated_Date}</td> --%>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
</body>
</html>