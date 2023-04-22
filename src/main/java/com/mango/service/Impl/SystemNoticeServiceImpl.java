package com.mango.service.Impl;

import com.mango.dao.SystemNoticeDao;
import com.mango.pojo.SystemNotice;
import com.mango.service.SystemNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SystemNoticeServiceImpl implements SystemNoticeService {

    @Autowired
    private SystemNoticeDao systemNoticeDao;

    @Override
    public SystemNotice getLatestSystemNotice() {
        return systemNoticeDao.getLatestSystemNotice();
    }

    @Override
    public List<SystemNotice> getAllSystemNotice() {
        return systemNoticeDao.getAllSystemNotice();
    }

    @Override
    public int updateSystemNotice(SystemNotice systemNotice) {
        return systemNoticeDao.updateSystemNotice(systemNotice);
    }

    @Override
    public void addSystemNotice(SystemNotice systemNotice) {
        systemNoticeDao.addSystemNotice(systemNotice);
    }

    @Override
    public void deleteSystemNoticeById(String id) {
        systemNoticeDao.deleteSystemNoticeById(id);
    }

}
