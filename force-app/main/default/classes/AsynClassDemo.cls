public class AsynClassDemo {
    
    public AsynClassDemo(){
        takeShower();
        carService(324);
        watchMovie();
    }

    public static void takeShower(){
        system.debug('taking Shower');
    }
    
    @Future
    public static void carService(integer accNumber){
        system.debug('car Servcing');
        system.debug('accNumber display'+accNumber);
    }
    
    public static void watchMovie(){
        system.debug('Watching Movie');
    }
}