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
			   
			   removeNodeButton.click(function() {
			      // 1. 내정된 노드를 지우기
			      /* if(container.hasChildNodes()){
			         container.removeChild(container.lastChild);
			      } */

			      
			      // 2. 선택된 노드를 지우기
			      // 자식노드가 span으로 감싸진 text일수도있고 img일수도 있기때문에
			      // *을 써주거나 생략해주면 된다.
			      //$("#node-container :last-child").remove();
			      //jquery방식
				   /* $("#node-container")
				   .children()
				   .last()
				   .remove(); */
				   
				   //하나의 jquery객체는 여러개의 DOM을 담을 수 있는 컬렉션의 기능을 가지고있다.
				   //eq(n)은 n+1번째 DOM을 선택할 수 있는 함수이다.
				   //$("#node-container img").eq(0).attr("src", "data:image/jpeg;base64,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");
				   
				   //DOM방식 => get(n)
				   //$("#node-container img").get(0).src="data:image/jpeg;base64,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";
			      
				   //selector로 선택한 DOM의 수만큼 index가 자동적으로 바뀔때마다 각각 함수의 내용을 실행해준다. 
				   $("#node-container img").each(function(index){ 
					   
				   		$(this).remove(); //this는 DOM형식으로 존재
					   
				   });
				   
				   
			   });
			});
	
		//!--노드 바꾸기 예제 -->
		window.addEventListener("load", function() {
		   var swapNodeButton = document.querySelector("#swap-node-button");
		   var container = document.querySelector("#swap-node-container");   
		   
		   swapNodeButton.onclick = function() {
		      var nodes = container.getElementsByTagName("img");
		      
		      var node1 = nodes[0];
		      var node2 = nodes[1];
		      var node3 = nodes[2];
		      
		      /* var node1 = container.firstElementChild;
		      var node3 = container.lastElementChild; */
		      //var oldNode = container.replaceChild(node1, node3);
		      //container.insertBefore(node3, container.firstChild);
		      var oldNode = container.replaceChild(node2, node3);
		      container.insertBefore(node3, container.firstElementChild);
		   };
		});   
	
	
</script>
</head>
<body>
	<!--노드 바꾸기 예제 -->
   <input id="swap-node-button" type="button" value="노드 바꾸기" />
   <div id="swap-node-container">
      <img src="../images/answeris.png" /><img src="../images/w3c.png" /><img
         src="../images/wikibook.png" />
   </div>
   <hr />

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