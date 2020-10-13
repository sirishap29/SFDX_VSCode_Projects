public class ActionCustomViewController {

    public Account acc{get;set;}
    public Opportunity opp{get;set;}
    public string selectedStageName{get;set;}
    public List<SelectOption> stageList{get;set;}
    
    public ActionCustomViewController(){
        stageList=new List<SelectOption>();
        
        
    }
    //Changes
    public void SaveDetails() {
        acc=new Account();
        opp=new Opportunity();
        insert acc;
        insert opp;
        
    }

}