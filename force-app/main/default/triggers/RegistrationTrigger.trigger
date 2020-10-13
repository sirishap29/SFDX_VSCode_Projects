trigger RegistrationTrigger on Registration__c (after insert,after update) {
    
    RegTriggerHandler regHandler = new RegTriggerHandler();
/*    if(Trigger.isAfter){
        if(Trigger.isInsert){
           regHandler.onAfterInsert(Trigger.New); 
        }
        else if(Trigger.isUpdate){
            regHandler.onAfterUpdate(Trigger.New);
        }
    } */

}