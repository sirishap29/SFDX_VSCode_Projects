public class RegistrationDisplayVFController {
    
    public List<wrapperRegistration> WrapperRegLst{get;set;}
    
    public RegistrationDisplayVFController(){
        if(WrapperRegLst == NULL){
         WrapperRegLst = new List<wrapperRegistration>();
        List<Registration__c> rList=new List<Registration__c>();
        rList=[select id,name,Parent_HBranch__c,Parent_Hospital__c,Parent_Physician__c,(select id,name from Patients__r) from Registration__c];
        for(Registration__c r:rList){
            List<Patient__c> patList = r.patients__r;
            if(patList.size() == 0){
           WrapperRegLst.add(new wrapperRegistration(r));
            
            }
        }
        }
        
    }
    
    public void createPatient(){
    
        List<Patient__c> patList = new List<Patient__c>();
        if(WrapperRegLst != NULL){
        List<wrapperRegistration> WrapRegTempList = new List<wrapperRegistration>(); 
        for(wrapperRegistration Wrap:WrapperRegLst){
            if(Wrap.selected == true){
                Patient__c pat = new Patient__c ();
                pat.Name = 'pat'+Wrap.reg.Name;
                pat.parent_Registration__c = Wrap.reg.id;
                patList.add(pat);  
            }
            else
            {
                WrapRegTempList.add(wrap);
            }
        }
        insert patList;
        WrapperRegLst = WrapRegTempList;
        }
        
    }
    
    public class wrapperRegistration{
        public Registration__c reg{get;set;}
        public boolean selected{get;set;}
        
        public wrapperRegistration(Registration__c r){
            reg = r;
            selected = false; 
        }
        
    }

}