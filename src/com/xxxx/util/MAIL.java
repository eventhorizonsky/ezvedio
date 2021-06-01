package com.xxxx.util;
import com.xxxx.entity.vo.MessageModel;
import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.Email;
import org.apache.commons.mail.EmailAttachment;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;
public class MAIL {
    public MAIL(String uname, String code, String useremail){
       try {
           HtmlEmail email=new HtmlEmail();//创建电子邮件对象
           email.setSSL(true);
           email.setDebug(true);
           email.setHostName("SMTP.163.com");//设置发送电子邮件使用的服务器主机名
           email.setSmtpPort(994);//设置发送电子邮件使用的邮件服务器的TCP端口地址
           email.setAuthenticator(new DefaultAuthenticator("eventhorizonsky@163.com", "JSKQAPDDLNZJEBTK"));//邮件服务器身份验证
           email.setFrom("eventhorizonsky@163.com");//设置发信人邮箱
           email.setSubject("来自一斩的测试邮件");//设置邮件主题
           email.setCharset("UTF-8");// 编码格式
           email.setHtmlMsg("<!DOCTYPE html>\n" +
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
                   "                        <p><b>您的验证码：</b><span class=\"font_lightblue\"><span id=\"yzm\" data=\"$(captcha)\" onclick=\"return false;\" t=\"7\" style=\"border-bottom: 1px dashed rgb(204, 204, 204); z-index: 1; position: static;\">"+code+"</span></span><br><span class=\"font_gray\">(请输入该验证码完成验证，验证码30分钟内有效！)</span></p>\n" +
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
                   "</html>\n"
           );//设置邮件文本内容
//            email.setMsg("大哥天下第一");
           email.addTo(useremail);//设置收件人
//            EmailAttachment attach =new EmailAttachment();//附件对象
//            attach.setPath("D:/c51.zip");//附件文件在系统中的路径
//            attach.setDescription(EmailAttachment.ATTACHMENT);
//            email.attach(attach);//添加附件
           email.send();//发送邮件
       }catch(EmailException e){
           e.printStackTrace();
       }
       }
    }

