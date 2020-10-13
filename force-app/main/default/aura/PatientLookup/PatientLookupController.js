({
	doInit : function(component, event, helper) {
		helper.doInitHelper(component, event, helper);   
	},
    
     onPatientChange : function(component, event, helper) {
        console.log(component.find("patientId").get("v.value"));
         component.set("v.patientId",component.find("patientId").get("v.value"));
         
        
          
	},
     onPhysicianChange : function(component, event, helper) {
        
        console.log(component.find("physicianId").get("v.value"));
         component.set("v.physicianId",component.find("physicianId").get("v.value"));
     
	},
     onHospitalChange : function(component, event, helper) {
        
        console.log(component.find("hospitalId").get("v.value"));
         component.set("v.hospitalId",component.find("hospitalId").get("v.value"));
      
	},

    createButtonAppointment:function(component, event, helper){
        
      
        helper.createButtonAptHelper(component, event, helper);

    },
    
})