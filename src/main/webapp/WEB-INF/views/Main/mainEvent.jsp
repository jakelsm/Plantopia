<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Plantopia Event!</title>
<link rel="icon" href="/img/favicon.ico">
</head>
<script>
	function goToNotice() {
		  if (window.opener && !window.opener.closed) {
		    window.opener.location.href = '${pageContext.request.contextPath}/NoticeDetail?n_idx=1';
		  }
		  window.close();
		}
	
		function closePopup() {
		  if (document.getElementById("noToday").checked) {
		    var date = new Date();
		    date.setDate(date.getDate() + 1);
		    document.cookie = "hideEventPopup=true; path=/; expires=" + date.toUTCString();
		  }
		  window.close();
		}
</script>
<body>
	<a href="#" onclick="goToNotice(); return false;">
	<img src="${pageContext.request.contextPath}/img/mainpage/eventimage.png" alt="event" style="width: 600px;">
	</a>
	<label><input type="checkbox" id="noToday"> 오늘 하루 이 창을 다시 보지 않기</label>
  	<button onclick="closePopup()">닫기</button>
</body>
</html>