package com.mango.control.admin;


import com.mango.pojo.Student;
import com.mango.pojo.SystemMessage;
import com.mango.service.SystemMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
public class SystemMessageController {

    @Autowired
    private SystemMessageService systemMessageService;

    @GetMapping("/student_message")
    public String getStudentMessage(HttpServletRequest request, Model model) {
        Student student = (Student) request.getSession().getAttribute("login_user");
        List<SystemMessage> messages = systemMessageService.getAllSystemMessage(student.getS_id());
        model.addAttribute("messages", messages);

        return "message/student_message";
    }

    @GetMapping("/add_message")
    public String addSystemMessage(HttpServletRequest request) {
        String id = String.valueOf(System.currentTimeMillis());
        Student student = (Student) request.getSession().getAttribute("login_user");
        String content = request.getParameter("content");
        systemMessageService.addSystemMessage(
                SystemMessage.builder().id(id).s_id(student.getS_id()).s_name(student.getS_name()).content(content).build());

        return "redirect:student_message";
    }

    @GetMapping("/update_own_message")
    public String updateOwnMessage(HttpServletRequest request) {
        System.out.println("进入了留言更新");
        SystemMessage SystemMessage = new SystemMessage();

        String id = request.getParameter("id");
        if (!StringUtils.isEmpty(id)) {
            SystemMessage.setId(id);
        }

        String content = request.getParameter("content");
        if (!StringUtils.isEmpty(content)) {
            SystemMessage.setContent(content);
            SystemMessage.setTime(new Date());
        }

        String reply = request.getParameter("reply");
        if (!StringUtils.isEmpty(reply)) {
            SystemMessage.setReply(reply);
        }

        systemMessageService.updateSystemMessage(SystemMessage);

        return "redirect:student_message";
    }

    @GetMapping("/delete_own_message")
    public String deleteOwnMessage(String id) {
        systemMessageService.deleteSystemMessageById(id);

        return "redirect:student_message";
    }

    @GetMapping("/all_message")
    public String getAllMessage(HttpServletRequest request, Model model) {
        Student student = (Student) request.getSession().getAttribute("login_user");
        List<SystemMessage> messages = systemMessageService.getAllSystemMessage(student.getS_id());
        model.addAttribute("messages", messages);

        return "message/all_message";
    }

    @GetMapping("/update_message")
    public String updateSystemMessage(HttpServletRequest request) {
        System.out.println("进入了留言更新");
        SystemMessage SystemMessage = new SystemMessage();

        String id = request.getParameter("id");
        if (!StringUtils.isEmpty(id)) {
            SystemMessage.setId(id);
        }

        String content = request.getParameter("content");
        if (!StringUtils.isEmpty(content)) {
            SystemMessage.setContent(content);
            SystemMessage.setTime(new Date());
        }

        String reply = request.getParameter("reply");
        if (!StringUtils.isEmpty(reply)) {
            SystemMessage.setReply(reply);
        }

        systemMessageService.updateSystemMessage(SystemMessage);

        return "redirect:all_message";
    }

    @GetMapping("/delete_message")
    public String deleteMessage(String id) {
        systemMessageService.deleteSystemMessageById(id);

        return "redirect:all_message";
    }

}
