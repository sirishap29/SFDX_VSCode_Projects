public class DemoMethodOveriding1 {
    
    public DemoMethodOveriding1(){
         DemoMethodOverriding dm = new DemoMethodOverriding();
        Contact con1=dm.getDetail();
        Account acc1=dm.getDetail('BCBS Association');
        system.debug('Contact----'+con1);
        system.debug('ACcount----'+acc1);
                
/*
       DemoMethodOverriding dm = new DemoMethodOverriding();
        string str=dm.getPatientName();
        system.debug('Patient Name----'+str);*/
    } 

}