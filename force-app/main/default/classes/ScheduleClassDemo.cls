public class ScheduleClassDemo implements Schedulable {
    
    public ScheduleClassDemo(){
        
    }
 
    public void execute(SchedulableContext sc){
        
        PatientCreateBatch Batch = new PatientCreateBatch();
        Database.executeBatch(Batch);
    }
}