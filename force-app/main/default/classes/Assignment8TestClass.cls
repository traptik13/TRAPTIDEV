@isTest
public class Assignment8TestClass{
    @isTest
    static void testAssignment8(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Contact con=new Contact(
            LastName='Test Contact',
            AccountId=acc.Id,
            Create_Contact_Relationship__c=true
        );

        Test.startTest();
        insert con;
        Test.stopTest();

        Contact_Relationship__c conRel=[SELECT Id,Name,Contact__c FROM Contact_Relationship__c 
                                        WHERE Contact__c=:con.Id];

        System.assertEquals(con.Id,conRel.Contact__c);
        System.assertEquals(con.LastName,conRel.Name);
    }
}