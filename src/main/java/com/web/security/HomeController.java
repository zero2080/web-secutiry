package com.web.security;

import java.util.HashMap;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.web.security.model.Board;
import com.web.security.model.Member;
import com.web.security.model.Message;
import com.web.security.model.Page;
import com.web.security.service.RestService;

@RestController
public class HomeController {
	
	private final RestService service;
	
	public HomeController(RestService service) {
		this.service=service;
	}
	
	@GetMapping(path="/board/list")
	public ResponseEntity<Page<Board>> list(Page<Board> page){
		try {
			return new ResponseEntity<>(service.boardList(page),HttpStatus.OK);
		} catch(Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@GetMapping(path="/board")
	public Board detail(@RequestParam int id) {
		return service.boardDetail(id);
	}
	
	@PostMapping(path="/board")
	public ResponseEntity<?> write(@RequestBody Board board) {
		try {
			service.boardWrite(board);
			return new ResponseEntity<>(HttpStatus.OK);
		}catch(Exception e) {
			return new ResponseEntity<>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
	}
	
	@GetMapping(path="/message/list")
	public ResponseEntity<Page<Message>> messageList(Page<Message> page){
		try {
			return new ResponseEntity<>(service.getMessages(page),HttpStatus.OK);
		}catch(Exception e) {
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PostMapping(path="/message")
	public ResponseEntity<?> sendMsg(@RequestBody Message message){
		try {
			return new ResponseEntity<>(service.sendMessage(message),HttpStatus.OK);
		}catch(Exception e) {
			return new ResponseEntity<>(e.getMessage(),HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
	
	@PostMapping(path="/login")
	public ResponseEntity<?> login(@RequestBody Member member){
		try {
			service.login(member);
			return new ResponseEntity<>(HttpStatus.OK);
		}catch(Exception e) {
			return new ResponseEntity<>(new HashMap<String,String>(){{put("message",e.getMessage());}},HttpStatus.UNAUTHORIZED);
		}
	}
	
	@SuppressWarnings("serial")
	@PostMapping(path="/join", produces="application/json;charset=utf-8")
	public ResponseEntity<?> join(@RequestBody Member member){
		try {
			service.join(member);
			return new ResponseEntity<>(HttpStatus.OK);
		}catch(Exception e) {
			return new ResponseEntity<>(new HashMap<String,String>(){{put("message",e.getMessage());}},HttpStatus.BAD_REQUEST) ;
		}
	}
}
