//Assignment 5 -----

@isTest
public class ContactsCreationTest {

    @testSetup
    static void setupData() {
        // Insert Account record which should trigger contact creation logic
        Account a = new Account();
        a.Name = 'Test Account';
        a.Phone = '9052757414';
        a.Rating = 'Hot';
        a.Number_of_Locations__c = 4;
        insert a;
    }

    @isTest
    static void CreateContacts() {
        // Retrieve the Account inserted in @testSetup
        Account a = [SELECT Id, Number_of_Locations__c FROM Account WHERE Name = 'Test Account' LIMIT 1];

        // Fetch related contacts
        List<Contact> lc = [SELECT Id FROM Contact WHERE AccountId = :a.Id];

        // Assert that number of contacts matches Number_of_Locations__c field
        System.assertEquals(a.Number_of_Locations__c, lc.size(), 'Contact count does not match Number_of_Locations__c');
    }
}