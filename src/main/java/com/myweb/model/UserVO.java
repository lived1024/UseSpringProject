package com.myweb.model;

import lombok.Getter;
import lombok.Setter;

//��ü ȸ��, ���̹� ȸ�� ���̺� ���� ��������!
@Getter
@Setter
public class UserVO {
	private String wid;
	private String nid;
	private String pw;		//���̹� �α��ο��� ��� x
	private String age;		//���� X ���ɴ� O
	private String gender;
	private String email;
	private String name;
	private String birthday;
	private int lend;		// �뿩 ����
	//���̹� ID�� ȸ������ �� �� �߰��� �Է¹��� ����
	private String tel;
	private String addr;
}