public class DemoCollections1 {
    
    List<string> lstBranch;
    Set<string> setBranchCode;
    map<string,string> mapBranch;
    
    public DemoCollections1(){
        lstBranch=new List<string>();
        setBranchCode=new Set<string>();
        mapBranch=new map<string,string>();
        lstBranch=getBranchList();
        setBranchCode=getBranchCodes();
        mapBranch=getBranchDetails();
        
        system.debug('list' + lstBranch);
        system.debug('set' + setBranchCode);
        system.debug('map' + mapBranch);
        
    }
    
    public list<string> getBranchList(){
        List<string> lstBranch1=new List<string>();
        lstBranch1.add('Dallas');
        lstBranch1.add('SFO');
        lstBranch1.add('Chicago');
        lstBranch1.add('Atlanta');
        return(lstBranch1);
    }
    
    public set<string> getBranchCodes(){
        set<string> setBranchCode1=new set<string>();
        setBranchCode1.add('A11');
        setBranchCode1.add('A12');
        setBranchCode1.add('A13');
        setBranchCode1.add('A14');
        return(setBranchCode1);
    }
    
    public map<string,string> getBranchDetails(){
        map<string,string> mapBranch1=new map<string,string>();
        mapBranch1.put('B11', 'NJ');
        mapBranch1.put('B12', 'NY');
        mapBranch1.put('B13', 'DC');
        mapBranch1.put('B14', 'NC');
        return(mapBranch1);
    }

}