public with sharing class WireContactController {

    @AuraEnabled(cacheable=true)
    public static List<Contact> getContacts() {

        return [
            SELECT Id, FirstName, LastName, Email, Phone
            FROM Contact order by CreatedDate DESC
            LIMIT 10
        ];
    }
}