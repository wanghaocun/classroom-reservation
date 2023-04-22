package com.mango.dao;


import com.mango.pojo.SystemMessage;
import com.mango.pojo.SystemNotice;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SystemMessageDao {

    List<SystemMessage> getAllSystemMessage(String s_id);

    int updateSystemMessage(SystemMessage systemMessage);

    void addSystemMessage(SystemMessage systemMessage);

    void deleteSystemMessageById(String id);

}
