@isTest
public class StopEmailHandler_Test {
    public static  Testmethod void unitTest(){
        String uniqueUserName = 'standarduser' + DateTime.now().getTime() + '@testorg.com';
        profile profileName=[Select Id,Name from Profile where Name='Chatter Free User'];
        User u = new User(Alias = 'standt', Email='standarduser@testorg.com',
                          EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
                          LocaleSidKey='en_US', ProfileId = profileName.Id,
                          TimeZoneSidKey='America/Los_Angeles',
                          UserName=uniqueUserName);
        
        
        String uniqueUserName1 = 'standarduser' + DateTime.now().getTime() + '@testorg.com';
        profile profileName1=[Select Id,Name from Profile where Name='System Administrator'];
        User u1 = new User(Alias = 'standt', Email='standarduser@testorg.com',
                           EmailEncodingKey='UTF-8', LastName='Testing', LanguageLocaleKey='en_US',
                           LocaleSidKey='en_US', ProfileId = profileName1.Id,
                           TimeZoneSidKey='America/Los_Angeles',
                           UserName=uniqueUserName1);
        
            
            test.startTest();
            //Insert emailmessage for case
            EmailMessage email = new EmailMessage();
            email.FromAddress = 'test@abc.org';
            email.Incoming = True;
            email.ToAddress= 'test@xyz.org';
            email.Subject = 'Test email';
            email.HtmlBody = 'Test email body';
            insert email;
            test.stopTest();
        
        
        
            Case c = new Case();
            c.Subject = 'Om Test';  
            c.Status ='New';
            c.Priority = 'Medium';
            c.Origin = 'Email';
            insert c;
            
            //Insert emailmessage for case
            EmailMessage email1 = new EmailMessage();
            email1.FromAddress = 'test@abc.org';
            email1.Incoming = True;
            email1.ToAddress= 'test@xyz.org';
            email1.Subject = 'Test email';
            email1.HtmlBody = 'Test email body';
            email1.ParentId = c.Id; 
            insert email1;
        
        
    }

}