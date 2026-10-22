@isTest
public class Assignment5TestClass{
    @isTest
    static void testAssignment5AfterInsert(){
        Account acc=new Account(
            Name='Test Account',
            Number_of_Locations__c=3
        );

        Test.startTest();
        insert acc;
        Test.stopTest();

        List<Contact> contacts=[SELECT Id,LastName,AccountId FROM Contact WHERE AccountId=:acc.Id];

        System.assertEquals(3,contacts.size());

        Set<String> contactNames=new Set<String>();
        for(Contact con:contacts){
            contactNames.add(con.LastName);
            System.assertEquals(acc.Id,con.AccountId);
        }

        System.assert(contactNames.contains('Location1'));
        System.assert(contactNames.contains('Location2'));
        System.assert(contactNames.contains('Location3'));
    }

    @isTest
    static void testAssignment5AfterUpdate(){
        Account acc=new Account(
            Name='Test Account',
            Number_of_Locations__c=2
        );
        insert acc;

        List<Contact> contactsBefore=[SELECT Id FROM Contact WHERE AccountId=:acc.Id];
        System.assertEquals(2,contactsBefore.size());

        acc.Number_of_Locations__c=4;

        Test.startTest();
        update acc;
        Test.stopTest();

        List<Contact> contactsAfter=[SELECT Id,LastName,AccountId FROM Contact WHERE AccountId=:acc.Id];

        System.assertEquals(6,contactsAfter.size());

        Set<String> contactNames=new Set<String>();
        for(Contact con:contactsAfter){
            contactNames.add(con.LastName);
        }

        System.assert(contactNames.contains('Location1'));
        System.assert(contactNames.contains('Location2'));
        System.assert(contactNames.contains('Location3'));
        System.assert(contactNames.contains('Location4'));
    }
}