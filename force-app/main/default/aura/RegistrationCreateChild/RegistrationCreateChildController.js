({
	cancelRegClicked : function(component, event, helper) {
		component.set("v.isShow1",false);
	},
    submitRegistrationClicked : function(component, event, helper) {
		var paramValues=event.getParam('arguments');
        alert(paramValues.RegName);
        alert(paramValues.RegId);
        
        alert('Child Method From Parent');
        
	}
})