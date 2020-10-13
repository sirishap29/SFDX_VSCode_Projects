trigger PhysicianTrigger on Physician__c (after update) {
    
    PhysicianTriggerHandler phyHandler = new PhysicianTriggerHandler();
    phyHandler.onAfterUpdate(Trigger.New);

}