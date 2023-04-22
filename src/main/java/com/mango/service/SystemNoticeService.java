package com.mango.service;


import com.mango.pojo.Student;
import com.mango.pojo.StudentReservation;
import com.mango.pojo.SystemNotice;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

public interface SystemNoticeService {

    SystemNotice getLatestSystemNotice();

    List<SystemNotice> getAllSystemNotice();

    int updateSystemNotice(SystemNotice systemNotice);

    void addSystemNotice(SystemNotice systemNotice);

    void deleteSystemNoticeById(String id);

}
