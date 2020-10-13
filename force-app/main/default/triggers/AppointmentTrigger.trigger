trigger AppointmentTrigger on Appointment__c (before insert,before update,before delete,after insert,after update) {
    
    AppointmentTriggerHandler appHandler = new AppointmentTriggerHandler();
    
/*    if(Trigger.isBefore){
    if(Trigger.isInsert){
        appHandler.onBeforeInsert(Trigger.New);
    }
    else if(Trigger.isUpdate){
        appHandler.onBeforeUpdate(Trigger.New,Trigger.oldMap);
        
    }
    }
    else if(Trigger.isDelete){
        appHandler.onBeforeDelete(Trigger.oldMap);
    }
    else if(Trigger.isAfter){
    if(Trigger.isInsert){
        appHandler.onAfterInsert(Trigger.New);
    }
    else if(Trigger.isUpdate){
        appHandler.onAfterUpdate(Trigger.New,Trigger.oldMap);
    }
    } */

}