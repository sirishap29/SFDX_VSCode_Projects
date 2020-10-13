public class DemoCollections2 {
    
    list<string> branchName;
    set<string>  branchCode;
    map<integer,string> branchDetails;
    
    public DemoCollections2(){
        branchName = new list<string>();
        branchCode = new set<string>();
        branchDetails = new map<integer,string>();
         branchName=getList();
         branchCode=getSet();
         branchDetails=getMap();
       system.debug('List Branch Name------' + branchName);
       system.debug('Set Branch Code------' + branchCode);
       system.debug('Map Branch Details-------' + branchDetails);
    }
     
    public list<string> getList(){
        //  branchName.add(bName); 
          branchName.add('Chandler'); 
          branchName.add('Mesa'); 
          branchName.add('Gilbert'); 
          branchName.add('Phoenix'); 
        //add duplicates 
          branchName.add('Chandler'); 
          branchName.add('Mesa'); 
          return branchName;
        
    }
    
    public void deleteList(string bName){
        
        system.debug('isdeleted----------' + branchName.remove(branchName.indexOf(bName)));
        system.debug('List Branch Name after deletion-------' + branchName);
        
    } 

     public set<string> getSet(){
       //   branchCode.add(bCode); 
          branchCode.add('A11'); 
          branchCode.add('A12'); 
          branchCode.add('A13'); 
          branchCode.add('A14'); 
        //add duplicates 
          branchCode.add('A11'); 
          branchCode.add('A14'); 
          return branchCode;
        
    }
    
    public void deleteSet(string bCode){
        
        system.debug('isdeleted------------' + branchCode.remove(bCode));
        system.debug('Set Branch Code after deletion----------' + branchCode); 
        
    } 
    
     public map<integer,string> getMap(){
          branchDetails.put(111,'St.Loius');
          branchDetails.put(112,'LA');
          branchDetails.put(113,'fremont');
          branchDetails.put(114,'Virgenia');
         //add duplicates
          branchDetails.put(113,'FREMONT');
          branchDetails.put(115,'LA');
          return branchDetails;
        
    }
    
    public void getBranchName(integer bCode){
        
       system.debug('get branch name-----' + branchDetails.get(bCode));
        
    } 
    
    /* Anonymus block
     * DemoCollections2 dc=new DemoCollections2();
       //dc.getList('Chandler');
         dc.deleteList('Chandler');
       //dc.getSet('A11');
       dc.deleteSet('A11');
       dc.getBranchName(114); */
}