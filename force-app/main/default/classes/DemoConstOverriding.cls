public class DemoConstOverriding {
    
    public string str1='string1';
    public string str2='string2';
    public integer int1=20;
    public boolean flag=true;
    
    public DemoConstOverriding(){
        str1='mod. string1';
        str2='mod. string2';
        int1=15;
        system.debug(str1);
        system.debug(str2);
        system.debug(int1);
        
    }
    
    public DemoConstOverriding(boolean param1){
        param1=flag;
        system.debug('param1----'+param1);
    }
    
    public DemoConstOverriding(Date dt1,DateTime dt2){
        
        system.debug('Date----'+dt1);
        system.debug('DateTime----'+dt2);
        
    }
  
    
    public DemoConstOverriding(string str,integer int1,integer salary){
        
       /* system.debug('Name----'+str);
        system.debug('Age----'+int1);
        system.debug('Salary-----'+salary);*/
        
        str='Dobson towncenter';
        int1=28;
        salary=5000;
        
        system.debug('Name----'+str);
        system.debug('Age-----'+int1);
        system.debug('Salary-----'+salary);
        
     /*   system.debug(str1);
        system.debug(str2);
        system.debug(int1);
        str1='mod. string1';
        str2='mod. string2';
        int1=15;
        system.debug(str1);
        system.debug(str2);
        system.debug(int1); */
        
    }
    
    /*DemoConstOverriding dc = new DemoConstOverriding();
DemoConstOverriding dc1 = new DemoConstOverriding('Holidays Inn',32,6000);
DemoConstOverriding dc2 = new DemoConstOverriding(false);
string year = '2020';
string month = '10';
string day = '5';
string hour = '16';
string minute = '20';
string second = '20';
string stringDate = year + '-' + month + '-' + day + ' ' + hour + ':' 
    + minute +  ':' + second;
DemoConstOverriding dc3 = new DemoConstOverriding(date.valueOf('2020-10-29'),datetime.valueOf(stringDate));*/


    
    

}