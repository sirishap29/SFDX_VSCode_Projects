public class DemoSoqlSample {
    
    public DemoSoqlSample(){
        
        
        
    }
    
    public void DemoSoqlMethod(){
        
       list<account> accLst = [select id,name,Student_Account__r.name from account where Student_Account__r.course__r.name = 'SFDC' AND
                                                                                         Student_Account__r.branch__r.name = 'Los Angeles'];
       list<contact> conLst = [select id,name,Custom_Account__r.name,Custom_Dept__r.name from contact where Custom_Account__r.name = 'HP Inc' AND
                                                                                                       Custom_Dept__r.name = 'FI&CO'];
        account acc = new account();
        acc.name = accLst[0].Student_Account__r.name;
        account acc1 = new account();
        acc1.name= conLst[0].Custom_Dept__r.name;
        
        system.debug('ACcount List------'+accLst);
        system.debug('Student name------'+acc.name);
        system.debug('Contact List------'+conLst);    
        system.debug('Account name------'+acc1.name);
        
        list<Department__c> depLst = new list<Department__c>();
        depLst = [select id,name,Custom_Employee__r.name,Account__r.name from Department__c where name = 'IT'];
        account cacc = new account();
        cacc.name = depLst[0].Account__r.name;
        employee__c emp = new employee__c();
        emp.name = depLst[0].Custom_Employee__r.name;
        system.debug('cust account--------' +cacc.name);
        system.debug('employee-----------' +emp.name);
    }
    
    public void DemoSoqlMethod1(){
        
    }
    
    public void DemoAggregateMethod(){
    /*    list<aggregateResult> result = [select account.name exp0, count(id) exp1,max(amount) exp2,min(amount) exp3,sum(amount) exp4,
                                                            avg(amount) exp5 from opportunity group by account.name];
        aggregateResult agr1 = result[0];
        aggregateResult agr2 = result[1];
        system.debug('aggregate list result----'+result);
        system.debug('aggregate ag1----'+agr1);
        system.debug('aggregate agr2----'+agr2);
        system.debug('aggregate agr2----'+agr2.get('exp0'));
        system.debug('aggregate agr2----'+agr2.get('exp1'));
        system.debug('aggregate agr2----'+agr2.get('exp2'));
        system.debug('aggregate agr2----'+agr1.get('exp5'));
        system.debug('aggregate agr2----'+agr1.get('exp3')); */
        
        list<aggregateResult> agrLst = [select department__r.name exp0,count(id) exp1,max(salary__c) exp2,min(salary__c) exp3,
                                                        avg(salary__c) exp4 from Employee__c group by department__r.name];
        aggregateResult agr1 = agrLst[0];
        aggregateResult agr2 = agrLst[1];
        system.debug('aggregate list result----'+agrLst);
        system.debug('aggregate ag1----'+agr1);
        system.debug('aggregate agr2----'+agr2);
        system.debug('aggregate agr2----'+agr2.get('exp0'));
        system.debug('aggregate agr2----'+agr2.get('exp1'));
        system.debug('aggregate agr2----'+agr2.get('exp2'));
        system.debug('aggregate agr2----'+agr1.get('exp4'));
        system.debug('aggregate agr2----'+agr1.get('exp3'));
        
    }
}