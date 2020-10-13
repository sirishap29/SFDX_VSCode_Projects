public class UpdateUserinActive implements Database.Batchable<Sobject>,Database.stateful {

    
    public Database.QueryLocator start(Database.BatchableContext bc){
        
        string query = 'select id,name,isActive,Last_Login_Date__c from user  where Last_Login_Date__c < last_n_days:5';
        Return Database.getQueryLocator(query);
    }
    
    public void execute(Database.BatchableContext bc,List<User> uList){
        system.debug('#####################################################' +uList);
        system.debug('#####################################################' +uList.size());
        List<user> updUsers = new List<user>();
        if(uList!= NULL){
            for(user u:uList){
                user ur = u;
                ur.id = u.id;
                ur.isActive = false;
                updUsers.add(ur);
            }
            system.debug('#####################################################' +updUsers);
            system.debug('#####################################################' +updUsers.size());
            update updUsers;
        }
    }
    
    public void finish(Database.BatchableContext bc){
        
    }
}