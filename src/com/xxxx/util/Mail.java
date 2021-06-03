package com.xxxx.util;

import com.sun.mail.util.MailSSLSocketFactory;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.security.GeneralSecurityException;
import java.util.Properties;

public class Mail {
    public static String sendMessage(String uname, String uemail) throws GeneralSecurityException, MessagingException {
        Properties prop = new Properties();
        // 设置邮件服务器主机名
        prop.setProperty("mail.host", "smtp.qq.com");
        // 发送服务器需要身份验证
        prop.setProperty("mail.smtp.auth", "true");
        // 发送邮件协议名称
        prop.setProperty("mail.transport.protocol", "smtp");
        // 开启SSL加密，否则会失败
        MailSSLSocketFactory sf = new MailSSLSocketFactory();
        sf.setTrustAllHosts(true);
        prop.put("mail.smtp.ssl.enable", "true");
        prop.put("mail.smtp.ssl.socketFactory", sf);
        // 创建session
        Session session = Session.getInstance(prop);

        // 通过session得到transport对象
        Transport ts = session.getTransport();
        // 连接邮件服务器：邮箱类型，帐号，POP3/SMTP协议授权码 163使用：smtp.163.com
        ts.connect("smtp.qq.com", "3206054004", "gujccwcfvhlsddia"); //参数("smtp.qq.com", "发送方qq号", "POP3/SMTP协议授权码")
        // 生成验证码并创建邮件
        String vcode = GetVerificationCode.CreateVerificationCode();
        Message message = createMail(session, uname, uemail, vcode);
        // 发送邮件
        ts.sendMessage(message, message.getAllRecipients());
        ts.close();
        return vcode;
    }

