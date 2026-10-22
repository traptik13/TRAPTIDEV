@isTest
public class assignment26TestClass{
    @isTest
    static void testAssignment26AfterInsert(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Contact con=new Contact(LastName='Test Contact',AccountId=acc.Id);

        Test.startTest();
        insert con;
        Test.stopTest();

        Account result=[SELECT Id,Description FROM Account WHERE Id=:acc.Id];

        System.assert(result.Description.contains(con.LastName));
    }

    @isTest
    static void testAssignment26AfterUpdate(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Contact con=new Contact(LastName='Test Contact',AccountId=acc.Id);
        insert con;

        Test.startTest();
        con.LastName='Updated Contact';
        update con;
        Test.stopTest();

        Account result=[SELECT Id,Description FROM Account WHERE Id=:acc.Id];

        System.assert(result.Description.contains('Updated Contact'));
    }
}