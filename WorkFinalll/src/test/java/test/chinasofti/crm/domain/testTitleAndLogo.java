package test.chinasofti.crm.domain;

import com.chinasofti.crm.biz.CstLinkmanBiz;
import com.chinasofti.crm.dao.StaReportDao;
import com.chinasofti.crm.domain.CstLinkman;
import com.chinasofti.crm.domain.WebSystem;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 杨广 on 2017/8/15.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
@Transactional
public class testTitleAndLogo {
        @Resource
        CstLinkmanBiz cstLinkmanBiz;
        @Resource
        StaReportDao staReportDao;

        @org.junit.Test
        public void find() {
            List<CstLinkman> list = cstLinkmanBiz.findAll();
            System.out.println(list.size());
        }
        @org.junit.Test
        public void findByRank(){
            String rank="战略合作伙伴";
            staReportDao.findByRank(rank);
        }
        @org.junit.Test
        public void update(){
            WebSystem webSystem=new WebSystem();
            webSystem.setSystemname("limin");
            webSystem.setSyslogoip("李min");
            webSystem.setSysremid(1);
            //staReportDao.(webSystem);

        }
}
