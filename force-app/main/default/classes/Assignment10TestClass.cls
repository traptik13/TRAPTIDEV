@isTest
public class Assignment10TestClass{
    @isTest
    static void testAssignment10(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Contact con=new Contact(LastName='Test Contact',AccountId=acc.Id);
        insert con;

        Contact_Relationship__c conRel=new Contact_Relationship__c(
            Name='Test Relationship',
            Contact__c=con.Id
        );
        insert conRel;

        Test.startTest();
        delete con;
        Test.stopTest();

        List<Contact_Relationship__c> result=[SELECT Id,Contact__c FROM Contact_Relationship__c WHERE Id=:conRel.Id];

        System.assertEquals(0,result.size());
    }
}