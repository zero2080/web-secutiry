package com.web.security;

import java.util.List;
import java.util.Map;

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
import com.web.security.service.RestService;

@RestController
public class HomeController {
	
	private final RestService service;
	
	public HomeController(RestService service) {
		this.service=service;
	}
	
	@GetMapping(path="/board/list")
	public List<Board> list(){
		return service.boardList();
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
			return new ResponseEntity<>(e.getMessage(),HttpStatus.BAD_REQUEST);
		}
		
	}
	
	@GetMapping(path="/message")
	public List<Message> messageList(@RequestParam String memberId){
		List<Message> result = service.getMessages(memberId);
		return result;
	}
	
	@PostMapping(path="/login")
	public ResponseEntity<List<Member>> login(@RequestBody Member member){
		List<Member> result = service.login(member);
		if(result.size()==0) {
			return new ResponseEntity<List<Member>>(HttpStatus.UNAUTHORIZED);
		}else{
			return new ResponseEntity<List<Member>>(result,HttpStatus.OK);
		}
	}
	
}
