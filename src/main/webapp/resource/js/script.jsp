<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
   /* var x,y;
   x = prompt("x값을 입력하세요", 0);
   y = prompt("y값을 입력하세요", 0);
   x = parseInt(x);
   y = parseInt(y);
   alert(x+y); */
   //var add = new Function("x, y", "return x+y;");//자바스크립트는 함수도 객체다!
   /* var add = function(){
      
      var sum = 0;
      for(var i=0; i<arguments.length; i++)
         sum+=arguments[i];
         
      return sum;
   };
   
   alert(add(3,8,10)); */
   /* function f1(){
      var a=1; //var를 붙이면 지역변수가 되버린다. var가 없으면 글로벌 변수가 된다.마치 전역변수 같은 느낌
   }
   function f2(){
      alert(a);
   }
   f1();
   f2();
    */
   /* function f1(){  
      var a = 1; //f2덕분에 지역변수가 끝까지 살아남는다.
      
      return function f2(){
         return a;
      }
   }
   var f = f1();
   var a = f();
   alert(a); */


   /* var x = 3;
   var y = new Number(3);
   alert(x===y); // 주소와 값 모두를 비교하는 연산자
   alert(x==y); */ // 값만 비교하는 연산자
   
   //alert(3+4.5);
   //alert(3+"4");
   //alert(3.5-"2");
   
   /* var data = [2,4,6,7,0];
   var entity = {id:1, title:"hello", writerId:"neclec"}; */
   /* for(var i=0; i<data.length; i++)
      alert(data[i]); */
   /* for(var i in data)
      alert(data[i]); */
      
   /* for(var k in entity)
      alert(entity[k]); */
      
   /* var x;
   alert(x == undefined); */
   
   /* var x = new Object();
   x.name = new String("hello");
   x.phone = new String("010-101-010");
   alert(x.phone);
   
   var x = {};
   x.name = "hello";
   x.phone = "010-101-010"
   alert(x.phone); */
   
   /* var json = [
               {id:"1", title:"hello", "writer id":"newlec"},
               {id:"2", title:"comeon", "writer id":"newlec"}
            ];
   alert(json[1].title);
   alert(json[1]["title"]);
   alert(json[1]["writer id"]); */
   /* var data = eval("var x=3; x++;"); */
   //var data = eval("[2,4,6]");
   //var data = JSON.parse("[2,4,6]");
   
   //var data = eval('({id:"1", title:"hello", "writer id":"newlec"})');
   /* var data = JSON.parse('{"id":1, "title":"hello", "writer id":"newlec"}');
   alert(typeof data.id); *///typeof 는 해당속성에 자료형을 알려준다. ""로 감싸져있는것은 문자열,String
                     //암것도없는것은 정수형이므로 number
   
   /* function calcApp(){
      var xText = document.getElementById("x");
      var yText = document.getElementById("y");
      var addButton = document.getElementById("add-button");
      var resultText = document.getElementById("result");
      
      addButton.onclick = addButtonClick;

      function addButtonClick(){
         var x;
         var y;
         x = parseInt(xText.value);
         y = parseInt(yText.value);
         resultText.value=x+y;
      }
   }
   
   window.onload = calcApp;
   
   <!-- timer 예제-------------------------------------------------- -->
   window.onload = function() {
	    var countLabel = document.getElementById("count-label");
		var countButton = document.getElementById("count-button");
		var timerId = null;
		
		var ex1 = document.getElementById("ex1");
		ex1.style.marginTop = "0px"; //초기화를 꼭 해야된다. 아무값도 안들어있기때문에
		
		countButton.onclick = function(){
			if(timerId == null)
				timerId = setInterval(function(){
					var count = parseInt(countLabel.textContent);
					var marginTop = parseInt(ex1.style.marginTop); //px값을 떼주기 위해 변환한다.
					
					//목표치에 도달했을경우
					if(count<=0){
						clearInterval(timerId);
						timerId = null;
					}
					
					if(marginTop >= 100){
						clearInterval(timerId);
						timerId = null;
					}
					
					//countLabel.textContent = count - 1;
					ex1.style.marginTop = (marginTop+1) + "px";
					}, 30);
		};	
		 */
		 
		 
	/* <!-- open a window 예제-------------------------------------------------- -->
	window.onload = function() {
		var openButton = document.getElementById("open-button");
		var movButton = document.getElementById("mov-button");
		var transButton = document.getElementById("trans-button");
		var iframe = window.frames[0];
		var win = null;
		var timerId = null;
		
		openButton.onclick = function(){
			if(win==null)
				win = open("notice.html","_blank", "width=500px height=300px");
		};
		
		movButton.onclick = function(){
			if(win != null || timerId == null)
				win.moveBy(-10,0);
		};
		
		transButton.onclick = function(){
			iframe.location.href="http://www.daum.net";
			//iframe.document.write("hello");
		};
	};
	
	<!-- 노드 순회 예제-------------------------------------------------- -->
	window.onload = function(){
		var chButton = document.getElementById("ch-button");
		var p = document.getElementById("p");
		
		chButton.onclick = function(){
			//p.style.background="#0000ff";
			//p["style"]["background"]="#0000ff";
			//p.style["background"]="#0000ff";
			
			//p.firstElementChild.style.border="2px solid #0000ff";
			alert(p.firstChild.nextSibling.nextSibling.nextSibling.nextSibling.nextSibling);
			for(var node = p.firstChild; node != null; node = node.nextSibling)
				alert(node.nodeType);
		};
	};
	 */
