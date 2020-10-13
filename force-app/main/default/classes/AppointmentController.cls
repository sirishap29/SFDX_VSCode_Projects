Public Class AppointmentController{

       public AppointmentController(){
       
       updateStatus();
       }
       
       public void updateStatus(){
          
          List<Appointment__c> appList = [select id,Status__c from Appointment__c];
          
          for(Appointment__c app:appList){
             if((app != NULL)&&(app.Status__c == NULL)){
             app.Status__c = 'Open';
             } 
          }
          Update appList;
       }
}