package com.telusko.student.dao;

import java.util.List;

import com.telusko.student.modal.Student;



public interface StudentDao {

	public List<Student> findStudentByCriteria();
}
