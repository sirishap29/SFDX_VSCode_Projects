({
	getAppointments : function(component, event, helper) {
        alert('child1');
        var paramvalues = event.getParam('arguments');;
        var action=component.get("c.getAllAppointments");
        action.setParams({
            'patId':paramvalues.patientId
        });
        console.log(paramvalues.patientId);
        action.setCallback(this,function(retVal){
            var currentstate=retVal.getState();
            if(currentstate == 'SUCCESS'){
                var apptList = retVal.getReturnValue();
                component.set("v.appList",apptList);
                component.set("v.isShow",false);
                console.log(component.get("v.appList"));
          //      console.log(component.get("v.isShow"));
            }
            else{
                alert('error');
            }
        });
        $A.enqueueAction(action);
	},
    
    
})