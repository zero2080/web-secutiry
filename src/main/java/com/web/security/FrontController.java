package com.web.security;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.security.model.Board;
import com.web.security.model.Message;
import com.web.security.service.RestService;

@Controller
public class FrontController {
	
	private final RestService service;
	
	public FrontController(RestService service) {
		this.service=service;
	}
	
	@GetMapping(path="/main")
	public String index() {
		return "home";
	}
	
	@GetMapping(path="/board/detail")
	public String board(@RequestParam int id, HttpServletRequest req) {
		Board board = service.boardDetail(id);
		req.setAttribute("detail",board);
		return "boardDetail";
	}
	
	@GetMapping(path="/write")
	public String writerForm() {
		return "write";
	}
	
	@GetMapping(path="/msgbox")
	public String message() {
		return "message";
	}
	
	@GetMapping(path="/join")
	public String join() {
		return "join";
	}
}
