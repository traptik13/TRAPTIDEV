@isTest
public class Assignment28TestClass{
    @isTest
    static void testAssignment28(){
        User u=[SELECT Id,Name FROM User WHERE Id=:UserInfo.getUserId()];

        Account acc=new Account(Name='Test Account',OwnerId=u.Id);
        insert acc;

        Contact con=new Contact(LastName='Test Contact',AccountId=acc.Id);
        insert con;

        Test.startTest();

        con.LastName='Updated Contact';
        update con;

        acc.Name='Updated Account';
        update acc;

        Test.stopTest();

        Account result=[SELECT Id,Name FROM Account WHERE Id=:acc.Id];
        System.assertEquals('Updated Account',result.Name);
    }
}