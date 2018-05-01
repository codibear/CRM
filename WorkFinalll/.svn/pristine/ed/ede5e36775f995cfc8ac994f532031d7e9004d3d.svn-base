package com.chinasofti.crm.utils;

import com.chinasofti.crm.domain.CstLost;
import com.chinasofti.crm.domain.Customer;
import com.chinasofti.crm.domain.Orders;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.transaction.annotation.Transactional;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Administrator on 2017/8/10.
 */
@Transactional
public class Mybean {
    private SessionFactory sessionFactory;

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void printMessage() {
        Session session = sessionFactory.getCurrentSession();
        String sql = "from Orders GROUP BY orderCusName order by orderTime desc ";
        Query query = session.createQuery(sql);
        List<Orders> list = query.list();
        for (int i = 0; i < list.size(); i++) {
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            String today = sdf.format(date);
            String orderTime = sdf.format(list.get(i).getOrderTime());
            String[] newToday = today.split("-");
            String[] newOrderTime = orderTime.split("-");
            int years = Integer.parseInt(newToday[0]) - Integer.parseInt(newOrderTime[0]);
            int mouths = Integer.parseInt(newToday[1]) - Integer.parseInt(newOrderTime[1]);
            int nums = years * 12 + mouths;
            System.out.println(nums);
            if (nums >= 6) {
                Customer customer = session.load(Customer.class, Integer.parseInt(list.get(i).getOrderCusNo()));
                System.out.println(customer);
                CstLost cstLost = new CstLost();
                cstLost.setLstCustNo(String.valueOf(customer.getId()));
                cstLost.setLstCustName(customer.getCusName());

                cstLost.setLstLastOrderDate(sdf.format(list.get(i).getOrderTime()));
                cstLost.setLstCustManagerId(customer.getCusManagerId());
                cstLost.setLstCustManagerName(customer.getCusManagerName());
                cstLost.setLstStatus("暂缓流失");
                session.save(cstLost);
                session.delete(customer);
            }
        }

    }

}
