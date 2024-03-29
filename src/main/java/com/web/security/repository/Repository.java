package com.web.security.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.web.security.model.Board;
import com.web.security.model.Member;
import com.web.security.model.Message;
import com.web.security.model.Page;
import com.web.security.model.PageNation;

@org.springframework.stereotype.Repository
public class Repository {
//	server-db.c9vq7tfs4ivu.ap-northeast-2.rds.amazonaws.com
	
	private final String driver = "com.mysql.cj.jdbc.Driver";
	private final String id = "blackbear2080";
	private final String password = "dhqjatn0732";
	private final String url="jdbc:mysql://server-db.c9vq7tfs4ivu.ap-northeast-2.rds.amazonaws.com:3306/webSecurity?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull";
//	private final String url="jdbc:mysql://localhost:3306/webSecurity?characterEncoding=UTF-8&zeroDateTimeBehavior=convertToNull";
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private Statement stmt = null;
	private ResultSet rs = null;
	
	private StringBuffer query = null;
	
	public Repository() {
		try {
			Class.forName(driver);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public void login(Member member) throws Exception {
		
		query = new StringBuffer();
		query.append("SELECT id,memberId, DATE_FORMAT(createdAt,'%Y-%m-%d %H:%i:%s') FROM member WHERE memberId='");
		query.append(member.getMemberId());
		query.append("' ");
		query.append("AND ");
		query.append("memberPassword='");
		query.append(member.getMemberPassword());
		query.append("'");
		
		try {
			conn = DriverManager.getConnection(url,id,password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query.toString());
			
			if(rs.next()) {
				int i = 0;
				Member data = new Member();
				data.setId(rs.getInt(++i));
				data.setMemberId(rs.getString(++i));
				data.setCreatedAt(rs.getString(++i));
			}else {
				throw new Exception("login fail");
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			throw new Exception("로그인 정보를 확인해 주세요.");
		}finally {
			closer();
		}
	}

	public Board boardDetail(int id) {
		//사용자 ID가 memberId와 같을때 조회 가능
		Board result = new Board();
		
		query = new StringBuffer();
		query.append("SELECT id,title,memberId,content,visible,DATE_FORMAT(createdAt,'%Y-%m-%d %H:%i:%s') FROM board WHERE id=");
		query.append(id);
		
		try {
			conn = DriverManager.getConnection(url, this.id, password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query.toString());
			if(rs.next()) {
				int i = 1;
				result.setId(rs.getInt(i++));
				result.setTitle(rs.getString(i++));
				result.setMemberId(rs.getString(i++));
				result.setContent(rs.getString(i++));
				result.setVisible(rs.getBoolean(i++));
				result.setCreatedAt(rs.getString(i++));
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closer();
		}
		return result;
	}
	
	public void boardWrite(Board board) {
		query = new StringBuffer();
		query.append("INSERT INTO `board` (title,memberId,content,visible) values (\"");
		query.append(board.getTitle());
		query.append("\",\"");
		query.append(board.getMemberId());
		query.append("\",\"");
		query.append(board.getContent());
		query.append("\",");
		query.append(board.isVisible()?1:0);
		query.append(")");
		
		try {
			conn = DriverManager.getConnection(url,id,password);
			stmt = conn.createStatement();
			stmt.executeUpdate(query.toString());
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			closer();
		}
	}
	
	public <T extends PageNation> int getTotalCount(Class<T> pageNation,String memberId) throws Exception  {
		// TODO Auto-generated method stub
		query = new StringBuffer();
		query.append("SELECT COUNT(*) FROM ");
		int result = 0;
		if(pageNation.equals(Board.class)) {
			query.append("`board`");
		}else if(pageNation.equals(Message.class)){
			query.append("`message`");
			query.append(" WHERE toId = '");
			query.append(memberId);
			query.append("'");
		}
		
		try {
			conn = DriverManager.getConnection(url,id,password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query.toString());
			if(rs.next()) {
				result = rs.getInt(1);
			}
		}catch(Exception e) {
			throw e;
		}finally {
			closer();
		}
		
		return result;
	}
	
	public Page<Board> getBoardList(Page<Board> page) throws Exception  {
		// TODO Auto-generated method stub
		query = new StringBuffer();
		query.append("SELECT id,IF(visible=true,title,IF(memberId='"+page.getMemberId()+"',title,'비공개 글입니다.')) AS title,memberId,visible,DATE_FORMAT(createdAt,'%Y-%m-%d %H:%i:%s') AS createdAt FROM `board` ORDER BY id DESC LIMIT "+page.getStartRow()+","+page.getPageSize());
		List<Board> result = new ArrayList<>();
		try {
			conn = DriverManager.getConnection(url,id,password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(query.toString());
			
			while(rs.next()) {
				Board board = new Board();
				board.setId(rs.getInt("id"));
				board.setTitle(rs.getString("title"));
				board.setMemberId(rs.getString("memberId"));
				board.setVisible(rs.getBoolean("visible"));
				board.setCreatedAt(rs.getString("createdAt"));
				result.add(board);
			}
			page.setList(result);
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			closer();
		}
		
		return page;
	}
	
	public Page<Message> getMessages(Page<Message> page) {
		// TODO Auto-generated method stub
		List<Message> result = new ArrayList<>();
		
		try {
			conn = DriverManager.getConnection(url,id,password);
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT id,fromId,content,DATE_FORMAT(createdAt,'%Y-%m-%d %H:%i:%s') AS createdAt FROM `message` WHERE `toId`='" + page.getMemberId() + "' ORDER BY id DESC LIMIT "+page.getStartRow()+","+page.getPageSize());
			while(rs.next()) {
				Message msg = new Message();
				msg.setId(rs.getInt("id"));
				msg.setContent(rs.getString("content"));
				msg.setFromId(rs.getString("fromId"));
				msg.setCreatedAt(rs.getString("createdAt"));
				result.add(msg);
			}
			page.setList(result);
		}catch(Exception e) {
			e.printStackTrace();
		}finally{
			closer();
		}
		return page;
	}
	
	public void joinMember(Member member) throws Exception{
		// TODO Auto-generated method stub
		query = new StringBuffer();
		query.append("INSERT INTO `member`(`memberId`,`memberPassword`) VALUES (");
		query.append("'"+member.getMemberId()+"',");
		query.append("'"+member.getMemberPassword()+"'");
		query.append(")");
		try {
			conn = DriverManager.getConnection(url,id,password);
			stmt = conn.createStatement();
			stmt.executeUpdate(query.toString());
		}catch(Exception e) {
			throw new Exception("회원 가입에 실패했습니다.");
		}finally {
			closer();
		}
	}
	
	
	
	private void closer() {
		query = null;
		if(rs!=null) {
			try {
				rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(pstmt!=null) {
			try {
				pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(stmt!=null) {
			try {
				stmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		if(conn!=null) {
			try {
				conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
	}

	public Boolean sendMessage(Message message) throws Exception {
		// TODO Auto-generated method stub
		query = new StringBuffer();
		query.append(String.format("INSERT INTO `message` (toId,content, fromId) VALUES('%s','%s','%s')",message.getToId(),message.getContent(),message.getFromId()));
		try {
			conn = DriverManager.getConnection(url,id,password);
			stmt = conn.createStatement();
			stmt.executeUpdate(query.toString());
			return true;
		}catch(Exception e) {
			e.printStackTrace();
			throw e;
		}finally {
			closer();
		}
	}




}