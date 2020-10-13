public class DevClass1 {
    
    public String name = 'Mahee Reddy';
    public Integer i=10;
    public Decimal d=2000.00;
    public Date dt = Date.Today();
    public DateTime myDateTime = DateTime.newInstance(2020, 3, 16, 23, 0, 0);
    public Date myDate = myDateTime.dateGMT();
    public Date expected = Date.newInstance(2020, 3, 17);
    
    public void method1(){
        
        system.debug(name);
        system.debug(i);
        system.debug(d);
        system.debug(dt);
        system.debug(myDateTime);
        system.debug(myDate);
        system.debug(expected);
        
        acc.Name='SIRI Technologies';
        con.AssistantName='Mahee';
        emp.Name='Maheswara';
        
        system.debug(acc.Name);
        system.debug(con.AssistantName);
        system.debug(emp.Name);
    }
    
    Account acc = new Account();
    
    Contact con = new Contact();
    Employee__c emp = new Employee__c();
}