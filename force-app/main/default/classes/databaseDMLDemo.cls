Public Class databaseDMLDemo{

public void databaseMethod(){
Account acc = new Account();
    Account acc1 = new Account();
acc.Name = 'neelu Hospitals';
acc.AccountNumber = '3452234';
acc.Rating = 'Cold';

List<Account> accLst = new List<Account>();
    accLst.add(acc);
acc1.Name = '';
acc1.AccountNumber = 'fdgjhhjk';
acc1.type = 'other';
  
    accLst.add(acc1);
List<Database.SaveResult> lstResult = Database.insert(accLst,false);
    integer i=0;
    for(Database.SaveResult res:lstResult){     
        if(res.isSuccess()){
            system.debug('Success----' +res.getId());
            system.debug('Success----' +accLst[i].Name);
        }
     else{
            system.debug('Error----' +res.getErrors()[0].getMessage());              
                         } 
        i++;
                         }
}
}