package com.myweb.model;

import lombok.Getter;
import lombok.Setter;

//��ü ȸ��, ���̹� ȸ�� ���̺� ���� ��������!
@Getter
@Setter
public class UserVO {
	private String id;		//ȸ�� id
	private String nid;		//���̹� id
	private String age;		//���� X ���ɴ� O
	private String gender;
	private String email;
	private String name;
	private String birthday;
	//���̹� ID�� ȸ������ �� �� �߰��� �Է¹��� ����
	private String tel;
	private String addr;
	//���̹� �α��� ȸ������ or ��üȸ�� ���� �Ǻ�
	private int naver;	// 0:��üȸ��	1:���̹�	2:�Ѵ�	2�� ���� ����X
}