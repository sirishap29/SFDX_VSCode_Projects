public class PatientTriggerHandler {
    
    public void onBeforeInsert(List<Patient__c> patList){
       
        Map<ID,Patient__c> mapPats = new Map<ID,Patient__c>([select id,parent_registration__c from Patient__c]);
        for(Patient__c patNew:patList){
            for(Patient__c patOld:mapPats.Values()) {
                if(patOld.parent_registration__c != NULL){
                if(patOld.parent_registration__c == patNew.parent_registration__c){
                    patNew.addError(Label.Error_message);
                    }
                }
            }
        
        }
        
    }
    
    public void onBeforeUpdate(List<Patient__c> patList, map<id,Patient__c> mapOld){
        
        
             
        Map<ID,Patient__c> mapPats = new Map<ID,Patient__c>([select id,parent_registration__c from Patient__c]);
        for(Patient__c patNew:patList){
           if(patNew.parent_registration__c != mapOld.get(patNew.ID).parent_registration__c){
               for(Patient__c patOld:mapPats.Values()) {
               if(patOld.parent_registration__c != NULL){
                   if((patOld.parent_registration__c == patNew.parent_registration__c)){
                        patNew.addError(Label.Error_message);
                        }
                }
                }
            
            }
        }
        
    }

    public void onAfterUpdate(List<Patient__c> patList, map<id,Patient__c> mapOld){        
         set<id> phyNewIDs = new set<id>();
         set<id> phyOldIDs = new set<id>();
        for(Patient__c pat:patList){
            if(pat.Primary_Physician__c != mapOld.get(pat.id).Primary_Physician__c ){
            id pidOld;    
            id pidNew;
            pidNew = pat.Primary_Physician__c;
            pidOld = mapOld.get(pat.id).Primary_Physician__c;
            phyOldIDs.add(pidOld);
            phyNewIDs.add(pidNew);
            }
        }
         List<Physician__c> phyNewLst = [select id,No_of_Patients__c from Physician__c where id IN :phyNewIDs];
         List<Physician__c> phyOldLst = [select id,No_of_Patients__c from Physician__c where id IN :phyOldIDs];
         List<Physician__c> updLst = new List<Physician__c>();
        if(phyNewLst != NULL){
        for(Physician__c pid:phyNewLst){
             if(pid != NULL){
            Physician__c p = new Physician__c();
            p.id = pid.id;
            if(pid.No_of_Patients__c == NULL){
            pid.No_of_Patients__c = 0;
            } 
            p.No_of_Patients__c=pid.No_of_Patients__c+1;
            updLst.add(p);
            }
        }
        for(Physician__c pid:phyOldLst){
            Physician__c p = new Physician__c();
            p.id = pid.id;
            p.No_of_Patients__c=pid.No_of_Patients__c-1;
            updLst.add(p);
        }    
        }
        update updLst;
    }
    
    public void onAfterDelete(map<id,Patient__c> mapOld){
         set<id> phyIds = new set<id>();
        for(Patient__c pat:mapOld.values()){
          id pid = pat.Primary_Physician__c;
          phyIds.add(pid);     
        }
        map<id,Physician__c> mapPhy = new map<id,Physician__c>([select id,No_of_Patients__c from Physician__c 
                                                                        where id IN :phyIds]); 
        
        for(Physician__c phy:mapPhy.values()){
            phy.No_of_Patients__c = phy.No_of_Patients__c-1;        
        }
         update mapPhy.Values();
    }
}