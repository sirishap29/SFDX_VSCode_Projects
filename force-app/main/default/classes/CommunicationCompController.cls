public class CommunicationCompController {

    @AuraEnabled
    public static List<Hbranch__c> getDetailsInfo(){
        List<Hbranch__c> branchList = [select id,name from Hbranch__c];
        return branchList;
    }
}