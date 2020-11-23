package tianti.controller.fieldmanagement;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tianti.domain.fieldmanagement.Account;
import tianti.service.fieldmanagement.IAccountService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private IAccountService accountService;

    //查询
    @RequestMapping("/findAll")
    public String findAll(Model model){
        System.out.println("表现层：查询所有账户信息");
        //调用service

        Account acc = new Account();
        acc.setMoney(2000);

        //List<Account> list = accountService.findAll();
        List<Account> list = accountService.findByAny(acc);
        model.addAttribute("list",list);
        return "fieldManagement/list";
    }

    //保存
    @RequestMapping("/save")
    public String save(Account account, HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("表现层：查询所有账户信息");
        //调用service
        accountService.saveAccount(account);
        response.sendRedirect(request.getContextPath()+"/account/findAll");
        return "fieldManagement/list";
    }
}
