trigger PatientTrigger on Patient__c (before insert,before update,after update,after delete) {
          
    PatientTriggerHandler patientHandler = new PatientTriggerHandler();
/*    if(Trigger.isBefore){
        if(Trigger.isInsert){
            patientHandler.onBeforeInsert(Trigger.New);
        }
        else if(Trigger.isUpdate){
            patientHandler.onBeforeUpdate(Trigger.New,Trigger.oldMap);
        }
    }
    else if(Trigger.isAfter){
    if(Trigger.isUpdate){
        patientHandler.onAfterUpdate(Trigger.New,Trigger.oldMap); 
    }
    else if(Trigger.isDelete){
        patientHandler.onAfterDelete(Trigger.oldMap);
    }
    } */
}