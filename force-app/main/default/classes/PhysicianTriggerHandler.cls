public class PhysicianTriggerHandler {
    
    public void onAfterUpdate(List<Physician__C> phyList){
        Set<ID> pIds = new Set<ID>();
        for(Physician__C ph:phyList){
            ID pid = ph.ID;
            pIDs.add(pid);
        }
        map<id,Appointment__c> mapAppts = new map<id,Appointment__c>([select id,Name,parent_Hospital__r.Name from Appointment__c 
                                                                              where parent_physician__r.id IN :pIDs]);
        List<Hospital__c> hospLst = new List<Hospital__c>();
        for(Appointment__c app:mapAppts.Values()){
            Hospital__c hosp = new Hospital__c();
            hosp.Name = app.parent_Hospital__r.Name;
            hospLst.add(hosp);
        }
        system.debug('###########List of Hospitals##########' +hospLst);
    }

}