({
	doInit : function(component, event, helper) {
		helper.doInitHelper(component, event, helper);   
	},
    
    onPatientChange : function(component, event, helper) {
		console.log(component.find("patId").get("v.value"));
        component.set("v.patient",component.find("patId").get("v.value"));
        helper.onButtonClickedHelper(component, event, helper);
        
	},
    
    onButtonClicked : function(component, event, helper) {
	//	helper.onButtonClickedHelper(component, event, helper);
    },
})