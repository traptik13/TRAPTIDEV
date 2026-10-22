public with sharing class ContactExp {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList() {

        List<Contact> conList = [
            SELECT Id, Name, Title, Phone, Email
            FROM Contact
            LIMIT 10
        ];

        return conList;
    }
}