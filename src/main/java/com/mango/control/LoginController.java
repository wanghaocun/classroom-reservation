package com.mango.control;


import com.mango.constant.WebConstant;
import com.mango.dao.BaseDao;
import com.mango.pojo.Student;
import com.mango.service.Impl.StudentServiceImpl;
import com.mango.service.SystemNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * 登录接口，进行登录判断
 */
@Controller
public class LoginController {

    @Autowired
    StudentServiceImpl service;

    @Autowired
    BaseDao baseDao;

    @Autowired
    private SystemNoticeService systemNoticeService;

    @GetMapping({"/", "login"})
    public String login() {
        return "login";
    }

    @GetMapping("/logincheck")
    public String check(@RequestParam("username") String s_id, @RequestParam("password") String psw, Model model, HttpServletRequest request) {
        Student student = service.getStudentById(s_id);
        if (student == null) {
            model.addAttribute("msg", "该用户不存在！请先进行注册");
            return "login";
        } else {
            if (psw.equals(student.getPassword())) {
                HttpSession session = request.getSession();

                session.setAttribute(WebConstant.LOGIN_USER, student);
                // 最新的系统公告
                session.setAttribute(WebConstant.SYSTEM_NOTICE, systemNoticeService.getLatestSystemNotice());

                if (student.getS_id().equals("admin")) {
                    return "redirect:index";
                } else {
                    return "redirect:student_index";
                }
            } else {
                model.addAttribute("msg", "用户或密码错误!");
                return "login";
            }
        }
    }

    @GetMapping("/register_student")
    public String register_student(HttpServletRequest request) {
        String s_id = request.getParameter("s_id");
        String s_name = request.getParameter("s_name");
        String password = request.getParameter("password");
        String s_major = request.getParameter("s_major");
        String s_year = request.getParameter("s_year");
        String s_class = request.getParameter("s_class");
        service.addStudent(new Student(s_id, s_name, password,   s_major,s_year, s_class));

        return "login";
    }

}
