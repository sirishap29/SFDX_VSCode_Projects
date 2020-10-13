({
	callChild1MethodClicked : function(component, event, helper) {
		var appEvnt=$A.get("e.c:ApplicationEventDemo");
        appEvnt.setParams({
            'parentType':'Child2' 
        });
        appEvnt.fire();
	}
})