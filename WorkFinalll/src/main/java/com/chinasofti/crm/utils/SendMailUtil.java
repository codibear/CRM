package com.chinasofti.crm.utils;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.activation.DataHandler;
import javax.activation.FileDataSource;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.*;
import java.util.Properties;

public class SendMailUtil {
    /*
     * 发送邮件到指定邮箱
     */
    public static void send(String fromAddress,String toAddress) throws Exception{
        /*
         * 第一步：创建Session，包含邮件服务器网络连接信息
         */
        Properties props = new Properties();
        //指定邮件的传输协议，smtp;同时通过验证
        props.setProperty("mail.transport.protocol", "smtp");
        props.setProperty("mail.smtp.auth","true");
        Session session = Session.getDefaultInstance(props);
        //开启调试模式
        session.setDebug(true);
        //开启SSL加密
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        props.put("mail.smtp.ssl.enable", "true");
        props.put("mail.smtp.ssl.socketFactory", sf);
        /*
         * 第二步：编辑邮件内容
         */
        Message message = new MimeMessage(session);
        //设置邮件消息头
        message.setFrom(new InternetAddress(fromAddress));
        message.setRecipients(MimeMessage.RecipientType.TO, InternetAddress.parse(toAddress));
        message.setSubject("报价管理单");
        //设置邮件消息内容、包含附件
        Multipart msgPart = new MimeMultipart();
        message.setContent(msgPart);

        MimeBodyPart body = new MimeBodyPart(); //正文
        MimeBodyPart attach = new MimeBodyPart(); //附件

        msgPart.addBodyPart(body);
        msgPart.addBodyPart(attach);

        //设置正文内容
        body.setContent("JavaMail功能测试", "text/html;charset=utf-8");
        //设置附件内容
        attach.setDataHandler(new DataHandler(new FileDataSource("D:\\quotation.xls")));
        attach.setFileName(MimeUtility.encodeText("报价详情.xls"));

        message.saveChanges();
        /*
         * 第三步：发送邮件
         */
        Transport trans = session.getTransport();
        //ttogjefvhaywbbhd
        trans.connect("smtp.qq.com", "596108929", "ttogjefvhaywbbhd");
        trans.sendMessage(message, message.getAllRecipients());

    }

    public static void main(String[] args) throws Exception {
        SendMailUtil.send("xxxxxxx@163.com","xxxxxxx@163.com");
    }
}