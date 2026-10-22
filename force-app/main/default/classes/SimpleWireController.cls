public with sharing class SimpleWireController {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {

        return [
            SELECT Id, FirstName, LastName, Email, Phone
            FROM Contact
            LIMIT 10
        ];
    }
}