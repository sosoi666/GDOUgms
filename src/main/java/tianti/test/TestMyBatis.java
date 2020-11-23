package tianti.test;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;
import tianti.dao.fieldmanagement.IAccountDao;
import tianti.domain.fieldmanagement.Account;

import java.io.InputStream;
import java.util.List;


public class TestMyBatis {
    /*
    * 测试保存
    */
    @Test
    public void run1() throws Exception {
        Account account = new Account();
        account.setName("王五");
        account.setMoney(3003d);
        //加载配置文件
        InputStream in = Resources.getResourceAsStream("SqlMapConfig.xml");
        //创建SqlSessionFactory对象
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        //创建SqlSession对象
        SqlSession session = factory.openSession();
        //获取代理对象
        IAccountDao dao = session.getMapper(IAccountDao.class);
        //保存
        dao.saveAccount(account);

        session.commit();
        //关闭资源
        session.close();
        in.close();

    }

    /*测试查询*/
    @Test
    public void run2() throws Exception {
        //加载配置文件
        InputStream in = Resources.getResourceAsStream("SqlMapConfig.xml");
        //创建SqlSessionFactory对象
        SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(in);
        //创建SqlSession对象
        SqlSession session = factory.openSession();
        //获取代理对象
        IAccountDao dao = session.getMapper(IAccountDao.class);
        //查询所有数据
        List<Account> list = dao.findAll();
        for (Account account : list){
            System.out.println(account);
        }
        //关闭资源
        session.close();
        in.close();

    }
}
