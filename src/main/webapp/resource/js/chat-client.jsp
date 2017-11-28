<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="id" value="kst"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<script type="text/javascript">				
window.addEventListener("load", function(){
	var id = '${id}';
	//alert(id);
	var chatList = document.querySelector("#chat-list")
	var chatText = document.querySelector("#chat-text")
	var sendButton = document.querySelector("#send-button")
	var socket = null;
	var connButton = document.querySelector("#conn-button");
	
	sendButton.onclick = function(){
		var data = {id:id, text:chatText.value}
		socket.send(JSON.stringify(data));
		//alert(JSON.parse(data));
		//alert(chatText.value);
	};
	connButton.addEventListener("click",function(e){
			/* alert("yse yo"); */
			//socket = new WebSocket("ws://211.238.142.89:80/SpringWeb/resource/chat-server");
			socket = new WebSocket("ws://211.238.142.89:80/SpringWeb/resource/chat-server");
			socket.onopen = function(evt){
				alert("연결됨");
				var li = document.createElement("li");
				li.textContent = "접속되었습니다.";
				
				chatList.appendChild(li);
			};/*연결될때*/
			socket.onmessage = function(evt){
				//서버에서 메세지를 받는다.
				var li = document.createElement("li");
				var data = JSON.parse(evt.data);
				li.textContent = data.id + ":" + data.text;

				chatList.appendChild(li);
				
			};
			
			//자기에 대한 연결이 끊겼을때
			socket.onclose= function(evt){
				var li = document.createElement("li");
				li.textContent = "서버와 내 연결이 종료되었습니다.";

				chatList.appendChild(li);
			};/*연결이 끊어질 떄*/
		});
	
});
	
</script>
<body>
	<div style="border: 1px solid #e9e9e9;
				background:pink;
				width: 300px;
				height: 500px;
				padding: 10px;
				">
		<div>
			<input id="conn-button" type="button" value="연결"/>
		</div>
	
		<div 
		style="border: 1px solid #e9e9e9;
		border: 1px solid #e9e9e9; 
		height: 430px;
		background: white;
		">
		<ul id="chat-list" >
		<li></li>
		</ul>
			
		</div>
	
		<div style="border: 1px solid #e9e9e9;
				height: 50px;
				background:  white;">
			<textarea id="chat-text" style="width: 98.7%;height: 90%;"></textarea>
			<input type="button" value="send" id="send-button"> 
		</div>
	</div>
</body>
</html>