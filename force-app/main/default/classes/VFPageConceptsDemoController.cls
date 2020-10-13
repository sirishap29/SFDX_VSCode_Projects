public class VFPageConceptsDemoController{


       public void VFPageConceptsDemoController(){
           
        }
        
       public PageReference navigateToAccountView1(){
       
          pagereference ref = new pagereference('/a0G3t00000HFTmP');
           return ref;
       
       }

       public PageReference navigateToAccountView2(){
       
         return page.RegistrationDisplayVF;
       }
       
       public PageReference navigateToAccountView3(){
       
         string accId = '0013t00001XL3ho';
         pagereference ref = page.AccountView;
         ref.getParameters().put('id',accId);
         ref.getparameters().put('aName','Vijaya Lakshmi');
         ref.setRedirect(true);
         return ref;
         }  
         
        public void displayMessage(){
        //Apexpages.severity.FATAL
        //Apexpages.severity.ERROR
        //Apexpages.severity.WARNING
        //Apexpages.severity.INFO
        //Apexpages.severity.CONFIRM
        
        Apexpages.message message1 = new Apexpages.message(Apexpages.severity.ERROR,'Please verify your data before proceeding.');
        Apexpages.message message2 = new Apexpages.message(Apexpages.severity.WARNING,'Please verify your data before proceeding.');
        Apexpages.message message3 = new Apexpages.message(Apexpages.severity.INFO,'Please verify your data before proceeding.');
        Apexpages.message message4 = new Apexpages.message(Apexpages.severity.CONFIRM,'Please verify your data before proceeding.');
        ApexPages.addMessage(message1);
  
        }   

        @RemoteAction
        public static string remoteActionCall(string name1,string name2){
        
        return name1+'~'+name2;
        }


}