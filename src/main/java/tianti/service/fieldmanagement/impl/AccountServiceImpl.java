package tianti.service.fieldmanagement.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tianti.dao.fieldmanagement.IAccountDao;
import tianti.domain.fieldmanagement.Account;
import tianti.service.fieldmanagement.IAccountService;

import java.util.List;

@Service("accountService")
public class AccountServiceImpl implements IAccountService {

    @Autowired
    private IAccountDao accountDao;

    @Override
    public List<Account> findAll() {
        System.out.println("业务层：查询所有账户");
        return accountDao.findAll();
    }

    @Override
    public void saveAccount(Account account) {
        System.out.println("业务层：保存所有账户");
        accountDao.saveAccount(account);
    }

    @Override
    public List<Account> findByAny(Account account) {
        return accountDao.findByAny(account);
    }
}
