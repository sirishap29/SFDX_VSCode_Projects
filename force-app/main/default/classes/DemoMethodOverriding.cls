public class DemoMethodOverriding {
    
    public static string str1;
    public integer int1;
    public boolean flag;
    
    public DemoMethodOverriding(){
        string str=accDetails();
        system.debug(str);
        
    }
    
    public string accDetails(){
       string str='BCBS Association';
        return(str);
    }
    public void accDetails(string str,integer int1){
        
        
        account acc=new account();
        acc.Name=str;
        acc.AnnualRevenue=int1;
        system.debug('account----'+acc);
        
    }
    public  void accDetails(string str,integer int1,string email){
        
        account acc=new account();
        acc.Name=str;
        acc.AnnualRevenue=int1;
        acc.Email1__c=email;
        system.debug('account----'+acc);
        
        /*DemoMethodOverriding dm = new DemoMethodOverriding();
dm.accDetails('BOA Corporation',100000);
dm.accDetails('JP Morgan Chase',200000,'shree@siri.com');*/

       
              
    }
  
    /*
    public DemoMethodOverriding(){
        
        Contact con1=getDetail();
        Account acc1=getDetail('BCBS Association');
        system.debug('Contact----'+con1);
        system.debug('ACcount----'+acc1);  
        
    }
    
    public Contact getDetail(){
        Contact con=new Contact();
        con.FirstName='Maheswara Reddy';
        con.AssistantPhone='3148223917';
        con.Department='Finance';
        con.Email='mahee@siri.com';
        return(con);
        
    }
    public Account getDetail(string str1){
        Account acc=new Account();
        acc.Name=str1;
        acc.AnnualRevenue=3000;
        acc.AccountNumber='123456';
        acc.BillingCountry='US';
        acc.Industry='Education';
        return(acc);
    }
   */
    
  /*  public string patName;
    public integer age;
    public Boolean isPatient;
    
    public DemoMethodOverriding(){
        assignValues();
        string conStr = getPatientName();
    }
    
    public void assignValues(){
        
        patName='Kate Miller';
        age=30;
        isPatient=true;
        system.debug('patName---'+patName);
        system.debug('age---'+age);
        system.debug('isPatient---'+isPatient);
    }
    
    public string getPatientName(){
        
         string str='Emily Byrne';
         return(str);
    }
*/
   

}