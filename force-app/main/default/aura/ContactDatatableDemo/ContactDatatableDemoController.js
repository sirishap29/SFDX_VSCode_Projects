({
	doInit : function(component, event, helper) {
		var columns = [
            {label:'Contact Id', fieldName:'Id', type:'text'},
            {label:'Contact Name', fieldName:'Name', type:'text'},
            {label:'Contact Email', fieldName:'Email', type:'email'}
        ];
        component.set("v.headersList",columns);
        
        
        var aMethod = component.get("c.getContacts");
        
        aMethod.setCallback(this,function(retVal){
            var currentState = retVal.getState(); //SUCCESS or ERROR
            if(currentState == 'SUCCESS'){
                var conList = retVal.getReturnValue();
                component.set("v.conList",conList);
                console.log(component.get("v.conList"));
                var conTempList = [];
                for(var i=0;i<5;i++){
                    conTempList.push(conList[i]);     
                }
                component.set("v.conListTemp",conTempList);
                component.set("v.pageNumber",1);
                console.log(conTempList);
            }
            else{
                alert('Error');
            }
        });

		$A.enqueueAction(aMethod);  
	},
    
    onChangeClicked : function(component, event, helper) {
        var selectedSize = component.get("v.pSize");
         var conList = component.get("v.conList");
        var conTempList = [];
        
        for(var i=0;i<selectedSize;i++){  
            if(i<conList.length){
            conTempList.push(conList[i]);  
            }
        }
        component.set("v.conListTemp",conTempList);
        component.set("v.pSize",selectedSize);
       
    },
    
    FirstClicked : function(component, event, helper) {
       var conList = component.get("v.conList");
        var pNumber = component.get("v.pageNumber");
        var pSize = component.get("v.pageSize");
        var conTempList = [];
        pNumber =  1;    
        var len =   conList.length;  
        for(var i=0;i<pSize;i++){   
            conTempList.push(conList[i]);     
        }
          
        component.set("v.conListTemp",conTempList);
        component.set("v.pageNumber",pNumber);
        console.log(conTempList);
        console.log(component.get("v.pageNumber"));
    },
    
    PreviousClicked : function(component, event, helper) {
       var conList = component.get("v.conList");
        var pNumber = component.get("v.pageNumber");
        var pSize = component.get("v.pageSize");
        var conTempList = [];
        if(pNumber == 0){   
        var offset =   conList.length-5;  
        var limitVal =offset - 5;
        for(var i=limitVal;i<offset;i++){         
            conTempList.push(conList[i]);       
        }
        }
        else
        {
        pNumber =  pNumber-1; 
        var firstVal = pNumber*pSize-1;
        var limitVal =pNumber*pSize - 5;
        var len =   conList.length;  
        for(var i=limitVal;i<=firstVal;i++){
            if(i>=0){
            conTempList.push(conList[i]);
            }
            
        }
        }
          
        component.set("v.conListTemp",conTempList);
        component.set("v.pageNumber",pNumber);
        console.log(conTempList);
        console.log(component.get("v.pageNumber"));
    },
    
    onRowSelected : function(component, event, helper) {
        console.log(event);
    },
    
    NextClicked: function(component, event, helper) {
       
		var conList = component.get("v.conList");
        var pNumber = component.get("v.pageNumber");
        var pSize = component.get("v.pageSize");
        var conTempList = [];
        var firstVal = pNumber*pSize;
        var limitVal =pNumber*pSize + 5;
        var len =   conList.length;  
        for(var i=firstVal;i<limitVal;i++){
            if(i<len){
            conTempList.push(conList[i]);
            }
            component.set("v.length",i);
        }
        pNumber =  pNumber+1;   
        component.set("v.conListTemp",conTempList);
        component.set("v.pageNumber",pNumber);
        console.log(conTempList);
        console.log(component.get("v.pageNumber"));
        
    },
    
    LastClicked : function(component, event, helper) {
       var conList = component.get("v.conList");
        var conTempList = [];     
        var offset =   conList.length-1;  
        var limitVal =offset - 4;
        for(var i=limitVal;i<=offset;i++){         
            conTempList.push(conList[i]);       
        }
          
        component.set("v.conListTemp",conTempList);
        component.set("v.pageNumber",0);
        console.log(conTempList);
        console.log(component.get("v.pageNumber"));
    },
    
    

})