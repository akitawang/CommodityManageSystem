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
		SimpleDateFormat sdf =new SimpleDateFormat("yyyy-MM-dd");  //��ȡ��ǰʱ��
		String datetime=sdf.format(date);
		sms.send(recipients, "����Ҫ!���ֱ�������  �һ�����","�𾴵Ŀ��ֱ�������"+admin.getUsername()+",���ã�<br/><br/>��л���ٴλص����ֱ�������Ϊ���һ��������룬����ʮ�����֮�ڵ����������:<br/>"+url+" <br/>���ֱ��������С��鶼�ڵ����ţ�<br/>������������˲���������Դ���Ϣ��<br/><br/><br/><br/>Mr.Wang<br/>���ֱ������� ��������<br/>"+datetime);
	}
 
 
	/*������
	public static void main(String[] args) throws AddressException, MessagingException{
		SimpleMailSender sms = new SimpleMailSender("tianxia00115@163.com","383160100033");
		ArrayList<String> recipients = new ArrayList<String>();
		recipients.add("2867870421@qq.com");
		 
		for(String recipient:recipients){
			sms.send(recipients, "test����","hello hrwhisper.");
		}
	}*/
}
 