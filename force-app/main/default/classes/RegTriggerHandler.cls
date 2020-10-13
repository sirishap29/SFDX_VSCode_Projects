public class RegTriggerHandler {
  
    public List<Registration__c> regUpdLst = new List<Registration__c>();
    
    
    public void onAfterInsert(list<Registration__c> regLst){
        List<Patient__c> patLst = new List<Patient__c>();
        for(Registration__c reg:regLst){
            if(reg != NULL){
               Patient__c pat = new Patient__c();
                pat.Age__c = reg.Age__c;
                pat.email__c = reg.email__c;
                pat.Phone__c = reg.Phone__c;
                pat.Address__c = reg.Address__c;
                pat.parent_Registration__c = reg.Id;
                patLst.add(pat);
            }
        }
        
        QueuableClassDemo qc = new QueuableClassDemo(patLst);
        system.enqueueJob(qc);
   //     insert patLst;
    }
    
    public void onAfterUpdate(list<Registration__c> regLst){
        regUpdLst = regLst;
        set<Id> setIds = new set<Id>();
        for(Registration__c reg:regLst){
            ID sid = reg.ID;
            setIds.add(sid);
        }
        List<Patient__c> patLst = [select id,email__c from Patient__c where parent_Registration__r.Id IN :setIds];
        List<Patient__C> updLst = new List<Patient__C>();
        for(Registration__c reg:regLst){
            for(Patient__c pat:patLst){
                pat.email__c = reg.email__c;
                updLst.add(pat);
            }
        }
        update updLst; 
    } 
    
   
}