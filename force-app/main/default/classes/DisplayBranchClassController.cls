public class DisplayBranchClassController {
    
    @AuraEnabled
    public static List<HBranch__c> getBranchRecords(){
        List<HBranch__c> brList = [Select id,Name,Hospital__c,format(type__c),No_of_Beds__c,Custom_Account__c,
                                                      Hospital__r.Name,Custom_Account__r.Name from HBranch__c];
        return brList;

    }
    
    @AuraEnabled
    public static List<string> getPicklistValuesIntoList(){
        List<string> pickListValuesList = new List<string>();
        Schema.DescribeFieldResult fieldResult = HBranch__c.type__c.getDescribe();
        List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
        for(Schema.PicklistEntry pv:ple){
           pickListValuesList.add(pv.getLabel()); 
        }
        return pickListValuesList;
    }
    
    @AuraEnabled
    public static WrapperHospital getHospitalInfo(string accId){
        Account acc = [select id,name,(select id,name from Hospitals__r) from Account where id = :accId];
        set<ID> Ids = new set<ID>();
        for(Hospital__c h:acc.Hospitals__r){
            id hid = h.id;
            Ids.add(hid);
        }
        
        List<HBranch__c> brList = [Select id,Name,Hospital__c,type__c,No_of_Beds__c,Custom_Account__c,
                                                      Hospital__r.Name,Custom_Account__r.Name from HBranch__c
                                                        where Hospital__c IN :Ids]; 
        WrapperHospital hospWrapper = new WrapperHospital();
        hospWrapper.Hospital = acc;
        hospWrapper.brList   = brList;
        return hospWrapper;    
    }
    
    public class WrapperHospital{
    @AuraEnabled
    public Account Hospital;
    @AuraEnabled
    public List<HBranch__c> brList;
}

}