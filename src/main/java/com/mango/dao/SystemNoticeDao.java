package com.mango.dao;


import com.mango.pojo.Student;
import com.mango.pojo.StudentReservation;
import com.mango.pojo.SystemNotice;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;
import java.util.Map;

@Mapper
public interface SystemNoticeDao {
    SystemNotice getLatestSystemNotice();

    List<SystemNotice> getAllSystemNotice();

    int updateSystemNotice(SystemNotice systemNotice);

    void addSystemNotice(SystemNotice systemNotice);

    void deleteSystemNoticeById(String id);

}
