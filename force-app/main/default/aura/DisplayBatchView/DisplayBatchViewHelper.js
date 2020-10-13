({
	doInithelper:function(component,event,helper)
    {
		var aMethod = component.get("c.getBranchRecords");
        alert("hi");
        aMethod.setCallback(this,function(retVal){
            var currentstate = retVal.getState();
            alert("hi1");
        if(currentstate == 'SUCCESS'){
          var branchList = retVal.getReturnValue();
              var types =[];
              var ids = [];
            
            for(var i=0;i<branchList.length;i++){
              
                types.push(branchList[i].type__c);
                ids.push(i);
               console.log(component.get("v.types"));
            }
            alert("hi2");
          component.set("v.branchList",branchList);
          component.set("v.types",types);
            console.log(component.get("v.branchList"));
            console.log(component.get("v.types"));
        }
        else
        {
            alert("Error");
        }
        });
    $A.enqueueAction(aMethod);
	},
 accessButtonClickedHelper:function(component,event,helper){
     var aMethod = component.get("c.getHospitalInfo");
     alert(component.get("v.recordId"));
     aMethod.setParams({
         'accId':component.get("v.recordId")
     });
     aMethod.setCallback(this,function(retVal){
         var currentState = retVal.getState();
         if(currentState == 'SUCCESS'){
             var result = retVal.getReturnValue();
             var hospital = result.Hospital;
             var branchList = result.brList;
             component.set("v.branchList1",branchList);
             console.log(component.get("v.branchList1"));
         }
         else{
             alert('Error');
             console.log(error);
         }
     });
     $A.enqueueAction(aMethod);
 }
})