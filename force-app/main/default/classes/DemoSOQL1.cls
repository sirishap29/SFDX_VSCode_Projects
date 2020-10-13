public class DemoSOQL1 {
    
    public DemoSOQL1(){
  /*  List<Opportunity> listOpp = [SELECT id,Name,Amount,StageName FROM Opportunity];
    map<id,Opportunity> mapOpp = new map<id,Opportunity>([SELECT id,Name,Amount,StageName,ExpectedRevenue FROM Opportunity]);
    
    system.debug('list -----'+listOpp);
    system.debug('map -----'+mapOpp); */
    }
    
    public void SoqlDemo1(){
        integer count=[select count() from contact c,c.account a where a.name = 'Softbank Investments'];
        system.debug('con count----'+Count);
        list<account> accList = [select account.name, (select contact.lastName from account.contacts) from account 
                                                          where account.name = 'Softbank Investments'];
        account acc=accList[0];
        list<contact> con=acc.contacts;
        system.debug('accList------'+accList);
        system.debug('Contacts------'+con);
        list<contact> conList= [select id,FirstName,lastModifiedBy.name from contact order by lastName,firstname];
        system.debug('conList------'+conList);
        
    }
    
    public void SoqlDemo2(){
        list<contact> conList = [select firstname, account.name from contact where firstname LIKE 'K%' and
                                                                     mailingstate = 'california'];
        contact con = conList[0];
        system.debug('Contact Details----'+con);
        system.debug('Contact Details----'+con.account.name);
        list<account> accList = [select name,annualrevenue from account where CALENDAR_YEAR(CreatedDate) = 2020 ];
                                                                
        account acc = accList[3];
        system.debug('Account Details----'+acc);
    }
    
    public void SoqlDemo3(){
        list<contact> conList = [select id,name from contact where id in (select contactid from opportunity 
                                                                          where stageName = 'Id. Decision Makers') AND
                                                                   lastname like '%pad%'];
        contact con = conList[0];
        system.debug('Contact------'+con);
        
        map<id,student__c> mapStud = new map<id,student__c>([select id,name,Branch__c,Course__c from student__c]);
        system.debug('mapStudent------'+mapStud);
        set<id> setStd = mapStud.keySet();
        list<student__c> lstStd = mapStud.values();
        system.debug('mapkeyset------'+setStd);
        system.debug('mapvalues------'+lstStd);   
        
    }
    
    public void demoSOQLMethod(){
        list<opportunity> oppList = [select id,name from opportunity where account.name = 'BCBS Association' order by stagename];
     //   system.debug('Opportunity List'+oppList);
     //   system.debug('Opportunity single'+oppList[0]);
        map<id,Employee__c> mapEmp = new map<id,Employee__c>
                                    ([select id,name,Wage_Level__c,Last_Name__c from Employee__c where Department__r.name = 'MM'
                                      order by Wage_Level__c asc,Last_Name__c desc]);
        map<id,Employee__c> mapEmp1 = new map<id,Employee__c>
                                    ([select id,name,Wage_Level__c,Last_Name__c from Employee__c where salary__c > 80000]);
        system.debug('Employees map------'+mapEmp);
        system.debug('Employees map-------'+mapEmp.size());
        system.debug('Employees map1--------'+mapEmp1);
        system.debug('Employees map1---------'+mapEmp1.size());
        map<id,Employee__c> mapEmp2 = mapEmp;
       
        system.debug('Employees map-----'+mapEmp);
        system.debug('Employees map------'+mapEmp.size());
        system.debug('Employees map2--------'+mapEmp2);
        system.debug('Employees map2---------'+mapEmp2.size());
        Employee__c emp1 = new Employee__c();
        emp1.id = 'a013t000013K3D6';
        emp1.name = 'maheswara';
        emp1.Last_Name__c = 'Reddyy';
        emp1.email__c = 'mr@ms.com';
        emp1.Salary__c = 8500; 
        mapEmp2.put(emp1.id,emp1);
        mapEmp2.putAll(mapEmp1);
        system.debug('Employees map-------'+mapEmp);
        system.debug('Employees map--------'+mapEmp.size());
        system.debug('Employees map1--------'+mapEmp1);
        system.debug('Employees map1---------'+mapEmp1.size());
        system.debug('Employees map2---------'+mapEmp2);
        system.debug('Employees map2----------'+mapEmp2.size());
    }

}