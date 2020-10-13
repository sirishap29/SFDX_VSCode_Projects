public class DemoCollections3 {
    
    public DemoCollections3(){
        
  //set example
        set<string> setName = new set<string>{'pihu','smily','shiny','sona','amy','mahee'}; 
        set<integer> setVal = new set<integer>{011,012,013,014,015};
        system.debug('First Name Set-----' +setName);
        system.debug('First value set-----' +setVal);
        setVal.addall(getSet());
        if(!setVal.isEmpty()){
            list<integer> listVal1 = new list<integer>();
            if(listVal1 != null){
                 listVal1.addall(setVal);
            }      
            system.debug('First value set-----' +listVal1);
            system.debug('contains -----' +listVal1.contains(14));
            system.debug('contains -----' +listVal1.contains(21));
            system.debug('get -----' +listVal1.get(6));
            boolean result=setVal.containsAll(listVal1);
            system.debug('contains all -----' + result);
        }
        
  // list example  
 /*   list<string> lstName = new list<string>{'pihu','smily','shiny','sona','amy','mahee'};
        system.debug('First Name List-----' +lstName);
        lstName.addall(getList());
        if(!lstName.isEmpty()){
            lstName.add(2,'venny');
            system.debug('addall Name List----' +lstName);
            system.debug('list Size---' + lstName.Size());
            system.debug('list remove---' + lstName.remove(4));
            system.debug('list get---' + lstName.get(4));
            system.debug('list index---' + lstName.indexof('mahee'));
            integer i=lstName.indexof('shin');
            system.debug('list contains---' + lstName.contains('katy'));
            system.debug('list clone---' + lstName.clone());
        } */
        }
    public list<string> getList(){
        list<string> lstName1 = new list<string>();
        lstName1.add('jenny');
        lstName1.add('vinny');
        lstName1.add('anny');
        lstName1.add('katy');
        system.debug('Second List-------' +lstName1);
        return lstName1;
    }
    
    public set<integer> getSet(){
        set<integer> setVal1 = new set<integer>();
        setVal1.add(014);
        setVal1.add(015);
        setVal1.add(016);
        setVal1.add(017);
        setVal1.add(018);
        system.debug('second set values-----' +setVal1);
        return setVal1;
    }
    
    

}