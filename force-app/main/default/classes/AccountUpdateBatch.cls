public class AccountUpdateBatch implements Database.batchable<Sobject> {
 
     //QueryLocator, iteratable
    
    public string query;
    public integer totalCount = 0;
    public AccountUpdateBatch(){
        //query = 'Select id,name from account';
    }
    
    public AccountUpdateBatch(string strQuery){
        query = strQuery;
    }
    
    public AccountUpdateBatch(set<id> accIdSet){
        query = 'Select id,name from account where id in :accIdSet';
    }
    
    public Database.QueryLocator start(Database.batchableContext bc){
        //string query='Select id,name from account';
        if(string.isBlank(query)){
            query = 'Select id,name from account';
        }
        
        return database.getQueryLocator(query);
        
        //retrun new iterateClassDemo();
    }
    public void Execute(Database.batchableContext bc,List<Account> lstData){
        for(Account acc:lstData){
            String str = acc.Name;
            String str1 = str.replace('', 'Batch');
            acc.Name = str1;
        }
        
        totalCount = totalCount + lstData.size();
        update lstData;    
    }
    public void finish(Database.batchableContext bc){
        system.debug('Total records '+totalCount);
        system.debug(' Context varible '+bc);
    }

}