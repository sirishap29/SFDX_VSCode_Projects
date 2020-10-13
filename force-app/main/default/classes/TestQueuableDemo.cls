public class TestQueuableDemo implements Queueable{

    public void execute(QueueableContext qCntx){
        system.debug('Queueable Class Execute Method');
    }
    
//system.enqueueJob(new TestQueuableDemo());    
}