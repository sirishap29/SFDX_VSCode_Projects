public class DemoStaticOverrriding {
    
    public string str='string with one param';
    public string str1='string with two params';
    public string str2='string with two params';
    public string str3='string with three params';
    public string str4='dtring with three params';
    public integer int1=100000;
    
    public DemoStaticOverrriding(){
        
       
        
    }
    
    public void getAccName(){
         integer i1=int1;
        i1 = i1*12/100;
        getAccName(str);
        getAccName(str1,str2);
        getAccName(str3,str4,i1);
    }
    

    public static void getAccName(string str1){
        system.debug(str1);
        string modstr='modified string';
        str1=modstr;
        system.debug(str1);
    }
    
    public static void getAccName(string str1,string str2){
        
        system.debug(str1);
        system.debug(str2);        
    }
    
    public static void getAccName(string str1,string str2,integer int1){
        system.debug(str1);
        system.debug(str2);
        system.debug(int1);
    }
}