    private static Message createMail(Session session,String uname, String uemail, String vcode) throws MessagingException {

            MimeMessage message = new MimeMessage(session);
            // 指明邮件的发件人
            message.setFrom(new InternetAddress("3206054004@qq.com")); //参数:发送方邮箱
            // 指明邮件的收件人，发件人和收件人如果是一样的，那就是自己给自己发
            message.setRecipient(Message.RecipientType.TO, new InternetAddress(uemail)); //参数:接收方邮箱
            // 邮件的标题
            message.setSubject("来自憨憨的验证码测试邮件");
            // 邮件的文本内容
            message.setContent("<!DOCTYPE html>\n" +
                    "<html>\n" +
                    "<head>\n" +
                    "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n" +
                    "    <title></title>\n" +
                    "    <meta charset=\"utf-8\" />\n" +
                    "\n" +
                    "</head>\n" +
                    "<body>\n" +
                    "    <div class=\"qmbox qm_con_body_content qqmail_webmail_only\" id=\"mailContentContainer\" style=\"\">\n" +
                    "        <style type=\"text/css\">\n" +
                    "            .qmbox body {\n" +
                    "                margin: 0;\n" +
                    "                padding: 0;\n" +
                    "                background: #fff;\n" +
                    "                font-family: \"Verdana, Arial, Helvetica, sans-serif\";\n" +
                    "                font-size: 14px;\n" +
                    "                line-height: 24px;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox div, .qmbox p, .qmbox span, .qmbox img {\n" +
                    "                margin: 0;\n" +
                    "                padding: 0;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox img {\n" +
                    "                border: none;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .contaner {\n" +
                    "                margin: 0 auto;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .title {\n" +
                    "                margin: 0 auto;\n" +
                    "                background: url() #CCC repeat-x;\n" +
                    "                height: 30px;\n" +
                    "                text-align: center;\n" +
                    "                font-weight: bold;\n" +
                    "                padding-top: 12px;\n" +
                    "                font-size: 16px;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .content {\n" +
                    "                margin: 4px;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .biaoti {\n" +
                    "                padding: 6px;\n" +
                    "                color: #000;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .xtop, .qmbox .xbottom {\n" +
                    "                display: block;\n" +
                    "                font-size: 1px;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .xb1, .qmbox .xb2, .qmbox .xb3, .qmbox .xb4 {\n" +
                    "                display: block;\n" +
                    "                overflow: hidden;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .xb1, .qmbox .xb2, .qmbox .xb3 {\n" +
                    "                height: 1px;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .xb2, .qmbox .xb3, .qmbox .xb4 {\n" +
                    "                border-left: 1px solid #BCBCBC;\n" +
                    "                border-right: 1px solid #BCBCBC;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .xb1 {\n" +
                    "                margin: 0 5px;\n" +
                    "                background: #BCBCBC;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .xb2 {\n" +
                    "                margin: 0 3px;\n" +
                    "                border-width: 0 2px;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .xb3 {\n" +
                    "                margin: 0 2px;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .xb4 {\n" +
                    "                height: 2px;\n" +
                    "                margin: 0 1px;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .xboxcontent {\n" +
                    "                display: block;\n" +
                    "                border: 0 solid #BCBCBC;\n" +
                    "                border-width: 0 1px;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .line {\n" +
                    "                margin-top: 6px;\n" +
                    "                border-top: 1px dashed #B9B9B9;\n" +
                    "                padding: 4px;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .neirong {\n" +
                    "                padding: 6px;\n" +
                    "                color: #666666;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .foot {\n" +
                    "                padding: 6px;\n" +
                    "                color: #777;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .font_darkblue {\n" +
                    "                color: #006699;\n" +
                    "                font-weight: bold;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .font_lightblue {\n" +
                    "                color: #008BD1;\n" +
                    "                font-weight: bold;\n" +
                    "            }\n" +
                    "\n" +
                    "            .qmbox .font_gray {\n" +
                    "                color: #888;\n" +
                    "                font-size: 12px;\n" +
                    "            }\n" +
                    "        </style>\n" +
                    "        <div class=\"contaner\">\n" +
                    "            <div class=\"title\">验证码</div>\n" +
                    "            <div class=\"content\">\n" +
                    "                <p class=\"biaoti\"><b>亲爱的"+uname+"你好</b></p>\n" +
                    "                <b class=\"xtop\"><b class=\"xb1\"></b><b class=\"xb2\"></b><b class=\"xb3\"></b><b class=\"xb4\"></b></b>\n" +
                    "                <div class=\"xboxcontent\">\n" +
                    "                    <div class=\"neirong\">\n" +
                    "                        <p><b>请核对你的用户名：</b><span id=\"userName\" class=\"font_darkblue\">"+uname+"</span></p>\n" +
                    "                        <p><b>您的验证码：</b><span class=\"font_lightblue\"><span id=\"yzm\" data=\"$(captcha)\" onclick=\"return false;\" t=\"7\" style=\"border-bottom: 1px dashed rgb(204, 204, 204); z-index: 1; position: static;\">"+ vcode +"</span></span><br><span class=\"font_gray\">(请输入该验证码完成验证，验证码30分钟内有效！)</span></p>\n" +
                    "                        <div class=\"line\">如果你未申请本服务，请忽略该邮件。</div>\n" +
                    "                    </div>\n" +
                    "                </div>\n" +
                    "                <b class=\"xbottom\"><b class=\"xb4\"></b><b class=\"xb3\"></b><b class=\"xb2\"></b><b class=\"xb1\"></b></b>\n" +
                    "                <p class=\"foot\">如果仍有问题，请拨打我们的会员服务专线: <span data=\"EZSKY\" onclick=\"return false;\" t=\"7\" style=\"border-bottom: 1px dashed rgb(204, 204, 204); z-index: 1; position: static;\">EZSKY\n" +
                    "</span></p>\n" +
                    "            </div>\n" +
                    "        </div>\n" +
                    "        <style type=\"text/css\">\n" +
                    "            .qmbox style, .qmbox script, .qmbox head, .qmbox link, .qmbox meta {\n" +
                    "                display: none !important;\n" +
                    "            }\n" +
                    "        </style>\n" +
                    "    </div>\n" +
                    "</body>\n" +
                    "</html>\n", "text/html;charset=UTF-8");


            // 返回创建好的邮件对象
            return message;
        }
    }

