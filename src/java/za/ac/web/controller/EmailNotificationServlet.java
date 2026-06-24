package za.ac.web.controller;

import java.io.IOException;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.*;

import javax.servlet.ServletException;
import javax.servlet.http.*;


public class EmailNotificationServlet
extends HttpServlet{


@Override

protected void doPost(

HttpServletRequest req,

HttpServletResponse res

)

throws ServletException,
IOException{


String senderEmail=

"courtcasesystem5@gmail.com";


String senderPassword=

"zqamymdcttzibrph"; // app password (no spaces)



String receiverEmail=

req.getParameter(

"receiverEmail"

);



try{


Properties p=
new Properties();



p.put(

"mail.smtp.auth",

"true"

);



p.put(

"mail.smtp.starttls.enable",

"true"

);



p.put(

"mail.smtp.host",

"smtp.gmail.com"

);



p.put(

"mail.smtp.port",

"587"

);




Session session=

Session.getInstance(

p,

new Authenticator(){

@Override

protected PasswordAuthentication

getPasswordAuthentication(){


return new PasswordAuthentication(

senderEmail,

senderPassword

);

}

}

);





Message msg=

new MimeMessage(

session

);



msg.setFrom(

new InternetAddress(

senderEmail

)

);



msg.setRecipients(

Message.RecipientType.TO,

InternetAddress.parse(

receiverEmail

)

);



msg.setSubject(

"Court Case Notification"

);



msg.setText(

"Hello,\n\n"

+

"A new court case "

+

"has been added "

+

"to the system.\n\n"

+

"Regards,\n"

+

"CCMS"

);




Transport.send(

msg

);



res.sendRedirect(

"dashboard.jsp?msg=EmailSent"

);



}catch(Exception e){


e.printStackTrace();


res.sendRedirect(

"dashboard.jsp?msg=EmailFailed"

);

}


}


}