package com.web.security.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.web.security.model.Board;
import com.web.security.model.Member;
import com.web.security.model.Message;
import com.web.security.model.Page;
import com.web.security.repository.Repository;

@Service
public class RestService {
	
	private final Repository repo;
	
	public RestService(Repository repo) {
		this.repo=repo;
	}
	
	public void login(Member member) throws Exception {
		repo.login(member);
	}

	public Board boardDetail(int id) {
		// TODO Auto-generated method stub
		return repo.boardDetail(id);
	}

	public void boardWrite(Board board) {
		repo.boardWrite(board);
	}

	public Page<Board> boardList(Page<Board> page) throws Exception {
		// TODO Auto-generated method stub
		page.setTotalCount(repo.getTotalCount(Board.class,null));
		return repo.getBoardList(page);
	}

	public Page<Message> getMessages(Page<Message> page) throws Exception{
		// TODO Auto-generated method stub
		page.setTotalCount(repo.getTotalCount(Message.class,page.getMemberId()));
		
		return repo.getMessages(page);
	}

	public void join(Member member) throws Exception {
		// TODO Auto-generated method stub
		repo.joinMember(member);
	}

	public Boolean sendMessage(Message message) throws Exception {
		// TODO Auto-generated method stub
		return repo.sendMessage(message);
	}

}
