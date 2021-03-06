<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js" ></script>
<script src="../resources/js/jquery.validate.js" type="text/javascript"></script>
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
        SunSans-Regular, sans-serif
     }
  div.error { color:red; font-weight: bold; font-size: 14px; }
</style>
<html>
<head><title>Add Associate</title></head>
<script type="text/javascript">
$(document).ready(function () {
	$("#addAssociateForm").validate({
	    rules: {
	    	associateCTSId: {required:true, minlength:6, maxlength:6, number:true},
	    	full_Name: {required:true},
	    	gender: {required:true},
	    	marital_Status: {required:true},
	    	associate_Status: {required:true},
	    	projectId: {required:true},
	    	project_Name: {required:true, maxlength: 100},
	    	process: {required:true, maxlength: 100},
	    	billability_Status: {required:true},
	    	billability_Grade: {required:true},
	    	supervisor_CTS_Id:{number: true},
	    	supervisor_GPIN:{number: true},
	    	project_Manager_GPIN:{number: true},
	    	BCP_Critical_Status: {required:true},
	    	seatNumber: {required:true, minlength:16, maxlength:16},
	    	shift_Timing: {required:true}
	    	
	      },    	      
	    errorElement: "div",
	    submitHandler: function(form) {
		   	var formData = $("#addAssociateForm").serialize();	
		   	$.ajax({  
	      		type: "POST",
	            url: "addNewAssociate",//form.attr('action'),	            
	            data : formData,
	            success : function(result){	            	
		          	alert(result); 
		          	window.location.href="getAssociates.html?projectId=" + $("#projectId").val();
    			},
	            error : function(callback){
	            	alert("Error saving associate777!");	            	
	            }
	       	});
	    } 
	});	
	
	/* $("#associateCTSId").change(function () {
	    var associateCTSId = this.value;
	    alert("alsjfa="+associateCTSId);
	    if(associateCTSId != ""){
	    $.ajax({        	
	        type: "GET",
	        url: "checkCtsId.html?associateCTSId="+ associateCTSId,
	        success : function(data){
	        	if(data != "correct")
	        		alert("CTS Id already exists!");
	        }
	   	}); 
	    }
	  }); */
	
	$("#projectId").change(function () {
	    var projectId = this.value;
	    $.ajax({        	
	        type: "GET",
	        url: "getProjectDetails.html?projectId="+projectId,
	        success : function(data){
	        	var values=data.split(',');
	        	$("#project_Name").val(values[0]);
	        	$("#process_Code").val(values[1]);
	        	$("#process").val(values[2]);
	        	$("#sub_Process_Code").val(values[3]);
	        	$("#sub_Process").val(values[4]);
	        	$("#project_Manager_CTS_Id").val(values[5]);
	        	$("#project_Manager_GPIN").val(values[6]);
	        	$("#project_Manager_Name").val(values[7] + "," + values[8]);
	     		
	        	/* $.ajax({        	
	    	        type: "GET",
	    	        url: "getSubProcesses.html?processCode="+ values[1],
	    	        success : function(data){
	    	        	if(data != "correct")
	    	        		alert("Please enter date in 'YYYY-MM-DD' format");
	    	        }
	    	   	});  */
	        	
	        }
	   	}); 
	  });
	  
	  $("#shift_Timing").change(function () {
		    var shiftTimings = this.value;
		    var seatNumber = $("#seatNumber").val();
		    if(seatNumber ==""){
		    	alert("Please enter Seat Number");
		    	$("#shift_Timing").val("");
		    }else{
		    $.ajax({        	
		        type: "GET",
		        url: "checkSeatNumber.html?seatNumber="+ seatNumber,
		        success : function(data){
		        	if(data == "exists")
		        		alert("Seat number already allocated!");
		        	if(data == "incorrect")
		        		alert("Please enter correct seat number!");
		        }
		   	}); 
	  }
		  });
	
	$("#Cts_DOJ").change(function () {
	    var doj = this.value;
	    if(doj != ""){
	    $.ajax({        	
	        type: "GET",
	        url: "checkDateFormat.html?doj="+ doj,
	        success : function(data){
	        	if(data != "correct")
	        		alert("Please enter date in 'YYYY-MM-DD' format");
	        }
	   	}); 
	    }
	  });
	
	$("#UBS_Latest_Hire_Date").change(function () {
	    var doj = this.value;
	    if(doj != ""){
	    $.ajax({        	
	        type: "GET",
	        url: "checkDateFormat.html?doj="+ doj,
	        success : function(data){
	        	if(data != "correct")
	        		alert("Please enter date in 'YYYY-MM-DD' format");
	        }
	   	}); 
	    }
	  });
  $("#CTS_Grade_Effective_Date").change(function () {
	    var doj = this.value;
	    if(doj != ""){
	    $.ajax({        	
	        type: "GET",
	        url: "checkDateFormat.html?doj="+ doj,
	        success : function(data){
	        	if(data != "correct")
	        		alert("Please enter date in 'YYYY-MM-DD' format");
	        }
	   	}); 
	    }
	  });
  $("#billability_Effective_Date").change(function () {
	    var doj = this.value;
	    if(doj != ""){
	    $.ajax({        	
	        type: "GET",
	        url: "checkDateFormat.html?doj="+ doj,
	        success : function(data){
	        	if(data != "correct")
	        		alert("Please enter date in 'YYYY-MM-DD' format");
	        }
	   	}); 
	    }
	  });
  $("#block_Leave_From").change(function () {
	    var doj = this.value;
	    if(doj != ""){
	    $.ajax({        	
	        type: "GET",
	        url: "checkDateFormat.html?doj="+ doj,
	        success : function(data){
	        	if(data != "correct")
	        		alert("Please enter date in 'YYYY-MM-DD' format");
	        }
	   	}); 
	    }
	  });
  $("#block_Leave_To").change(function () {
	    var doj = this.value;
	    if(doj != ""){
	    $.ajax({        	
	        type: "GET",
	        url: "checkDateFormat.html?doj="+ doj,
	        success : function(data){
	        	if(data != "correct")
	        		alert("Please enter date in 'YYYY-MM-DD' format");
	        }
	   	}); 
	    }
	  });
 /*  $("#movement_Effective_Date").change(function () {
	    var doj = this.value;
	    $.ajax({        	
	        type: "GET",
	        url: "checkDateFormat.html?doj="+ doj,
	        success : function(data){
	        	if(data != "correct")
	        		alert("Please enter date in 'YYYY-MM-DD' format");
	        }
	   	}); 
	  }); */
	  
 $("#supervisor_CTS_Id").change(function () {
	 var supervisorId = this.value;
	    $.ajax({        	
	        type: "GET",
	        url: "getSupervisorDetails.html?supervisorId="+supervisorId,
	        error: function(){
	        	alert("Supervisor CTS Id is Invalid");
	        },
	        success : function(data){
	        	var values=data.split(',');
	        	$("#supervisor_GPIN").val(values[0]);
	        	$("#supervisor_Name").val(values[1]);
	        }
	   	}); 
  }); 
	  
	  $("#associateCTSId").change(function () {
		   	$.ajax({        	
		        type: "GET",
		        url: "checkCtsId.html?associateCTSId="+ $("#associateCTSId").val(),
		        success : function(data){
		        	if(data != "correct"){
		        		alert("CTS Id already exists!");
		        		$("#associateCTSId").val("");
		        		return false;
		        	}
			        }
			   	}); 
		  }); 
  
$("#saveBtn").click(function(e){
	e.preventDefault();
	$("#addAssociateForm").submit();
});

});	
</script>
<body>
<h1>Add Associate</h1>
<div style="float: right;" ><a href="getAssociates.html">Go back</a></div>
<form:form commandName="associate" id="addAssociateForm" name="addAssociateForm" method="post">
		<form:errors path="*"/>
		<%-- <form:hidden path="CTS_Grade_Code"/> --%>
		<form:hidden path="process_Code"/>
		<form:hidden path="sub_Process_Code"/>
		<%-- <form:hidden path="team_Code"/>
		<form:hidden path="region_Code"/> --%>
		<form:errors path="*"/>
		<table style="width: 50%;">
		<tbody>
			<tr>
				<td>Associate CTS ID</td> 
				<td ><form:input path="associateCTSId" style="width: 300px;"/></td>
			</tr>
			<tr>
				<td>GPIN</td>
				<td><form:input path="GPIN" style="width: 300px;" /></td>
			</tr>
			<tr>
				<td>First Name</td>
				<td><form:input path="first_Name" style="width: 300px;"/></td>
			</tr>
			<tr>
				<td>Middle Name</td>
				<td><form:input path="middle_Name" style="width: 300px;"/></td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><form:input path="last_Name" style="width: 300px;" /></td>
			</tr>
			<tr>
				<td>Full Name</td>
				<td><form:input path="full_Name" style="width: 300px;"/></td>
			</tr>
			<tr>
				<td>Gender</td>
				<td>
				<form:select path="gender" style="width: 300px;">
					<form:option value="">Select</form:option>
					<form:option value="Male">Male</form:option>
					<form:option value="Female">Female</form:option>
				</form:select>
				<%-- <form:input path="gender" style="width: 300px;" /> --%>
				</td>
			</tr>
			<tr>
				<td>Marital Status</td>
				<td>
				<form:select path="marital_Status" style="width: 300px;">
					<form:option value="">Select</form:option>
					<form:option value="Married">Married</form:option>
					<form:option value="Single">Single</form:option>
				</form:select>
				<%-- <form:input path="marital_Status" style="width: 300px;" /> --%>
				</td>
			</tr>
			<tr>
				<td>CTS DOJ</td>
				<td><form:input path="Cts_DOJ" style="width: 300px;"/></td>
			</tr>
			<tr>
				<td>UBS Latest Hire Date</td>
				<td><form:input path="UBS_Latest_Hire_Date" style="width: 300px;"/></td>
			</tr>
			<tr>
				<td>Associate Status</td><td><form:select path="associate_Status" style="width: 300px;">
					<form:option value="">Select</form:option> 
					<form:options items="${associate.associateStatus}"/>
					</form:select>
			</tr>
			<tr>
				<td>Parent working PId</td>
				<td><form:select path="projectId" style="width: 300px;">
					<form:option value="">Select</form:option>
					<form:options items="${associate.projectIds}"/>
						
	                 </form:select>
			</td>
				<%-- <td><form:input path="projectId"></td> --%>
			</tr>
			<tr>
				<td>Project Name</td><td><form:input path="project_Name" style="width: 300px;background-color: #bcc7d6" readonly="true"/></td>
			</tr>
			<tr>
				<td>Process</td><td><form:input path="process" style="width: 300px;background-color: #bcc7d6" readonly="true"/></td>
			</tr>
			<tr>
				<td>Sub Process</td><td><form:input path="sub_Process" style="width: 300px;background-color: #bcc7d6" readonly="true"/></td>
			</tr>
			<tr>
				<td>Team</td><td><form:input path="team" style="width: 300px;"/></td>
			</tr>
			
			<tr>
				<td>Region</td>
				<td><form:select path="region" style="width: 300px;">
					<form:option value="">Select</form:option> 
					<form:options items="${associate.regions}"/>
					</form:select>
	             </td>
			</tr>
			<tr>
				<td>CTS Grade</td>
				<td><form:select path="CTS_Grade" style="width: 300px;">
					<form:option value="">Select</form:option> 
					<form:options items="${associate.cTSGrades}"/>
					</form:select>
	             </td>
	       </tr>
			<tr>
				<td>CTS Grade Effective Date</td>
				<td><form:input path="CTS_Grade_Effective_Date" style="width: 300px;"/></td>
				
			</tr>
			<tr>
				<td>Billability Status</td>
				<td><form:select path="billability_Status" style="width: 300px;">
					<form:option value="">Select</form:option> 
					<form:options items="${associate.associateBillabilityStatus}"/>
						
	                 </form:select>
	             </td>
				
			</tr>
			<tr>
				<td>Billability Grade</td>
				<td><form:select path="billability_Grade" style="width: 300px;">
					<form:option value="">Select</form:option> 
					<form:options items="${associate.associateBillabilityGrade}"/>
						
	                 </form:select>
	             </td>
			</tr>
			<tr>
				<td>Billability Effective Date</td>
				<td><form:input path="billability_Effective_Date" style="width: 300px;"/></td>
				
			</tr>
			<tr>
				<td>Supervisor CTS Id</td>
				<td><form:input path="supervisor_CTS_Id" style="width: 300px;"/></td>
			</tr>
			<tr>
				<td>Supervisor GPIN</td>
				<td><form:input path="supervisor_GPIN" style="width: 300px;background-color: #bcc7d6" readonly="true"/></td>
			</tr>
			<tr>
				<td>Supervisor Name</td>
				<td><form:input path="supervisor_Name" style="width: 300px;background-color: #bcc7d6" readonly="true"/></td>
			</tr>
			<tr>
				<td>Project Manager CTS Id</td>
				<td><form:input path="project_Manager_CTS_Id" style="width: 300px;background-color: #bcc7d6" readonly="true"/></td>
				</tr>
			<tr>
				<td>Project Manager GPIN</td>
				<td><form:input path="project_Manager_GPIN" style="width: 300px;background-color: #bcc7d6" readonly="true"/></td>
			</tr>
			<tr>
				<td>Project Manager Name</td>
				<td><form:input path="project_Manager_Name" style="width: 300px;background-color: #bcc7d6" readonly="true"/></td>
			</tr>
			<tr>
				<td>BCP Critical Status</td>
				<td><form:select path="BCP_Critical_Status" style="width: 300px;">
					<form:option value="">Select</form:option> 
					<form:options items="${associate.BCP_Critical_Statuses}"/>
					</form:select>
	             </td>
				
			</tr>
			<tr>
				<td>Seat Number</td><td><form:input path="seatNumber" style="width: 300px;"/></td>
			</tr>
			<tr>
				<td>Shift Timing</td>
				<td><form:select path="shift_Timing" style="width: 300px;">
					<form:option value="">Select</form:option> 
						<form:options items="${associate.shiftTimings}"/>
						</form:select>
	             </td>
			</tr>
			<form:input type ="hidden" path="block_Leave_Status" style="width: 300px;"/>
			<form:input type ="hidden" path="block_Leave_From" style="width: 300px;"/>
			<form:input type ="hidden" path="block_Leave_To" style="width: 300px;"/>
			<form:input type ="hidden" path="hRi_Update_Status" style="width: 300px;"/>
			<tr>
				<td>Associate User Name</td><td><form:input path="associate_User_Name" style="width: 300px;"/></td>
			</tr>
			<tr>
				<td>VDI Number</td><td><form:input path="VDI_Number" style="width: 300px;"/></td>
			</tr>
			<tr>
				<td>Associate CTS Email ID</td><td><form:input path="associate_CTS_Email" style="width: 300px;"/></td>
			</tr>
			<tr>
				<td>Associate UBS Email ID</td><td><form:input path="associate_UBS_Email" style="width: 300px;"/></td>
			</tr>
			<tr>
				<td>Associate Contact Number</td><td><form:input path="associate_Contact_Number" style="width: 300px;"/></td>
			</tr>
			<tr>
				<td>Associate Address</td><td><form:input path="associate_Address" style="width: 300px;"/></td>
			</tr>
			<form:input type="hidden" path="updated_By" style="width: 300px;" readonly="true"/>
			<tr>
				<td style="float: right;">
				<input type="reset" id="clear"  value="Clear"/>
				<%-- <form:button id="clear" value="Clear">Clear</form:button> --%>
				</td>
				<td><form:button id="saveBtn" value="Save">Save</form:button></td>
			</tr>
	</tbody>
	</table>
</form:form>
</body>
</html>