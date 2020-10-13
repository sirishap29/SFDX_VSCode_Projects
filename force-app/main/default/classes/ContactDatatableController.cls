public class ContactDatatableController {

    @AuraEnabled
    public static List<Contact> getContacts(){
        List<Contact> conList = [select id,name,Email from Contact];
        return conList;
    }
}