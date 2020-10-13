public class DevDemo1Private {
    
        string accName;
        Integer phoneNum;
        Date creatDat;
        DateTime modTime;
        Boolean accStat;
        Decimal salary;
        string email;
       
        static string accName1;
        static string email1;
        final integer phone1;
        static boolean status;
       
       
       public DevDemo1Private(){
       
       accName='BCBS Corporation';
       phoneNum=314757391;
       creatDat=Date.today();
       modTime=DateTime.now();
       accStat=True;
       salary=4000.00;
       email='sree@siri.com';
       
       accName1='Amazon US';
       email1='mahee@siri.com';
       phone1=732789079;
       status=false;
           
        getStatic();   
       accName1=accName;
       email1=email;
       status=accStat;
       system.debug('Account Name'+accName);
       system.debug('Phone'+phoneNum);
       system.debug('creatDat'+creatDat);
       system.debug('modTime'+modTime);
       system.debug('accStat'+accStat);
       system.debug('salary'+salary);
       system.debug('email'+email);
       system.debug('accName1'+accName1);
       system.debug('email1'+email1);
       system.debug('phone1'+phone1);
       system.debug('status'+status);
       
       
       }
    
     public void getStatic(){
        
        accName1='Facebook US';
       email1='bangaru@siri.com';
        status=True;
        
        system.debug('accName1'+accName1);
       system.debug('email1'+email1);
       system.debug('status'+status);
       
        
    }
/*DevDemo1Private pr = new DevDemo1Private();
pr.getStatic();*/       

}