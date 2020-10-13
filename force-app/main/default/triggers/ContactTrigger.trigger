trigger ContactTrigger on Contact (before insert) {


      ContactTriggerHandler  contactHandler = new ContactTriggerHandler();
      
     if(Trigger.isInsert){
            
              contactHandler.onBeforeInsert(Trigger.New);
        }
        
}