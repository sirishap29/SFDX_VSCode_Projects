public class PatientAppointmentController {
    
    @AuraEnabled
    public static List<Patient__c> getAllPatients(){
        List<Patient__c> patList = [select id,name from Patient__c];
        return patList;
    }
    
    @AuraEnabled
    public static List<Appointment__c> getAllAppointments(Id patId){
        Patient__c pat = [select id,name,(select id,name from Appointments__r) from Patient__c where id = :patId];
        List<Appointment__c> appList=new List<Appointment__c>();
        appList = pat.Appointments__r;
        return appList;
    }

}