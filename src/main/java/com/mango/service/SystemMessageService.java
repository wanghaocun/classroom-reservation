package com.mango.service;


import com.mango.pojo.SystemMessage;

import java.util.List;

public interface SystemMessageService {

    List<SystemMessage> getAllSystemMessage(String s_id);

    int updateSystemMessage(SystemMessage systemMessage);

    void addSystemMessage(SystemMessage systemMessage);

    void deleteSystemMessageById(String id);

}
