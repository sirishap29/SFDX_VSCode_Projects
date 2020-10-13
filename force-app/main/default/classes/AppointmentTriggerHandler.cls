public class AppointmentTriggerHandler {
    
    updtApptFromHospBatch batch = new updtApptFromHospBatch();
    public void onBeforeInsert(List<Appointment__c> appLstNew){
       /* List<Appointment_Date__c> dateLst = new List<Appointment_Date__c>();
        List<Slot__c> slotLst = new List<Slot__c>();
        List<Slot_Time__c> timeLst = new List<Slot_Time__c>();  */
          List<Appointment__c> appLst = [select id,Appointment_Date__c,Slot__c,Slot_Time__c,Parent_Patient__c,Parent_Physician__c from Appointment__c];
        for(Appointment__c appNew:appLstNew){
            if(appNew.Status__c == NULL){
                 appNew.Status__c = 'Open';
              }
            for(Appointment__c appOld:appLst){
                if((appOld.Parent_Physician__c == appNew.Parent_Physician__c)&&
                   (appOld.Appointment_Date__c == appNew.Appointment_Date__c)&&
                   (appOld.Slot__c == appNew.Slot__c)&&
                   (appOld.Slot_Time__c == appNew.Slot_Time__c)&&
                   (appOld.Status__c != NULL)){
                       appNew.addError('You cannot Book Duplicate Appointments');
                   }       
                  }
                }
            
    }
    
    public void onBeforeUpdate(List<Appointment__c> appLstNew, map<id,Appointment__c> mapOld){
        //List<Appointment__c> appLst = [select id,Appointment_Date__c,Slot__c,Slot_Time__c,Parent_Patient__c from Appointment__c];
          List<Appointment__c> appLst = mapOld.values();
        for(Appointment__c appNew:appLstNew){
            for(Appointment__c appOld:appLst){
                 system.debug('##################' +appOld.Parent_Physician__c);
                system.debug('##################' +appNew.Parent_Physician__c);
                if((appOld.Parent_Physician__c == appNew.Parent_Physician__c)&&
                    (appOld.Appointment_Date__c == appNew.Appointment_Date__c)&&
                   (appOld.Slot__c == appNew.Slot__c)&&
                   (appOld.Slot_Time__c == appNew.Slot_Time__c)&&
                   (appOld.Status__c != NULL)&&
                   (appOld.Parent_Hospital__c != NULL)&&
                   (appOld.parent_patient__c != NULL)&&
                   (batch.batch_flag == true)){
                       appNew.addError('You cannot Book Duplicate Appointments');
                   }
                 }
                }
                     
    }
    
    public void onBeforeDelete(map<id,Appointment__c> mapOld){
        List<Appointment__c> delLst = mapOld.values();
        for(Appointment__c app:delLst){
            if(app.Appointment_Date__c >= system.today()){
                app.addError('You cannot delete future appointments');
            }
        }
          
    }
    
    public void onAfterInsert(List<Appointment__c> appList){
    
    set<ID> pIDs = new set<ID>(); 
    for(Appointment__c app:appList){
    ID pId = app.parent_patient__c;
    pIDs.add(pId);
    } 
    List<Patient__c> updList = new List<Patient__c>();
   // List<Patient__c> patList = [select id,Primary_Physician__c from Patient__c where ID IN :patIDs];
    List<AggregateResult> cntLst = [select Parent_Physician__c phy,count(id) cnt from Appointment__c 
                                                                    where parent_patient__r.id IN :pIDs
                                                                           group by Parent_Physician__c];
    cntLst.sort();
    integer i = (cntLst.size())-1;
    ID maxPid = (ID)cntLst[i].get('phy');
    
    for(Appointment__c app:appList){
        if(app.parent_patient__c != NULL){
          Patient__c pat = new Patient__c();
          pat.ID = app.parent_patient__c;
          pat.Primary_Physician__c = maxPid;
          updList.add(pat);
        }
    }
        if(updList != NULL) {   
    update updList;
        }
    
    }
    
    public void onAfterUpdate(List<Appointment__c> appList,map<id,Appointment__c> mapOld){
    
    set<ID> pIDs = new set<ID>(); 
    for(Appointment__c app:appList){
        if((app.Status__c != 'Open')&&((batch.batch_flag == true))){
    ID pId = app.parent_patient__c;
    pIDs.add(pId);
        }
    } 
        if(!pIDs.isEmpty()){
    List<Patient__c> updList = new List<Patient__c>();
   // List<Patient__c> patList = [select id,Primary_Physician__c from Patient__c where ID IN :patIDs];
    List<AggregateResult> cntLst = [select Parent_Physician__c phy,count(id) cnt from Appointment__c 
                                                                    where parent_patient__r.id IN :pIDs
                                                                           group by Parent_Physician__c];
    cntLst.sort();
    integer i = (cntLst.size())-1;
    ID maxPid = (ID)cntLst[i].get('phy');
        
    for(Appointment__c app:appList){
         if((app != NULL)){
          Patient__c pat = new Patient__c();
          pat.ID = app.parent_patient__c;
          pat.Primary_Physician__c = maxPid;
          updList.add(pat);
          }
    }
            
    update updList;
    }
    }

}