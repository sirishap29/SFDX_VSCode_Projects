({
	doInitHelper : function(component, event, helper) {
        var aMethod = component.get("c.getDetailsInfo");
        aMethod.setCallback(this,function(response){
            var currentstate = response.getState();
            if(currentstate == 'SUCCESS'){
               var result = response.getReturnValue(); 
                var patientList = result.patList;
                var physicianList = result.phyList;
                var hospitalList = result.hospList;
                
                component.set("v.patList",patientList);
                component.set("v.phyList",physicianList);
                component.set("v.hospList",hospitalList);
                console.log(component.get("v.patList"));
                console.log(component.get("v.phyList"));
                console.log(component.get("v.hospList"));

            }
            else
            {
                alert('Error');
            }
        });       
        
		$A.enqueueAction(aMethod);
	},
    
    createButtonAptHelper:function(component, event, helper){
    
        var aMethod = component.get("c.createAppointment");
        aMethod.setParams({
            'appt':component.get("v.appmtName"),
            'patId':component.get("v.patientId"),
            'physId':component.get("v.physicianId"),
            'hospId':component.get("v.hospitalId") 
        });
        aMethod.setCallback(this,function(response){
            var currentstate = response.getState();
            if(currentstate == 'SUCCESS'){
               var result = response.getReturnValue(); 
               alert('Created Successfully',result);
            }
            else
            {
                alert('Error');
            }
             });       
        
		$A.enqueueAction(aMethod); 
            
       console.log(component.get("v.appmtName"));
       console.log(component.get("v.patientId"));
       console.log(component.get("v.physicianId"));
       console.log(component.get("v.hospitalId"));

}
})