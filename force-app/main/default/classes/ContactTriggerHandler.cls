public class ContactTriggerHandler {
    
    
    public void onBeforeInsert(List<Contact> conList){
   
           Map<ID,Account> accCnt = new Map<ID,Account>([select id,Contact_Count__c from Account]);
           List<AggregateResult> conCnt = [select AccountID aID,count(ID) cnt from contact group by AccountID ];    
                                                                                                                                                     
           for(Contact con:conList){
           for(Account acc:accCnt.Values()){
                   if(acc.ID == con.accountID){
                   system.debug('################' +acc.ID);
                   system.debug('################' +con.accountID);
               for(AggregateResult agg:conCnt){
                   if(agg.get('aID') == acc.ID){
                   if((Integer)agg.get('cnt') >= acc.Contact_Count__c){
                   system.debug('################' +agg.get('cnt'));
                   system.debug('################' +acc.Contact_Count__c);
                   con.addError('Each Account associated with contacts should be  ' +acc.Contact_Count__c);
                   }
                     }
                   }
                }
            }
            
        }
    
    }
    

}