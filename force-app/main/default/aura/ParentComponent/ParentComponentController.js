({
	EventExecutedMethod : function(component, event, helper) {
        
		var Name= event.getParam("Name");
        var branchList = event.getParam("branchList");
        console.log(Name);
        console.log(branchList);
	}
})