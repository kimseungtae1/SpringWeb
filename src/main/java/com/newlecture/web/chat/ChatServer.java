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

@ServerEndpoint(value="/resource/chat-server")//anotation���� ��������!
public class ChatServer {
//��ȣ�ۿ��� ���� �Լ����� ���� ������ �����ϴ� ��Ĺ ���
	//�������� ��Ĺ ���� ������ִ�.
	//�������� �����ʴ� �������� ����
	//�ƹ��� ��Ӿ��� �ۼ��� �̰��� ���� Ŭ������� �Ѵ�. plan old java object
	
	//Map List Set�� ������!
	//�� �����͸� ������ ������, ���� �ĺ��ϴ� Ű�� ���̰� �ִ�.(�ĺ� ���)
	//set ���� Ű�� ����
	//list ���� �Է¼����� Ű�� �ȴ�.
	//map ���� �ĺ��ϴ� Ű�� ���� �ش�.
	//�츮�� ������ �ʿ䰡 ���� ������, ����ڰ� �ߺ��� ����� ���� �ʱ� ������ set�� ����Ѵ�.
	private static Set<Session> sessionAll = 
			Collections.synchronizedSet(new HashSet<Session>());
	//�����ڰ� �þ �� ���� �����尡 ���������. �������� ������� ���ư����Ѵ�.
	//�������� �� �� ��� �� �ֵ��� �������Ѵ�.(���ü��� ������ ���� �� �ֱ� ������) �׷��� Collections.synchronizedSet�� ����ȭ& ����� �����Ѵ�.
	
	
	@OnOpen//������ ����ϴ� anotation
	public void onOpen(Session session, EndpointConfig config/*����� ����, ���� ����*/) {
		//session.getBasicRemote();//������� ������ �ĺ�
		sessionAll.add(session);//�������� �� �� ������� �����͸� �ƿ� ���� ������ �Ѱ��ش�. ��� ����ϱ� ������
		System.out.println("���� ������?");
		
	}
	@OnMessage//�޼����� �޾��� ��!
	public void onTextMessage(Session session,String data) throws IOException {
		System.out.println("�޼���");
		for(Session s : sessionAll)
		s.getBasicRemote().sendText(data);//������ ������ �״�� �����ִ� �ݻ�ۿ� �ʵȴ�. // System.out.println(data);
		
		System.out.println(sessionAll.size() + ":"+data);
	}
	//������ ���ļ� 2���� Ŭ���̾�Ʈ�� ����� �Ѵ�.
	//echo�� �ƴ϶� multicastiong�� �ؾ��Ѵ�.
	
	
	@OnClose
	public void onClose(Session session) throws IOException {
		sessionAll.remove(session);
		for(Session s : sessionAll)
			s.getBasicRemote().sendText("�������� ������ �������ϴ�.");
	}
	
}






















