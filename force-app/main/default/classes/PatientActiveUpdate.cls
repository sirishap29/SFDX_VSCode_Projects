public class PatientActiveUpdate implements Database.Batchable<Sobject>,Database.stateful{
    
    public integer new_patients=0;
    public integer upd_patients=0;
    public integer no_registrations=0;
    public Database.QueryLocator start(Database.BatchableContext bc){
        string Query = 'select id,name,(select id,name,isActive__c from patients__r) from registration__c';
        Return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc,List<Registration__c> regList){
        if(regList != NULL){
            system.debug('#####################################first List#########' +regList);
            List<patient__c> patList = new List<patient__c>();
            List<patient__c> patList1 = new List<patient__c>();
            for(Registration__c reg:regList){
                 system.debug('#####################################regpat List#########' +reg.patients__r);
                 system.debug('#####################################regpat List size#########' +reg.patients__r.size());
                if(reg.patients__r.size() == 0){
                    Patient__c pat = new Patient__c();
                        pat.Name = reg.name+'pat1';
                        pat.parent_Registration__c = reg.id;
                        pat.isActive__c = true;
                        patList1.add(pat);
                        new_patients++;
                         system.debug('#####################################pat List2#########' +patList1);
                 }
                if(reg.patients__r != NULL){
                      integer i=0;
                    for(Patient__c pat:reg.patients__r){
                        if(pat.isActive__c == false && i == 0){
                            pat.isActive__c = true;
                            patList.add(pat);
                            upd_patients++;
                            system.debug('#####################################pat List1#########' +patList);
                            i++;
                         } 
                        if(i>0){
                            no_registrations++;
                        }
                         } 
                 }
            }   
            system.debug('#####################################final List#########' +patList.size());
            system.debug('#####################################final List#########' +patList1.size());
            insert patlist1;
            upsert patList;
        }
    }
    
    public void finish(Database.BatchableContext bc){
  
        system.debug('############################################'+upd_patients);
        system.debug('##############################################'+new_patients);
        /*    Map<id,User> mapUsers = new Map<id,user>([select id,name,email from user where name IN ('Maheswara Reddy','Sirisha Pongileti')]);
        
        List<Messaging.SingleEmailMessage> emailLst1 = new  List<Messaging.SingleEmailMessage>();
        for(user u:mapUsers.Values()){
            Messaging.SingleEmailMessage email = new Messaging.SingleEmailMessage();
            email.setSubject('Appointment Status Update');
                String body = 'Hi '+ u.Name+',<br/><br/>This email to notify that the patient details has been updated.<br/>'+
                               '<b>No.of updated patients</b>: '+upd_patients+'<br/>'
                               +'<b>No.of new patients created </b>: '+new_patients+ no_registrations+'<br/>'
                               +'<br/><br/><br/> Regards,<br/>Support Team';
                email.setHtmlBody(body);
                email.setToAddresses(new List<String>{u.email});
                    email.setccAddresses(new List<String>{u.Email});
                emailLst1.add(email);
              }
       Messaging.sendEmail(emailLst1);*/
        
    } 

}