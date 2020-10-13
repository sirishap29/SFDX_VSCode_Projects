({
	doInitHelper : function(component,event,helper) {
		var aMethod = component.get("c.getPatPhyHospInfo");
       
        aMethod.setCallback(this,function(retVal){
            alert('enter');
            var currentState = retVal.getState(); //SUCCESS or ERROR
            alert('hi');
            if(currentState == 'SUCCESS'){
                alert('success');
                var result = retVal.getReturnValue();
                result.sobjectType ='Appoitment__c';
                
               var patList=result.patient;
                var phyList=result.physician;
                var hosList=result.acc;
               
               component.set("v.patList",patList);
               
                component.set("v.phyList",phyList);
                component.set("v.hosList",hosList);
                console.log(component.get("v.patList"));
                console.log(component.get("v.phyList"));
                console.log(component.get("v.hosList"));
            }
            else{
                alert('Error');
            }
        });

		$A.enqueueAction(aMethod);  
	}
})