@isTest
public class Assignment16TestClass{
    @isTest
    static void testAssignment16BeforeInsert(){
        Account acc=new Account(Name='Test Account',Phone='1234567890',Fax='0987654321');
        insert acc;

        Contact con=new Contact(LastName='Test Contact',AccountId=acc.Id);

        Test.startTest();
        insert con;
        Test.stopTest();

        Contact result=[SELECT Id,Phone,Fax FROM Contact WHERE Id=:con.Id];

        System.assertEquals('1234567890',result.Phone);
        System.assertEquals('0987654321',result.Fax);
    }

    @isTest
    static void testAssignment16BeforeUpdate(){
        Account acc=new Account(Name='Test Account',Phone='1111111111',Fax='2222222222');
        insert acc;

        Contact con=new Contact(LastName='Test Contact');
        insert con;

        con.AccountId=acc.Id;

        Test.startTest();
        update con;
        Test.stopTest();

        Contact result=[SELECT Id,Phone,Fax,AccountId FROM Contact WHERE Id=:con.Id];

        System.assertEquals(acc.Id,result.AccountId);
        System.assertEquals('1111111111',result.Phone);
        System.assertEquals('2222222222',result.Fax);
    }
}