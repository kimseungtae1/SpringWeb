<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>
	<div style="border: 1px solid #e9e9e9; 
				background:orange;
				width: 300px; 
				height: 500px; 
				padding: 10px;">
		<div>
			<input id="con-button" type="button" value="접속(연결)"/>
		</div>
		<div id="chat-list" style="border: 1px solid #a9a9a9;
									height:calc(500px - 10px - 10px - 50px - 10px - 10px);
									background: white;">
		
		</div>
		<div style="border: 1px solid #e9e9e9; 
					height:50px;
					background: white;">
			<textarea id="chat-text" style="width: 100%; height: 100%;"></textarea>
		</div>
	</div>
</body>
<script type="text/javascript">
	window.addEventListener("load", function(event){
		var conButton = document.querySelector("#con-button");
		var socket = null;
		
		conButton.onclick = function(e){
			socket = new Websocket("ws://newlec.newlecture.com/SpringMVC/chat-server");//웹소켓은 포트번호와 아이피가 아닌 url을 통해 접속을 한다.
			
			socket.onopen = function(evt){//소켓이 연결되었을때
				alert("연결되었습니다.");
			};
			
			socket.onmessage = function(evt){//메세지가 전송될때... 제일많이 호출된다!!
				
			};

			socket.onclose = function(evt){//소켓이 끊겼을때
			};
		};
	});
</script>
</html>