/* 	<!-- innerframe 예제-------------------------------------------------- --> */
/* 	window.onload = function() {
		var navButton = document.getElementById("nav-button");
		var win = window.frames[0];  //프레임을 배열로 가져올수있다. 
		
		navButton.onclick = function(){
			win.location.href="http://www.newlecture.com";
		};
	}; */
	
	<!-- Selector API 예제-------------------------------------------------- -->
	/* window.onload = function(){
		var chButton = document.querySelector("#ch-button1");
		//var p = document.querySelector("#module1 > div:first-child + div > div");
		var divs = document.querySelectorAll("#module1 > div");
		var p = divs[1].querySelector("div");
		
		
		chButton.onclick = function(){
			p.style.border="solid 1px red";
		};
	}; */
	
	<!-- 이미지 변경  예제-------------------------------------------------- -->
	/* window.onload = function(){
		var chImgButton = document.querySelector("#ch-img-button");
		var container = document.querySelector("#img-container");
		var img = container.querySelector("img");
		
		
		chImgButton.onclick = function(){
			img.src="data:image/jpeg;base64,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";
		};
	}; */
	
	
	/* window.onload = function(){
		var chImgButton = document.querySelector("#ch-img-button");
		var imgSrc = document.querySelector("#img-src");
		var container = document.querySelector("#img-container");
		var img = container.querySelector("img");
		
		
		chImgButton.onclick = function(){
			img.src=imgSrc.value;
		};
	}; */
	
	/* <!-- 자식 노드 변경  예제-------------------------------------------------- -->
	
	window.onload = function(){
		var chNodeButton = document.querySelector("#ch-node-button");
		var container = document.querySelector("#ch-node-container");
		
		
		chNodeButton.onclick = function(){
			//chNodeContainer.textContent = "<h1>hoho</h1>"; 태그 그대로
			container.innerHTML = "<h1>hoho</h1>";    //태그는 인식한다.
		};
	}; */
	
	/* <!-- 텍스트 노드 추가  예제-------------------------------------------------- --> */
	/* 
	window.onload = function(){
		var addTextNodeButton = document.querySelector("#add-text-node-button");
		var addImgNodeButton = document.querySelector("#add-img-node-button");
		var removeNodeButton = document.querySelector("#remove-node-button");
		var container = document.querySelector("#node-container");
		
		var remove1 = function(e){
			container.removeChild(e.target);
		};
		
		var idx = 0;
		
		addTextNodeButton.onclick = function(){
			var span = document.createElement("span");
			
			//1. TextNode 생성
			var txt = document.createTextNode("안녕하세요." + idx++);
			
			//2. container(부모)를 얻기			
			
			//3, 부모에 자식을 추가
			span.appendChild(txt);
			container.appendChild(span);
			
			span.onclick = remove1;

		};
		
		addImgNodeButton.onclick = function(){
			//how1
			/* var img = document.createElement("img");
			img.src = "https://img-wishbeen.akamaized.net/plan/1437707646107_4.png";
			
			container.appendChild(img); 
			
			//how2 간단하지만 성능면에서는 아주 좋지않다.
			container.innerHTML += '<img onclick="remove1" src="https://img-wishbeen.akamaized.net/plan/1437707646107_4.png">';
		};
		
		removeNodeButton.onclick = function(){
			// 1. 자동으로 맨 마지막 노드부터 삭제
			container.removeChild(container.lastChild);
			
			// 2. 원하는 노드를 선택해서 삭제
			
		};
	};
	 */
	
	<!-- 노드 바꾸기 예제-------------------------------------------------- -->
	window.addEventListener("load", function() {
		var swapNodeButton = document.querySelector("#swap-node-button");
		var container = document.querySelector("#node-swap-container");
		
		swapNodeButton.onclick = function(){
			//var node1 = container.querySelector("img:first-child");
			//var node3 = document.querySelector("img:last-child");
			var nodes = container.getElementsByTagName("img");
			var node1 = nodes[0];
			var node3 = nodes[2];
			var nodeNext = node1.nextElementSibling;
			
			var oldNode = container.replaceChild(node1, node3);
			container.insertBefore(node3, nodeNext);
		};
	});
	
	/*----노드 바꾸기 예제2----------*/
	window.addEventListener("load", function(e) { //함수를 누적하는 방식
		var moveUpButton = document.querySelector("#move-up-button");
		var radiobutton
		var container = document.querySelector("#move-up-container");
		var tbody = container.querySelector("tbody");
		//var td = tbody.querySelector("tr:first-child td:last-child");
		var td = tbody.firstElementChild.lastElementChild;
		
		td.addEventListener("click", function(e){
			
			e.stopPropagation();  //버블링 되는 것을 막기
			console.log("td");	
			e.target.style.background ="yellow";
		}, true);
		/*		
		var trs = container.querySelectorAll("tbody tr");
 	 	for(var i;i<trs.length;i++){
			trs[i].onclick=function(e){
				e.target.style.background ="pink";

			}
		}  */
		
		var tr = null;
		
		tbody.addEventListener("click", function(e){
			
			if(e.target.nodeName == "INPUT"){
				//alert("라디오 버튼 클릭");
				tr = e.target.parentNode.parentNode;
			}
			
		
			//alert("tbody");
			console.log("tbody");
			e.target.style.background ="green";
			//e.target.parentNode.style.background = "pink";
		},true);


		moveUpButton.onclick = function() {

			if(tr == null)
				return;
			
			var container = tr.parentNode;
			
			var bf = tr.previousElementSibling;
			var af = tr.nextElementSibling;
				
			if(bf == null || af == null)
				e.preventDefault();
			else{
				container.replaceChild(tr, bf);
				container.insertBefore(bf, af);
			}

		};

	});

	<!-- 기본 행위 막기  예제------------------>
	window.addEventListener("load", function(){
		var titleText = document.querySelector("form input[name]");
		var submitButton = document.querySelector('form input[type="submit"]');
		var cancelButton = document.querySelector("form a");
		
		submitButton.onclick = function(e){
			if(titleText.value == ""){
				alert("제목을 입력하세요.");
				e.preventDefault();
			}
		}
		
		cancelButton.onclick = function(e){
			if(titleText.value != ""){
				if(!confirm("작성중이던 입력을 취소하시겠습니까?"))
					e.preventDefault();
			}
		}
	});
	
	<!-- 노드복제 예제------------------>
	window.addEventListener("load", function(){
		var cloneButton = document.querySelector("#ex-clone input[value='단순복제']");
		var tbody = document.querySelector("#ex-clone tbody");
		
		cloneButton.onclick = function(e){
			var tr = tbody.querySelector("tr");
			
			var clone = tr.cloneNode(true);
			tbody.appendChild(clone);	
			
		};
		
	});
	
	<!-- 템플릿 태그를 이용한 노드복제 & Ajax 요청 예제------------------>
	<!-- 지원을 하지않는 브라우져도 있기 때문에 조건검사가 먼저 들어가자! -->
	window.addEventListener("load", function(){
		var cloneButton = document.querySelector("#ex2-clone input[value='단순복제']");
		var ajaxButton = document.querySelector("#ex2-clone input[value='Ajax요청']");
		var tbody = document.querySelector("#ex2-clone tbody");
		var template = document.querySelector("#ex2-clone template");
		var container = document.querySelector("#ex2-clone div:first-Child");
		
		
		var data = [
			{id:"1", title:"hihihi~", writerId:"newlec"},
			{id:"2", title:"hohoho~~", writerId:"lecnew"},
			{id:"3", title:"hhhhhh~~~", writerId:"lewnewnew"}
		];
		
		ajaxButton.onclick = function(e){
			
			/* 1. 동기형으로 문서를 요청한 방식 , 느리다!*/
			/* var xhr = new XMLHttpRequest(); //모든 브라우져에 호환되는 기능
			xhr.open("GET", "../../customer/notice-ajax", false);//주소창에 url 입력해준다. "GET방식", "상대경로", "동기냐 비동기냐"
			xhr.send();//입력한 url를 전송해준다.
			data = eval(xhr.responseText); //받아온 데이터를 객체에 넣어주기!
			 */
			 
			/* 2. 비동기형으로 문서를 요청한 방식 ,빠르지만 순서가 뒤죽박죽된다. 따라서 사건이 일어나는 시점을 신경써야한다.*/
			var xhr = new XMLHttpRequest(); 
			/* xhr.onreadystatechange = function(e){
				if(xhr.readyState == 4) //4번, 로딩될때의 시점을 설정해주는것이다.
					data = eval(xhr.responseText); 	
			}; */
			xhr.onload = function(){
				data = JSON.parse(xhr.responseText);
				// 2. ajax icon제거
				container.removeChild(container.lastChild);
			};
			
			xhr.onerror = function(e){
				alert("예기치 못한 오류가 생겼습니다.")
			};
			
			xhr.open("GET", "../../customer/notice-ajax", true);
			xhr.send();
			
			
			
			
			//1. ajax icon 추가
			var img = document.createElement("img");
			img.src = "../images/ajax-loader.gif";
			container.appendChild(img);
			
		};
		
		cloneButton.onclick = function(e){
			/* 
			// 현재 브라우저가 template 태그를 지원하는지에 대한 확인
			if('content' in template){
				//alert("aAa");
				//누적해야 할 경우
				var tds = template.content.querySelectorAll("td");
				tds[0].appendChild(document.createTextNode("1"));	//같은방법
				tds[1].textContent = "test title";					//같은방법
				tds[2].textContent = "newlec";
				
				//값이 설정된 content를 복제
				var clone = document.importNode(template.content, true);
				
				//복제된 clone(tr)을 노드 트리에 추가
				template.appendChild(clone);
				 */
				 
			// 현재 브라우저가 template 태그를 지원하는지에 대한 확인
			if('content' in template){
				//alert("aAa");
				
				for(var i=0; i<data.length; i++){
					//복제를 한 후에 content를 설정하는 경우(새롭게 덮어씌울경우)
					var clone = document.importNode(template.content, true);
					var tds = clone.querySelectorAll("td");
					tds[0].textContent = data[i].id;			//json표기법
					tds[1].textContent = data[i].title;					
					tds[2].textContent = data[i].writerId;
				
				
				
				//복제된 clone(tr)을 노드 트리에 추가
					tbody.appendChild(clone);
				}

			}
		};
		
	});
	
	
	<!-- Ajax로 파일 전송하기 & trigger와 파일 목록 뷰어------------------>
	window.addEventListener("load", function(){
		var fileInput = document.querySelector("#ex3-upload input");
		var submitButton = document.querySelector("#ex3-upload span");
		var progressBar = document.querySelector("#ex3-upload #progress-bar");
		progressBar.style.width = "0px";
		
		var fileViewer = document.querySelector("#ex3-upload ul");
		
		//파일 목록 초기화 작업
		var xhr = new XMLHttpRequest(); 
		xhr.onload = function(e){
			var files = JSON.parse(e.target.responseText);
				
			for(var i = 0;i<files.length; i++){
				var li = document.createElement("li");
				li.textContent = files[i];
				fileViewer.appendChild(li);
			}

		};
		
		xhr.open("GET", "../../file-list");
		xhr.send();
		
		
		submitButton.onclick = function(e){
			var event = new MouseEvent("click", {
					'view' : window,
					'bubbles' : true,
					'cancelbale' : true
			});
				
			
			fileInput.dispatchEvent(event);
			fileInput.onchange = function(){
				
				var file = fileInput.files[0];
				//alert(file.name);
				var formData = new FormData();
				formData.append("title", "테스트");
				formData.append("file", file);
				
				var xhr = new XMLHttpRequest(); 
				xhr.upload.onprogress = function(e){
					console.log(Math.round(e.loaded / e.total * 100) + "%");
					
					var percentage = Math.round(e.loaded / e.total * 100);
					progressBar.textContent = percentage + "%";
					progressBar.style.width = percentage*2 + "px";
				};
				
				
				xhr.onload = function(){
					
				};
				xhr.onerror = function(e){
					alert("예기치 못한 오류가 생겼습니다.")
				};
				
				xhr.open("POST", "../../upload?${_csrf.parameterName}=${_csrf.token}", true);
				xhr.send(formData);

				/* for(var key in fileInput.files[0])		//속성들 알아보는 방법
					alert(key);	 */
			};
			
			//alert("aa");
			
			
		};
	});
	
