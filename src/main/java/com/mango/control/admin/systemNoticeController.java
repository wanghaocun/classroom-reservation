package com.mango.control.admin;


import com.mango.pojo.Student;
import com.mango.pojo.SystemNotice;
import com.mango.service.Impl.StudentServiceImpl;
import com.mango.service.SystemNoticeService;
import com.mango.utils.CommonUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
public class systemNoticeController {

    @Autowired
    private SystemNoticeService systemNoticeService;

    @GetMapping("/all_notice")
    public String getAllNotice(Model model) {
        List<SystemNotice> notices = systemNoticeService.getAllSystemNotice();
        model.addAttribute("notices",notices);

        return "notice/all_notice";
    }

    @GetMapping("/add_notice")
    public String addSystemNotice(HttpServletRequest request) {
        String id = String.valueOf(System.currentTimeMillis());
        String name = request.getParameter("title");
        String content = request.getParameter("content");
        Date time = new Date();
        systemNoticeService.addSystemNotice(new SystemNotice(id,name,content,time));

        return "redirect:all_notice";
    }

    @GetMapping("/update_notice")
    public String updateSystemNotice(HttpServletRequest request) {
        System.out.println("进入了公告更新");
        SystemNotice systemNotice = new SystemNotice();

        String id = request.getParameter("id");
        if (!StringUtils.isEmpty(id)) {
            systemNotice.setId(id);
        }
        String title = request.getParameter("title");
        if (!StringUtils.isEmpty(title)) {
            systemNotice.setTitle(title);
        }
        String content = request.getParameter("content");
        if (!StringUtils.isEmpty(content)) {
            systemNotice.setContent(content);
            systemNotice.setTime(new Date());
        }

        systemNoticeService.updateSystemNotice(systemNotice);

        return "redirect:all_notice";
    }

    @GetMapping("/delete_notice")
    public String deleteNotice(String id) {
        systemNoticeService.deleteSystemNoticeById(id);

        return "redirect:all_notice";
    }

}
