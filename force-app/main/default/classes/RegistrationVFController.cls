public class RegistrationVFController {
    public string selectedHosp{get;set;}
    public string selectedBranch{get;set;}
    public string selectedPhysician{get;set;}
    public boolean isNew{get;set;}
    public boolean isView{get;set;}
    public boolean isEdit{get;set;}
    public Registration__c reg{get;set;}
    public Registration__c reg1{get;set;}
    public List<SelectOption> hospList{get;set;}
    public List<SelectOption> branchList{get;set;}
    public List<SelectOption> phyList{get;set;}
    public List<HBranch__c> bList = new List<HBranch__c>();
    public List<Physician__c> pList = new List<Physician__c>();
    public RegistrationVFController(){
        isNew=true;
        isView=false;
        isEdit=false;
        reg = new Registration__c();
        hospList=new List<SelectOption>();
        List<Hospital__c> lstHop=[select id,name,(select id,name,Hospital__c from HBranches__r),(select id,name,Parent_Hospital__c from Physicians__r) from Hospital__c];
        for(Hospital__c h:lstHop){
            List<HBranch__c> bLst=h.HBranches__r;
            List<Physician__c> pLst=h.Physicians__r;
            for(HBranch__c br:bLst){
                bList.add(br);
            }
            For(Physician__c ph:pLst){
                pList.add(ph);
            }
          hospList.add(new selectoption(h.id,h.Name));  
            
        }
       
    }
    
    public void getBranches(){
        
        branchList=new List<selectoption>(); 
        phyList=new List<selectoption>();
        for(HBranch__c hb:bList){
            if(hb.Hospital__c == selectedHosp){           
                selectOption so = new selectOption(hb.id,hb.Name);
                branchList.add(so);
            }
             
        }
            for(Physician__c ph:pList){
               if(ph.Parent_Hospital__c == selectedHosp){
               phyList.add(new selectoption(ph.id,ph.Name));
                }
            }   
    }
    
    public void saveRegistration(){
  
        reg.Parent_Hospital__c    =  selectedHosp;
        reg.Parent_HBranch__c     =  selectedBranch;
        reg.Parent_Physician__c   =  selectedPhysician;
        if(reg != NULL){
            insert reg;
        }
        
        isNew=false;
        isView=true;
        isEdit=false;
    }
    
    public void editClicked(){
        isNew=false;
        isView=false;
        isEdit=true;
    }
    
    public void deleteClicked(){
        delete reg;
    }
    
    public void saveClicked(){
        if(reg != NULL) {
            update reg;
        }
        
    }
    
    public void cancelClicked(){
        isNew=false;
        isView=true;
        isEdit=false;
    }
}