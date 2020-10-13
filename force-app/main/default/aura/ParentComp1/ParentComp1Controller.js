({
	createApptClicked : function(component, event, helper) 
    {
        
		component.set("v.isShow",true);	 
	},
    initMethodOnLoad : function(component, event, helper)
    {
        alert('hi1');
		helper.doInitHelper(component, event,helper);
	},
     onChangePatient : function(component, event, helper) 
    { 
        component.set("v.app.Patient__c",component.get("v.Patient"));
        console.log(component.get("v.app.Patient__c"));  
        alert('hi');
	},
     onChangePhysician : function(component, event, helper) 
    { 
         component.set("v.app.Physician__c",component.get("v.Physician"));
        console.log(component.get("v.app.Physician__c")); 
        alert('hiii');
	},
    onChangeHospital : function(component, event, helper) 
    { 
        component.set("v.app.Hospital__c",component.get("v.Hospital"));
        console.log(component.get("v.app.Hospital__c")); 
         alert('hreerere');
	},
      AppoitmentSubmit : function(component,event,helper)
    {
        component.set("v.isShow2",true);	 
       alert('2');
       console.log(component.get("v.app.Name"));
        console.log(component.get("v.app.Patient__c"));
        console.log(component.get("v.app.Physician__c"));
         console.log(component.get("v.app.Hospital__c"));
        
      
        var bMethod=component.get("c.createAppoitment");
     
        bMethod.setParams(
            {
            'appt':component.get("v.app.Name"),
            'patId':component.get("v.app.Patient__c"),
            'physId':component.get("v.app.Physician__c"),
            'hospId':component.get("v.app.Hospital__c") 
            });
         bMethod.setCallback(this,function(response){
            var state = response.getState();
            if(state === "SUCCESS"){
                alert('Record is Created Successfully');
                alert('3'); 
                var childRef=component.find("displayAppointments");
                console.log(component.get("v.Patient"));
        childRef.displayAppointments(component.get("v.Patient")); 
            } 
            else if (state === "INCOMPLETE") {
                console.error("INCOMPLETE");
            }
            else if (state === "ERROR") {
                var errors = response.getError();
                if (errors) {
                    if (errors[0] && errors[0].message) {
                        console.error("Error message: " + 
                                 errors[0].message);
                    }
                } else {
                    console.error("Unknown error");
                }
            }
        });       
        $A.enqueueAction(bMethod);
    }
})