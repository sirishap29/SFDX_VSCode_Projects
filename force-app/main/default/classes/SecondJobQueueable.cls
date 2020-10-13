public class SecondJobQueueable implements Queueable{

    public void execute(QueueableContext qCntxt){
        system.debug('SecondJobQueueable execute method');
    }
    
}