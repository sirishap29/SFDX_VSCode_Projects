public class CustoomSettingsDemo {
    
    public void customSettingsHierarchy(){
        org_config_values__c orgconfigValues1 = org_config_values__c.getValues('0053t000007IurW');
        system.debug('Last Days------'+orgconfigValues1.Last_N_Days__c);
        system.debug('Name-------'+orgconfigValues1.Name__c);

        
        org_config_values__c orgconfigValues2 = org_config_values__c.getInstance('0053t000007IurW');
        system.debug('Last Days------'+orgconfigValues2.Last_N_Days__c);
        system.debug('Name-------'+orgconfigValues2.Name__c);
    }
    
    public void customSettingsList(){
        
           Map<string, State_Settings__c> mapStates = State_Settings__c.getAll();
           system.debug('State names---------' +mapStates.get('Andhra Pradesh').Short_State_Name__c);  
        
           List<State_Settings__c> lststate = State_Settings__c.getAll().Values();
           system.debug('lst state--------' +lststate);
        
           State_Settings__c state = State_Settings__c.getInstance('Telangana');           
           system.debug('state--------' +state);
    }
    
    public string customMetadata(string branchCode){
        
        List<Branch_Code__mdt> lstBranchCodes = [Select id,DeveloperName,Manager__c From Branch_Code__mdt];
        Map<String,String> mapBranch = new Map<String,String>();
        for(Branch_Code__mdt b:lstBranchCodes){
                mapBranch.put(b.DeveloperName,b.Manager__c);
                    }
        return mapBranch.get(branchCode);
    }
    
    public void anonymousWindow(){
        custoomSettingsDemo cd = new custoomSettingsDemo();
//cd.customSettingsHierarchy();
//cd.customSettingsList();
string str =cd.customMetadata('SBD_003');
system.debug('Manager-----' +str);
    }

}