package com.spring.cjs2108_psj;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/error")
public class ErrorController {
	
	@GetMapping("/no-resource")
	public String noResource() {
		return "error/404error";
	}
	
	@GetMapping("/server-error")
	public String serverError() {
		return "error/500error";
	}
}
