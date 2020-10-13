public class updtApptFromHospBatch implements Database.Batchable<Sobject>,Database.stateful {
    public boolean batch_flag;
    public integer Hosp_cnt = 0;
    public integer app_cnt = 0;
   
    public Database.QueryLocator start(Database.BatchableContext bc){
        string str = 'Open';
        string query = 'select id,name,(select id,name,status__c,Appointment_Date__c from Appointments__r where Appointment_Date__c < today and Status__c = \'Open\') from hospital__c';
        Return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc,List<Hospital__c> lstHosp){
        if(lstHosp != NULL){
            List<Appointment__c> appList = new List<Appointment__c>();
            for(Hospital__c hosp:lstHosp){
                if(hosp.Appointments__r != NULL){
                    for(Appointment__c app:hosp.Appointments__r){
                        if(app.Status__c == 'Open'){
                        app.Status__c = 'Closed';
                        appList.add(app);
                        }
                    }
                    app_cnt++;
                }
                Hosp_cnt++;
            }
  //          batch_flag = true;
            update appList;
        }
    }
    
    public void finish(Database.BatchableContext bc){
        Map<id,User> mapUsers = new Map<id,user>([select id,name,email from user where name IN ('Maheswara Reddy','Sirisha Pongileti')]);
        
        List<Messaging.SingleEmailMessage> emailLst1 = new  List<Messaging.SingleEmailMessage>();
        for(user u:mapUsers.Values()){
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setSubject('Appointment Status Update');
                String body = 'Hi '+ u.Name+',<br/><br/>This email to notify that the status has been closed.<br/>'+
                               '<b>No.of Hospitals Processed</b>: '+Hosp_cnt+'<br/>'
                               +'<b>No.of Appointments Processed </b>: '+app_cnt+'<br/>'
                               +'<br/><br/><br/> Regards,<br/>Support Team';
                email.setHtmlBody(body);
                email.setToAddresses(new List<String>{u.email});
                    email.setccAddresses(new List<String>{u.Email});
                emailLst1.add(email);
              }
       Messaging.sendEmail(emailLst1);
        
    }

}