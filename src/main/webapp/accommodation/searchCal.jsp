<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.js"></script>
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/fullcalendar@5.11.0/main.min.css">
<title>Insert title here</title>
<style type="text/css">
	
</style>
<script>

	document.addEventListener('DOMContentLoaded', function() {
		
		var calendarEl = document.getElementById('calendar');
		var calendarEl2 = document.getElementById('calendar2');
		var today = new Date();
		var year = 0;
		var month = 0;
		let checkDate={
				start:null,
				end:null
		};
		if(today.getYear()==12){
			year = today.getFullYear()+1;
			month=1;
		}else{
			year = today.getFullYear();
			month = today.getMonth()+1;
		}
		var date = today.getDate();
		var calendar = new FullCalendar.Calendar(calendarEl, {
		   headerToolbar: {
		      left: 'title',
		      right:false
		   },
		   initialView: 'dayGridMonth',
		   contentHeight:410,
		   selectable: false,
		   dateClick: function(info){
			   let fcDayElements = document.querySelectorAll(
					    ".fc-daygrid-day.fc-day"
			   );
			   let current = info.dateStr;
			 if(checkDate['start']==null&&checkDate['end']==null){
				 info.dayEl.style.backgroundColor = 'pink';
				 checkDate = {
						 start : info.dateStr,
						 end:null
				 };
				 console.log(checkDate);
			 }else if(current == checkDate['start']){
				 fcDayElements.forEach((element, key, parent) => {
					    element.style.backgroundColor = "";
					  });
				 checkDate ={};
				 console.log(checkDate);
			 }else if(current == checkDate['end']){
				 info.dayEl.style.backgroundColor = '';
				 checkDate['end']=null;
				 console.log(checkDate);
			 }else if(current<checkDate['start']&&checkDate['end']==null){
				 info.dayEl.style.backgroundColor='pink';
				 let temp = checkDate['start'];
				 checkDate['start'] = info.dateStr;
				 checkDate['end']=temp;
				 console.log(checkDate);
			 }else if(current>checkDate['start']&&checkDate['end']==null){
				 info.dayEl.style.backgroundColor='pink';
				 checkDate['end'] = info.dateStr;
				 console.log(checkDate);
			 }else{
				 fcDayElements.forEach((element, key, parent) => {
					    element.style.backgroundColor = "";
					  });
				 checkDate ={};
				 info.dayEl.style.backgroundColor = 'pink';
				 checkDate['start'] = info.dateStr;
				 console.log(checkDate);

			 }
			 document.querySelector("#check").value = checkDate['start']+"~"+checkDate['end'];
		   },

		   });
		calendar.render();
		var calendar2 = new FullCalendar.Calendar(calendarEl2, {
			   headerToolbar: {
			      left: 'title',
			      right:'prev,next'
			   },
			   initialView: 'dayGridMonth',
			   initialDate: new Date(year,month,date),
			   contentHeight:410,
			   selectable: false,
			   dateClick: function(info){
				   let fcDayElements = document.querySelectorAll(
						    ".fc-daygrid-day.fc-day"
				   );
				   let current = info.dateStr;
				 if(checkDate['start']==null&&checkDate['end']==null){
					 info.dayEl.style.backgroundColor = 'pink';
					 checkDate = {
							 start : info.dateStr,
							 end:null
					 };
					 console.log(checkDate);
				 }else if(current == checkDate['start']){
					 fcDayElements.forEach((element, key, parent) => {
						    element.style.backgroundColor = "";
						  });
					 checkDate ={};
					 console.log(checkDate);
				 }else if(current == checkDate['end']){
					 info.dayEl.style.backgroundColor = '';
					 checkDate['end']=null;
					 console.log(checkDate);
				 }else if(current<checkDate['start']&&checkDate['end']==null){
					 info.dayEl.style.backgroundColor='pink';
					 let temp = checkDate['start'];
					 checkDate['start'] = info.dateStr;
					 checkDate['end']=temp;
					 console.log(checkDate);
				 }else if(current>checkDate['start']&&checkDate['end']==null){
					 info.dayEl.style.backgroundColor='pink';
					 checkDate['end'] = info.dateStr;
					 console.log(checkDate);
				 }else{
					 fcDayElements.forEach((element, key, parent) => {
						    element.style.backgroundColor = "";
						  });
					 checkDate ={};
					 info.dayEl.style.backgroundColor = 'pink';
					 checkDate['start'] = info.dateStr;
					 console.log(checkDate);

				 }
				 document.querySelector("#check").value = checkDate['start']+"~"+checkDate['end'];
			   },
			   
		});
		calendar2.render();
		
	});
	
</script>
<style>
* {
	box-sizing: border-box;
}
.modal-container{
   visibility : hidden;  
  position: fixed; 
  z-index: 1; 
  padding-top: 120px; 
  left: 0;
  top: 0;
  width: 100%; 
  height: 100%; 
  overflow: auto; 
  background-color: rgb(0,0,0); 
  background-color: rgba(0,0,0,0.4);
} 

#calendar{
	display:inline-block;
 	background-color: #fefefe;
 	margin: 0 auto;
  	padding: 20px;
	width: 30%;
}
#calendar2{
	display:inline-block;
 	background-color: #fefefe;
 	margin: 0 auto;
  	padding: 20px;
	width: 30%;
}

</style>
</head>
<body>
<div class = "modal-container">
		<div id='calendar'></div>
		<div id ='calendar2'></div>
</div>		
</body>
</html> 