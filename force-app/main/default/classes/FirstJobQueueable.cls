public class FirstJobQueueable implements Queueable{

    public void execute(QueueableContext qCntxt){
        system.debug('FirstJobQueueable execute method');
        
    }
    
}