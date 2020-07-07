package com.nms.util;

 
 
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.mail.MessagingException;
import javax.mail.internet.AddressException;

import com.nms.pojo.Admin;
 
 
public class SendMail {
 
 
	public void send(String email,String url,Admin admin) throws AddressException, MessagingException
	{
		SimpleMailSender sms = new SimpleMailSender("3057854381@qq.com","bqfiohfurxkwdhba");
		String recipients = email;
		Date date =new Date();
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");  //获取当前时间
		String datetime=sdf.format(date);
		sms.send(recipients, "很重要!克林比勒星球  找回密码","尊敬的克林比勒星人"+admin.getUsername()+",您好！<br/><br/>感谢您再次回到克林比勒星球，为了找回您的密码，请在十五分钟之内点击以下连接:<br/>"+url+" <br/>克林比勒星球的小伙伴都在等你呐！<br/>如果不是您本人操作，请忽略此消息。<br/><br/><br/><br/>Mr.Wang<br/>克林比勒星球 首领助理<br/>"+datetime);
	}
 
 
	/*测试类
	public static void main(String[] args) throws AddressException, MessagingException{
		SimpleMailSender sms = new SimpleMailSender("tianxia00115@163.com","383160100033");
		ArrayList<String> recipients = new ArrayList<String>();
		recipients.add("2867870421@qq.com");
		 
		for(String recipient:recipients){
			sms.send(recipients, "test测试","hello hrwhisper.");
		}
	}*/
}
 