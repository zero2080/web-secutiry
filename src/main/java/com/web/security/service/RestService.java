package com.web.security.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.web.security.model.Board;
import com.web.security.model.Member;
import com.web.security.model.Message;
import com.web.security.repository.Repository;

@Service
public class RestService {
	
	private final Repository repo;
	
	public RestService(Repository repo) {
		this.repo=repo;
	}
	
	public List<Member> login(Member member){
		return repo.login(member);
	}

	public Board boardDetail(int id) {
		// TODO Auto-generated method stub
		return repo.boardDetail(id);
	}

	public void boardWrite(Board board) {
		repo.boardWrite(board);
	}

	public List<Board> boardList() {
		// TODO Auto-generated method stub
		return repo.getBoardList();
	}

	public List<Message> getMessages(String memberId) {
		// TODO Auto-generated method stub
		return repo.getMessages(memberId);
	}

}
