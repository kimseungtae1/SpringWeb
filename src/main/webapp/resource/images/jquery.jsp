<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">
window.onload = function(){
	//DOM객체를
	var _chButton = document.querySelector("#ch-button");
	
	//jQuery객체로 바꾸는 방법1 : jQuery함수 이용하기
	var chButton = jQuery(_chButton);
	
	//jQuery객체로 바꾸는 방법2 : $함수 이용하기
	var chButton = $(_chButton);
	
	//jQuery객체로 바꾸는 방법3 : CSS SELECTOR 이용하기
	var chButton = $("#ch-button");
	
};
	
	
	
	
</script>
</head>
<body>

	<!-- 노드 순회 예제-------------------------------------------------- -->
	<input id="ch-button" type="button" value="배경색 변경" />
	<div>
		<div>1</div>
		<div id="p">
			<div>2</div>
			<!-- comment -->
		</div>
		<div>3</div>
	</div>

	<hr />
	

</body>
</html>