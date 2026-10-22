@isTest
public class Assignment36TestClass{

    @testSetup
    static void setupData(){

        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;

        Contact primaryCon = new Contact(
            FirstName = 'Primary',
            LastName = 'Contact',
            AccountId = acc.Id,
            Email = 'primary@test.com',
            Phone = '1111111111',
            Primary_Contact__c = true
        );

        Contact con = new Contact(
            FirstName = 'Other',
            LastName = 'Contact',
            AccountId = acc.Id,
            Email = 'other@test.com',
            Phone = '2222222222',
            Primary_Contact__c = false
        );

        insert new List<Contact>{primaryCon,con};
    }

    @isTest
    static void assignment36AfterUpdateTestClass(){

        Contact primaryCon = [SELECT Id,AccountId,Email,Phone,Primary_Contact__c FROM Contact WHERE LastName = 'Contact' AND Primary_Contact__c = true LIMIT 1];

        Test.startTest();

        primaryCon.Email = 'updated@test.com';
        primaryCon.Phone = '9999999999';
        update primaryCon;

        Test.stopTest();

        Contact result = [SELECT Id,AccountId,Email,Phone,Primary_Contact__c FROM Contact WHERE AccountId = :primaryCon.AccountId AND Primary_Contact__c = false LIMIT 1];

        System.assertEquals('updated@test.com',result.Email);
        System.assertEquals('9999999999',result.Phone);
    }
}