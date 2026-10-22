@isTest
public class assignment7TestClass{
    @isTest
    static void testAssignment7(){
        User u=[SELECT Id,Name FROM User WHERE Id=:UserInfo.getUserId()];

        Account acc=new Account(Name='Test Account',OwnerId=u.Id);
        insert acc;

        acc.Name='Updated Account';

        Test.startTest();
        update acc;
        Test.stopTest();

        Account result=[SELECT Id,Name,Sales_Rep__c FROM Account WHERE Id=:acc.Id];

        System.assertEquals('Updated Account',result.Name);
        System.assertEquals(u.Name,result.Sales_Rep__c);
    }
}