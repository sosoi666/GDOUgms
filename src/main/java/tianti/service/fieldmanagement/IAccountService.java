package tianti.service.fieldmanagement;

import tianti.domain.fieldmanagement.Account;

import java.util.List;

public interface IAccountService {
    public List<Account> findAll();

    public void saveAccount(Account account);

    public List<Account> findByAny(Account account);
}
