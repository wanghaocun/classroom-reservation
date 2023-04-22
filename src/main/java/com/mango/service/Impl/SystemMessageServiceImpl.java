package com.mango.service.Impl;

import com.mango.dao.SystemMessageDao;
import com.mango.pojo.SystemMessage;
import com.mango.service.SystemMessageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SystemMessageServiceImpl implements SystemMessageService {

    @Autowired
    private SystemMessageDao SystemMessageDao;

    @Override
    public List<SystemMessage> getAllSystemMessage(String s_id) {
        return SystemMessageDao.getAllSystemMessage(s_id);
    }

    @Override
    public int updateSystemMessage(SystemMessage systemMessage) {
        return SystemMessageDao.updateSystemMessage(systemMessage);
    }

    @Override
    public void addSystemMessage(SystemMessage systemMessage) {
        SystemMessageDao.addSystemMessage(systemMessage);
    }

    @Override
    public void deleteSystemMessageById(String id) {
        SystemMessageDao.deleteSystemMessageById(id);
    }

}
