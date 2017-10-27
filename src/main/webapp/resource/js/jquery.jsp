<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

	//window.addEventListener("load", function(){
	$(function(){
		//DOM객체를
		//var _chButton = document.querySelector("#ch-button");
		
		//jQuery객체로 바꾸는 방법1 : jQuery함수 이용하기
		//var chButton = jQuery(_chButton);
		
		//jQuery객체로 바꾸는 방법2 : $함수 이용하기
		//var chButton = $(_chButton);
		
		//jQuery객체로 바꾸는 방법3 : CSS SELECTOR 이용하기
		var chButton = $("#ch-button");
		
		//이벤트 바인딩 두 가지 옵션 : 첫번째, 범용 이벤트 바인딩 함수 on()
		/* chButton.on("click", function(){
			alert("aa");
		});
		 */
		//이벤트 바인딩 두가지 옵션 : 두번째, 특수 이벤트 바인딩 함수 click/keydown ... ()
		chButton.click(function(){
			//alert("aa");
			//여러개의 스타일을 설정해야 하는 경우 : 방법 1
			//$("#p").css("background", "red");
			//$("#p").css("font-size", "25px");
			
			
			//여러개의 스타일을 설정해야 하는 경우 : 방법 2
			$("#p").css({
				background : "red",
				"font-size" : "25px"
			});
		});
		
	});
	
	  //--속성변경예제 --
	   $(function() {
	      var chImgButton = $("#ch-img-button");
	      var container = $("#img-container");   
	      var img = $("img");
	      var imgSrc = $("#img-src");

	      chImgButton.click(function() {
	         img.attr("src", imgSrc.val());
	      });
	   });
	
	   //자식 노드 변경  예제--------------------------------------------------
		
		$(function(){
			var chNodeButton = $("#ch-node-button");
			var container = $("#ch-node-container");
			
			
			chNodeButton.click(function(){
				
				//1. 텍스트 노드 추가
				//container.textContent = "<h1>hoho</h1>"; 태그 그대로
				container.text("<h1>hoho</h1>");
				
				//2. 엘리먼트 노드 추가
				//container.innerHTML = "<h1>hoho</h1>";
				//container.html("<h1>hoho</h1>");    //태그는 인식한다.
			});
		});
	   
	   
	   //텍스트 노드 추가 예제---------------------------------------------
		$(function() {
			   var addTextNodeButton = $("#add-text-node-button");
			   var addImgNodeButton = $("#add-img-node-button");
			   var removeNodeButton = $("#remove-node-button");
			   var container = $("#node-container");   
			   
			   var remove = function(e){
			      //container.removeChild(e.target);
			      container.removeChild(this);
			   }
			   var idx = 0;
			   
			   addTextNodeButton.click(function() {
			      //1.TextNode 생성
			      var span = $('<span/>');
			      var txt = '안녕하세여'+ idx++;
			      //2. container(부모) 얻기
			      //3. 부모에 자식을 추가
			      span.append(txt);
			      container.append(span);
			      
			      span.click(remove);
			      
			   });
			   
			   addImgNodeButton.click(function() {
			      //How to 1(성능에 좋음)
			      //1 Element 생성
			      //이 방법은 너무 DOM을 사용하는 스타일로 구현 한 코드
			      /* var img = $('<img />');
			      img.attr("src", "http://t1.daumcdn.net/thumb/R1024x0/?fname=http://cfile25.uf.tistory.com/image/2239B038579139CF067E3D");
			      container.append(img);
			      img.click(remove); */
			      
			      //jquery는 반환값을 .찍어서 계속 이어쓸 수 있다. 
			      $("<img src='http://t1.daumcdn.net/thumb/R1024x0/?fname=http://cfile25.uf.tistory.com/image/2239B038579139CF067E3D' />")
			      .appendTo(/* 부모 */container)
			      .click(remove);
			      
			      
			      //How to 2 (성능에 좋지 않지만 편리함.-> 한두개 넣는 상황의 성능에 영향을 주지 않을 거라면 이를 사용)
			      //container.innerHTML += '<img onClick="remove()" src="http://t1.daumcdn.net/thumb/R1024x0/?fname=http://cfile1.uf.tistory.com/image/2134514F579B4C7D165741" />';
			      
			      
			   });
			   
			   removeNodeButton.click$(function() {
			      // 1. 내정된 노드를 지우기
			      if(container.hasChildNodes()){
			         container.removeChild(container.lastChild);
			      }
			      // 2. 선택된 노드를 지우기
			      
			   });
			});
	
	
	
</script>
</head>
<body>
	<!--텍스트 노드 추가 예제 -->
   <input id="add-text-node-button" type="button" value="텍스트노드 추가" />
   <input id="add-img-node-button" type="button" value="이미지노드 추가" />
   <input id="remove-node-button" type="button" value="노드 삭제" />
   <div id="node-container"></div>
   <hr />


	<!--자식노드변경예제 -->
   <input id="ch-node-button" type="button" value="자식노드 변경" />
   <div id="ch-node-container">hello</div>
   <hr />


	<!-- 속성 변경 예제-------------------------------------------------- -->
	<input id="img-src" type="text" value=""/>
	<input id="ch-img-button" type="button" value="이미지 변경"/>
	<div id="img-container">
		<img src="https://www.i-boss.co.kr/design/upload_file/__HTMLEDITOR__/gkatldrmf/bp5b9kljj9469gdqhhh1udg5b1_15082054324514.jpg"/>
	</div>
	
	<hr/>


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