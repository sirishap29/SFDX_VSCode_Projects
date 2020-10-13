({
	doInitHelper : function(component, event, helper) {
        var aMethod = component.get("c.getAllPatients");
        aMethod.setCallback(this,function(response){
            var currentState = response.getState();
            if(currentState == 'SUCCESS'){
                var patList = response.getReturnValue();
                component.set("v.patientList",patList);
            }
            else
            {
               alert('error'); 
            }
        });
        $A.enqueueAction(aMethod);
    },
    
     onButtonClickedHelper:function(component, event, helper){
    
        var aMethod = component.get("c.getAllAppointments");
        aMethod.setParams({
            'patId':component.get("v.patient")
        });
         
         aMethod.setCallback(this,function(response){
             var currentState=response.getState();
             if(currentState == 'SUCCESS'){
                 var apptList = response.getReturnValue();
                 component.set("v.appList",apptList);
             }
             else
             {
                 alert('Error');
             }
         });
         $A.enqueueAction(aMethod);
	}
})