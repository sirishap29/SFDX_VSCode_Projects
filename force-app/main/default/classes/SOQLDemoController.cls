public class SOQLDemoController {
    
    public SOQLDemoController(){
        
    }
    
    public List<string> getHospitals(){
        List<string> hospLst = new List<string>();
        List<Appointment__c> appLst = [select Parent_Hospital__r.name from Appointment__c];
        for(appointment__c apt:appLst){
        string str = apt.Parent_Hospital__r.name;
        hospLst.add(str);
        }     
        system.debug('Appointment List-----'+appLst);
        system.debug('Hospital List-----'+hospLst);
        return hospLst;
        
    }
    
    public List<Appointment__c> getAppointments(id physicianId){
        List<Appointment__c> appLst = [select id,name from Appointment__c where Parent_Physician__r.id = :physicianId];
        system.debug('appointment List-------'+appLst);
        return appLst;
        
    }
    
    public List<Patient__c> getPatients(){
        List<registration__c> lstRegIds = [select id from registration__c];
        set<id> setRegIds = new set<id>();
        for(registration__c reg:lstRegIds){
            if(reg.id != null){
            id rid = reg.id;
            setRegIds.add(rid);
            }
        }
        List<Patient__c> patList = [select id,name from Patient__c where parent_Registration__r.id IN :setRegIds];
        system.debug('Patient List-------'+patList);
        system.debug('Patient List-------'+patList.size());
        system.debug('set regIDs-------'+setRegIds);
        return patList;
        
    }
    
    public set<id> GetHospitalFromPatient(){
         list<patient__c> patLst = [select name,(select name,Parent_Hospital__r.id from appointments__r) from patient__c];
         list<appointment__c> appList = new list<appointment__c>();
         set<id> setHospIds = new set<id>();
         appointment__c app;
         id HospId;
        for(patient__c pat:patLst){
            if(pat != null){
               for(appointment__c ap:pat.appointments__r){
                   if(pat != null){
                        app = ap;
                        HospId = app.Parent_Hospital__r.id;
                        appList.add(app);
                        setHospIds.add(HospId);
                   }
                  }
            }
        }
        system.debug('Patient List-------' +patLst);
        system.debug('Patient List-------' +patLst.size());
        system.debug('appointment List-------' +appList);
        system.debug('appointment List-------' +appList.size());
        system.debug('HospIds------' +setHospIds);
        system.debug('HospIds------' +setHospIds.size());
         return setHospIds;
    }
    
    public list<appointment__c> getAppointmentsFrmHospital(id hospId){
        list<appointment__c> applist = new list<appointment__c>();
        list<hospital__c> hospList = [select name,(select name from appointments__r) from hospital__c where id = :hospId];
        appList = hospList[0].appointments__r;
        system.debug('hospList-----'+hospList);
        return applist;
    }
    
    public list<string> getBranches(){
        list<string> branchNames = new list<string>();
        list<hospital__c> hospLst = [select name,(select name from hbranches__r) from hospital__c];
        for(hospital__c hosp:hospLst){
            if(hosp != null){
                for(Hbranch__c hbranch:hosp.hbranches__r){
                    string bName = hosp.Name+' - '+hbranch.name;
                    branchNames.add(bName); 
                }
            }
        }
        
        return branchNames;
    }
    
    public map<Id,integer> getPatientStats(){
        map<Id,integer> mapCount = new map<Id,integer>();
        list<aggregateResult> Result = [select Parent_Patient__r.id exp0,Count(id) exp1 from appointment__c 
                                                                   group by Parent_Patient__r.id];
        system.debug('Result-------' +Result);
        for(aggregateResult agg:Result){
            id pid = (id)agg.get('exp0');
            integer val =(integer)agg.get('exp1');
            mapCount.put(pid,val);
        }
        
        return mapCount;
    }
    
    public void soslMetho(){
        
    }
    
    public void anonymousMethod(){
        /*SOQLDemoController s = new SOQLDemoController();
s.getHospitals()
s.getAppointments('a0I3t00001WYsMV');
s.getPatients();
set<id> HospId = s.GetHospitalFromPatient();
list<appointment__c> appLst = s.getAppointmentsFrmHospital('a0G3t00000HFTmo');
system.debug('appointment List---' +appLst);
list<string> branches =s.getBranches();
system.debug('Branches------'+branches);
map<id,integer> mapcnt = s.getPatientStats();
system.debug('map Count------'+mapcnt); */
    }

}