public class AccountViewCustomController { 
    public Account acc{get;set;}
    public string accName{get;set;}
    public string selectedState{get;set;}
    
    public integer indexVal=0;
    
    public AccountViewCustomController(){
        id accId = ApexPages.currentPage().getParameters().get('aid');
        accName = ApexPages.currentPage().getParameters().get('aName');
        
        acc=[select id,name,rating,type,BillingStreet,BillingState,BillingCity from Account where id = :accId];
    }
    
     public void stateChange() {
        accName='SUnshine -'+selectedState;
    }
    
     public void actionFunctionMethod(){
        accName = 'Action funcion executed';
    }
    
    public void actionPollerMethod(){
        List<String> lastNames = new List<String>{'Siri','Mahi','Chinni','SriMahi'};
            
            accName=lastNames[indexVal];
            indexVal=indexVal+1;
    }
    

}