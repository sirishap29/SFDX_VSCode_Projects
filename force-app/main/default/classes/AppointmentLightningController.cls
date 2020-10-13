public class AppointmentLightningController {
    
    @AuraEnabled
    public static Id createAppointment(string appt,Id patId,Id physId,Id hospId){
        
        Appointment__c app = new Appointment__c();
        app.Name = appt;
        app.Parent_Patient__c = patId;
        app.Parent_Physician__c = physId;
        app.Parent_Hospital__c = hospId;
        
        insert app;
        
        return app.Id;
        
    }
    
    @AuraEnabled
    public static WrapperAppointment getDetailsInfo(){
        
        List<Patient__c>  List1 = [select id,name from patient__c];
        List<Physician__c> List2 = [select id,name from physician__c];
        List<Hospital__c> List3 = [select id,name from hospital__c];
        
        WrapperAppointment hospWrapper = new WrapperAppointment();
        hospWrapper.patList = List1;
        hospWrapper.phyList = List2;
        hospWrapper.hospList = List3;
        return hospWrapper;
    }
    
    public class WrapperAppointment{
        @AuraEnabled
        public List<Patient__c> patList;
        @AuraEnabled
        public List<Physician__c> phyList;
        @AuraEnabled
        public List<Hospital__c> hospList;
    }
}