public class FirstVFpageDemoController {
    
     public Account acc {get;set;}
    public string Name {get;set;}
    public string OutputVal{get;set;}
    public string selectedState{get;set;}
    public string selectedRating{get;set;}
    public string selectedType{get;set;}
    public List<SelectOption> ratinglist{get;set;}
    public List<SelectOption> typelist{get;set;}
    public List<SelectOption> stateList{get;set;}
    
    public FirstVFpageDemoController(){
      
        	
        
        List<SelectOption> options= new List<SelectOption>();
        options.add(new SelectOption('Telangana','TS'));
        options.add(new SelectOption('Andhrapradesh','AP'));
        options.add(new SelectOption('Uttarpradesh','UP'));
        options.add(new SelectOption('Madhyapradesh','MP'));
        stateList = options;
        
        ratingList = new List<selectOption>();
        schema.SobjectType sobj = schema.getglobaldescribe().get('Account');
        
        Map<string,schema.sobjectField> fieldMap =  sobj.getDescribe().fields.getMap();
        
        Schema.DescribeFieldResult ratingField = fieldMap.get('Rating').getDescribe();
         
         
        List<schema.picklistEntry> ratingPicklistValues = ratingField.getPicklistValues();
        
        
        for(schema.picklistEntry pickVal: ratingPicklistValues ){
            selectOption so = new selectOption(pickVal.getLabel(),pickVal.getValue());
            
            ratinglist.add(so);
        } 
        typelist = new List<selectOption>();
        
        Schema.DescribeFieldResult typeField = Account.Type.getDescribe();
           
        List<schema.picklistEntry> typePicklistValues = typeField.getPicklistValues();
        
        
        for(schema.picklistEntry pickVal: typePicklistValues ){
            selectOption so = new selectOption(pickVal.getLabel(),pickVal.getValue());
            
            typelist.add(so);
        } 
        
       
    }
    
    public void submitClicked(){
         OutputVal = 'Sirisha';
    }

}