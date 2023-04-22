package com.mango.control.admin;


import com.mango.pojo.Student;
import com.mango.service.Impl.StudentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
//@RestController
public class StudentController {

    @Autowired
    private StudentServiceImpl studentService;

    @GetMapping("/all_student")
    public String all_student(Model model) {
        List<Student> students = studentService.getAll();
        model.addAttribute("students", students);

        return "student/all_student";
    }

    @GetMapping("/add_new_student")
    public String add_new_student(HttpServletRequest request) {
        String s_id = request.getParameter("s_id");
        String s_name = request.getParameter("s_name");
        String password = request.getParameter("password");
        String s_major = request.getParameter("s_major");
        String s_year = request.getParameter("s_year");
        String s_class = request.getParameter("s_class");
        studentService.addStudent(new Student(s_id, s_name, password, s_major, s_year, s_class));

        return "redirect:all_student";
    }

    @GetMapping("/student_delete")
    public String student_delete(String s_id) {
        studentService.deleteStudentInfo(s_id);

        return "redirect:all_student";
    }


}
