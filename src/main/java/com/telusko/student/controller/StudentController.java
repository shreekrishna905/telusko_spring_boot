package com.telusko.student.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.telusko.student.service.StudentService;


@Controller
@RequestMapping({"/","/index"})
public class StudentController {

	@Autowired
	private StudentService studentService;
	
	@RequestMapping(method=RequestMethod.GET)
	public String index() {
		return "student";
	}
	

	@RequestMapping(method=RequestMethod.POST, value="/student-list", produces="application/json")
	@ResponseBody
	public String studentList() throws Exception {
		return studentService.findStudent();
	}
	
}
