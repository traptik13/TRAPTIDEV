@isTest
public class Assignment25TestClass{
    @isTest
    static void testAssignment25ExistingContact(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Contact con=new Contact(LastName='Existing Contact',Email='test@example.com',AccountId=acc.Id);
        insert con;

        Case cs=new Case(
            AccountId=acc.Id,
            Subject='Test Case',
            Status='New',
            Origin='Phone',
            SuppliedEmail='test@example.com'
        );

        Test.startTest();
        insert cs;
        Test.stopTest();

        Case result=[SELECT Id,ContactId,SuppliedEmail FROM Case WHERE Id=:cs.Id];

        System.assertEquals(con.Id,result.ContactId);
        System.assertEquals('test@example.com',result.SuppliedEmail);
    }

    @isTest
    static void testAssignment25NewContact(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Case cs=new Case(
            AccountId=acc.Id,
            Subject='Test Case',
            Status='New',
            Origin='Phone',
            SuppliedEmail='new@example.com'
        );

        Test.startTest();
        insert cs;
        Test.stopTest();

        Case result=[SELECT Id,ContactId,SuppliedEmail FROM Case WHERE Id=:cs.Id];

        Contact con=[SELECT Id,LastName,Email FROM Contact WHERE Id=:result.ContactId];

        System.assertNotEquals(null,result.ContactId);
        System.assertEquals('case Contact',con.LastName);
        System.assertEquals('new@example.com',con.Email);
    }
}