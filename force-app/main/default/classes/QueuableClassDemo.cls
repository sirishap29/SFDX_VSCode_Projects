public class QueuableClassDemo implements Queueable{
    
    List<Patient__c> patLst;    
    public QueuableClassDemo(List<Patient__c> NewInsertList){
        patLst = NewInsertList;
    }
    
    public void execute(QueueableContext qc){
  /*      Account acc = new Account();
        acc.Name = 'Medplus India';
        acc.Phone = '7732084935';
        insert acc; */
        insert patLst;
    }
}