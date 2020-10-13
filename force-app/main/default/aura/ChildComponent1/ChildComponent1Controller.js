({
	getBranchesBtnClicked : function(component, event, helper) {
		var action = component.get("c.getDetailsInfo");
        action.setCallback(this,function(retVal){
            var cState=retVal.getState();
            if(cState == 'SUCCESS'){
               var brList = retVal.getReturnValue(); 
               var compEvnt = component.getEvent("cmpEvntDemo");
                compEvnt.setParams({
                'Name':'Branch Data',
                'branchList':brList
   //             'parentType':'parent'
            });
               compEvnt.fire(); 
            }
            else
            {
                alert('Error');
            }
        });
        $A.enqueueAction(action);
	},
    appEvntDemoHandler : function(component, event, helper) {
        console.log(event.getParam('parentType'));
    }
})