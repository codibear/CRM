package test.chinasofti.crm.domain;

import com.chinasofti.crm.biz.MySqlBiz;
import com.chinasofti.crm.biz.PowerBiz;
import com.chinasofti.crm.biz.RoleBiz;
import com.chinasofti.crm.biz.UserBiz;
import com.chinasofti.crm.domain.Power;
import com.chinasofti.crm.domain.Role;
import com.chinasofti.crm.domain.User;
import com.chinasofti.crm.vo.MySqlFile;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/8/10.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
public class Testprivilege {
    @Resource
     private RoleBiz roleBiz;
    @Resource
    private UserBiz userBiz;
    @Resource
    private PowerBiz powerBiz;
    @Resource
    MySqlBiz  mySqlBiz;

    @Test
    public void saveRole(){
        Role role = new Role();
        role.setRoleId(2);
        role.setRoleName("姜哲");
        this.roleBiz.save(role);
    }

    @Test
    public void saveUser(){
        User user = new User();
        user.setUserId(1);
        user.setUserName("姜哲");
        user.setUserPwd("11111");
        this.userBiz.save(user);
    }

    @Test
    public void savePower(){
        Power power = new Power();
        power.setPowerId(199);
        power.setPowerName("刘燕是个大笨蛋");
        this.powerBiz.save(power);
    }

    @org.junit.Test
    public void m4() {


        MySqlFile mySqlFile = new MySqlFile();
        mySqlFile.setHostIP("192.168.110.254");
        mySqlFile.setUserName("fengzhengmin");
        mySqlFile.setPassword("fengzhengmin");
        mySqlFile.setDatabaseName("crm");
        mySqlFile.setPath("D:\\mySql备份");
        System.out.println(mySqlFile.getPath());
        System.out.println(mySqlFile);
        mySqlFile.setFileName("mq22l.sql");


//        MySqlFile mySqlFile = new MySqlFile("localhost ", "root", "root", "D:/backupDatabase ", " 2222.sql ", " crm ");

        try {
            System.out.println(this.mySqlBiz.exportDatabaseTool(mySqlFile));
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


}