</script>
</head>
<body>

	<!-- Ajax로 파일 전송하기 & trigger와 파일 목록 뷰어------------------>
	<div id="ex3-upload">
	<input type="file" style="display: none;"/>	
	<span style="border:1px solid #999; border-radius:5px; background: pink; padding:3px; cursor: pointer;">업로드</span>
	<span id="progress-bar" style="background:green; display: inline-block;"></span>
		<%-- <form action="../../upload?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
			<div>
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
				<input type="submit" value="전송" />
				<input type="button" value=""/>
			</div>
			<div id="clone-container">
				<table border="1">
					<tbody>
						<tr>
							<td>제목</td>
							<td><input type="text" name="title"/></td>
						</tr>
						<tr>
							<td>첨부파일</td>
							<td><input type="file" name="file"/></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form> --%>
		<!--파일 목록 뷰어-->
		<div>
			<ul>
				<li></li>
			</ul>
		</div>	
	</div>
	<hr />


	<!-- 템플릿 태그를 이용한 노드복제 & Ajax 요청 예제------------------>
	<div id="ex2-clone">	
		<div>
			<input type="button" value="단순복제"/>
			<input type="button" value="Ajax요청"/>
		</div>
		<div id="clone-container">
			<table border="1">
				<thead>
					<tr>
						<td>코드</td>
						<td>제목</td>
					</tr>
				</thead>
				<tbody>
					
				</tbody>
			</table>
			
			<template>
				<tr>
					<td><input name="id" type="radio" value="1"/></td>
					<td></td>
					<td></td>
				</tr>
			</template>
		</div>
	</div>
	<hr />


	<!-- 노드복제 예제------------------>
	<div id="ex-clone">	
		<div>
			<input type="button" value="단순복제"/>
		</div>
		<div id="clone-container">
			<table border="1">
				<thead>
					<tr>
						<td>코드</td>
						<td>제목</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input name="id" type="radio" value="1"/></td>
						<td>1</td>
						<td>졸려유~~</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<hr />

	<!-- 기본 행위 막기  예제------------------>
	<form>
		<input type="text" name="title"/><br/>
		<input type="submit" value="전송"/>
		<a href="">취소</a>
		
	</form>
	<hr />
	
	<!-- 노드 바꾸기  예제2 + 이벤트 심화 : 버블링과 캡쳐링------------------>
	<!--이벤트라~~~~... ㅠㅡㅜ   -->
	<input id="move-up-button" type="button" value="위로 옮기기 " />
	<table border="1" id="move-up-container">
		<thead>
			<tr>
				<td>코드</td>
				<td>제목</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td><input name="id" type="radio" value="1"/></td>
				<td>1</td>
				<td>졸려유~~</td>
			</tr>
			<tr>
				<td><input name="id" type="radio" value="2"/></td>
				<td>2</td>
				<td>그래유~~</td>
			</tr>
			<tr>
				<td><input name="id" type="radio" value="3"/></td>
				<td>3</td>
				<td>뭐가 ~ 그래유~~</td>
			</tr>
			<tr>
				<td><input name="id" type="radio" value="4"/></td>
				<td>4</td>
				<td>얼마나~ 그래유~~</td>
			</tr>
			<tr>
				<td><input name="id" type="radio" value="5"/></td>
				<td>5</td>
				<td>정말루 ~그래유~~</td>
			</tr>
		</tbody>
	</table>

	<hr />
	


	<!-- 노드 바꾸기 예제-------------------------------------------------- -->
	<input id="swap-node-button" type="button" value="노드 바꾸기"/>
	<div id="node-swap-container">
		<img src="../images/answeris.png"/><img src="../images/w3c.png"/><img src="../images/wikibook.png"/>
	</div>
	
	<hr/>

	<!-- 텍스트 노드 추가 예제--------------------------------------------------  -->
	<input id="add-text-node-button" type="button" value="텍스트 노드 추가"/>
	<input id="add-img-node-button" type="button" value="이미지 노드 추가"/>
	<input id="remove-node-button" type="button" value="노드 삭제"/>
	<div id="node-container">
		
	</div>
	
	<hr/>


	<!-- 자식 노드 변경 예제-------------------------------------------------- -->
	<input id="ch-node-button" type="button" value="자식노드 변경"/>
	<div id="ch-node-container">
		hello
	</div>
	
	<hr/>


	<!-- 속성 변경 예제-------------------------------------------------- -->
	<input id="img-src" type="text" value=""/>
	<input id="ch-img-button" type="button" value="이미지 변경"/>
	<div id="img-container">
		<img src="https://img-wishbeen.akamaized.net/plan/1437707646107_4.png"/>
	</div>
	
	<hr/>


	<!-- Selector API 예제-------------------------------------------------- -->
	<input id="ch-button1" type="button" value="배경색 변경"/>
	<div id="module1">
		<div>1</div>
		<div>
			<div>2</div>
			<!-- comment -->
		</div>
		<div>3</div>
	</div>
	
	<hr/>


	<!-- 노드 순회 예제-------------------------------------------------- -->
	<input id="ch-button" type="button" value="배경색 변경"/>
	<div>
		<div>1</div>
		<div id="p">
			<div>2</div>
			<!-- comment -->
		</div>
		<div>3</div>
	</div>
	
	<hr/>
	<!-- innerframe 예제-------------------------------------------------- -->
	<div>
		<input id="nav-button" type="button" value="페이지 전환"/>
		<iframe src="notice.html" style="width:500px; height:300px;"></iframe>
	</div>
	
	<hr/>
	<!-- open a window 예제-------------------------------------------------- -->
	<div>
		<input id="open-button" type="button" value="새 창 띄우기"/>
		<input id="mov-button" type="button" value="왼쪽으로 이동"/>
		<input id="trans-button" type="button" value="페이지 이동"/>
	</div>
	<hr />
	<!-- timer 예제-------------------------------------------------- -->
	<p>
	       남은시간 <span id="count-label">60</span>초
	       <input id="count-button" type="button" value="카운트 시작" />
   </p>
   <hr />

	<div id="ex1">
	   <input type="text" id="x" placeholder="x값을 입력하세요" />
	   <input type="text" id="y" placeholder="y값을 입력하세요" />
	   =
	   <input type="button" value="더하기" id="add-button"/>
	   <input type="text" value="" id="result" />
	</div>

</body>
</html>