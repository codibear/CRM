package test.chinasofti.crm.domain;

import com.chinasofti.crm.biz.CstLinkmanBiz;
import com.chinasofti.crm.biz.OrderBiz;
import com.chinasofti.crm.biz.SalesBiz;
import com.chinasofti.crm.domain.CstLinkman;
import com.chinasofti.crm.domain.Goods;
import com.chinasofti.crm.domain.Orders;
import com.chinasofti.crm.domain.SalesManage;
import com.chinasofti.crm.utils.PinYinUtils;
import net.sourceforge.pinyin4j.PinyinHelper;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

/**
 * Created by Administrator on 2017/8/8.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:applicationContext.xml")
@Transactional
public class Test {
    @Resource
    CstLinkmanBiz cstLinkmanBiz;

    @Resource
    SalesBiz salesBiz;

    @Resource
    private OrderBiz orderBiz;

    @org.junit.Test
    public void te(){
        Orders order=orderBiz.loadbyid(1);
        System.out.println(order.getOrderId());
        Set<Goods> goodses=order.getGoodses();
        System.out.println(goodses.size());
    }

    @org.junit.Test
    public void find() {
        List<CstLinkman> list = cstLinkmanBiz.findAll();
        System.out.println(list.size());
    }

    @org.junit.Test
    public void pinyin() {

//        String ches = null;
//
//        List<SalesManage> salesManages = salesBiz.findAll();
//
//        List<SalesManage> container = new ArrayList<SalesManage>();
//
//        for (int i = 0; i < salesManages.size(); i++) {
//
//            ches = PinYinUtils.getPinYin(salesManages.get(i).getCusName());
//
//
//            String[] strs = ches.split(" ");
//
//
//            char[] input = new char[]{'t', 'z'};
//            int flag = 0;
//
//
//            for (int j = 0; j < strs.length; j++) {
//
//                System.out.println(strs[j].charAt(0));
//                char tmp = strs[j].charAt(0);
//                if (tmp == input[flag]) {
//                    flag++;
//                    if (flag == input.length) {
//                        container.add(salesManages.get(i));
//                        break;
//                    } else {
//                        continue;
//                    }
//
//                }
//
//            }
//
//        }
//
//        for (SalesManage s:container){
//            System.out.println(s.getCusName());
//        }

    }



    @org.junit.Test
    public void fin() {

        char[] input = new char[]{'z', 'y'};


        List<String> list = new ArrayList<String>();

        String ches = null;

        List<SalesManage> salesManages = salesBiz.findAll();

        List<SalesManage> container = new ArrayList<SalesManage>();

        for (int i = 0; i < salesManages.size(); i++) {

            ches = PinYinUtils.getPinYin(salesManages.get(i).getCusName());


            String[] strs = ches.split(" ");

            int flag = 0;


            for (int j = 0; j < strs.length; j++) {

//            System.out.println(strs[j].charAt(0));

                char tmp = strs[flag].charAt(0);

                if (tmp == input[flag]) {
                    flag++;

                    if (flag == input.length) {
                        container.add(salesManages.get(i));
                        break;
                    } else {
                        continue;
                    }

                }

            }

        }

        for (SalesManage s : container) {

//        System.out.println(s.getCusName());

            list.add(s.getCusName());
            System.out.println(s.getCusName());
        }


        System.out.println(list);
    }



}



