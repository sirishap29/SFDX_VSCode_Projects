public class AccountViewExtensionController {

    public Account acc;
    public boolean isEdit{get;set;}
    public boolean isView{get;set;}
    public AccountViewExtensionController(ApexPages.StandardController ctrl) {
        
        acc = (Account)ctrl.getRecord();
        isEdit = false;
        isView = true;
    }
// add comments fgfg add
    public void editClicked(){
        isEdit = true;
        isView = false;
        
    }

}