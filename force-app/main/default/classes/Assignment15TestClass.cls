@isTest
public class Assignment15TestClass{
    @isTest
    static void testAssignment15(){
        Contact con=new Contact(LastName='Test Contact');

        Test.startTest();
        insert con;
        Test.stopTest();

        Contact result=[SELECT Id,LastName,AccountId,Account.Name FROM Contact WHERE Id=:con.Id];

        System.assertNotEquals(null,result.AccountId);
        System.assertEquals('Test Contact',result.Account.Name);
    }
}