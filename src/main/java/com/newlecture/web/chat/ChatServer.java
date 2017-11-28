package com.newlecture.web.chat;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.EndpointConfig;
import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint(value="/resource/chat-server")//anotation으로 설정하자!
public class ChatServer {
//상호작용을 위한 함수들을 넣자 서블릿이 제공하는 소캣 기능
	//스프링은 톰캣 위에 얹어져있다.
	//프레임을 쓰지않는 서블릿으로 제작
	//아무런 상속없이 작성된 이것을 포조 클래스라고 한다. plan old java object
	
	//Map List Set의 차이점!
	//다 데이터를 수집을 하지만, 값을 식별하는 키가 차이가 있다.(식별 방법)
	//set 값과 키가 같다
	//list 값의 입력순서가 키가 된다.
	//map 값을 식별하는 키를 따로 준다.
	//우리는 순서가 필요가 없기 때문에, 사용자가 중복을 허용을 하지 않기 때문에 set을 사용한다.
	private static Set<Session> sessionAll = 
			Collections.synchronizedSet(new HashSet<Session>());
	//접속자가 늘어날 때 마다 쓰레드가 만들어진다. 개별적인 쓰래드로 돌아가야한다.
	//누군가가 들어갈 때 잠글 수 있도록 만들어야한다.(동시성에 문제가 생길 수 있기 때문에) 그래서 Collections.synchronizedSet로 동기화& 잠금을 구현한다.
	
	
	@OnOpen//접속을 담당하는 anotation
	public void onOpen(Session session, EndpointConfig config/*사용자 정보, 소켓 정보*/) {
		//session.getBasicRemote();//사용자의 아이피 식별
		sessionAll.add(session);//접속했을 시 그 사용자의 데이터를 아예 위의 변수에 넘겨준다. 계속 사용하기 때문에
		System.out.println("누가 접속함?");
		
	}
	@OnMessage//메세지를 받았을 떄!
	public void onTextMessage(Session session,String data) throws IOException {
		System.out.println("메세지");
		for(Session s : sessionAll)
		s.getBasicRemote().sendText(data);//지금은 받은걸 그대로 보내주는 반사밖에 않된다. // System.out.println(data);
		
		System.out.println(sessionAll.size() + ":"+data);
	}
	//서버를 거쳐서 2명의 클라이언트가 통신을 한다.
	//echo가 아니라 multicastiong을 해야한다.
	
	
	@OnClose
	public void onClose(Session session) throws IOException {
		sessionAll.remove(session);
		for(Session s : sessionAll)
			s.getBasicRemote().sendText("누군가가 접속을 끊었습니다.");
	}
	
}






















