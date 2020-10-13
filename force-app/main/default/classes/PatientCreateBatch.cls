public class PatientCreateBatch implements Database.batchable<Sobject>,Database.stateful,Schedulable {
      public string query;
    public integer tot_Cnt = 0;
    List<Registration__c> regList = new List<Registration__c>();
    List<Patient__c> datLst = new List<Patient__c>();
    public PatientCreateBatch(){
       query = 'Select id,name,parent_registration__c from Patient__c where parent_registration__c = NULL';      
    }
    public PatientCreateBatch(set<ID> PIDs){
        query = 'Select id,name,parent_registration__c from Patient__c where parent_registration__c = NULL and id IN :PIDs';
    }
    
    public Database.QueryLocator start(Database.BatchableContext bc){
        if(String.isEmpty(Query)){
            query = 'Select id,name from Patient__c where parent_registration__c = NULL';
        }
        
        return Database.getQueryLocator(query);
    }
    
    public void getRegList(){
        List<Registration__c> regData = [select id,name,(select id,name from patients__r) from Registration__c];
        integer i=0;
        for(Registration__c reg:regData){
        datLst = regData[i].patients__r;
            if(datLst.isEmpty()){
                regList.add(reg);
            }
            i++;
        }
    }
    
  
    public void execute(Database.BatchableContext bc,List<Patient__c> lstData){
        getRegList();
        integer i=0;
        for(Patient__c pat:lstData){
            if(pat.parent_Registration__c == NULL){  
              pat.parent_Registration__c = regList[i].ID;
            }
              i++;
        }
       
        tot_Cnt = tot_Cnt+lstData.size();
        update lstData;
        
    }
    
    public void execute(SchedulableContext sc){
        
        PatientCreateBatch Batch = new PatientCreateBatch();
        Database.executeBatch(Batch);
    }
    
    public void finish(Database.BatchableContext bc){
        system.debug('Total Count###################################'+tot_Cnt);
        system.debug('BatchContext####################################' +bc);
    }

}