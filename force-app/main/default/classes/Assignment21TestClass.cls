@isTest
public class Assignment21TestClass{
    @isTest
    static void testAssignment21(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Case c=new Case(
            AccountId=acc.Id,
            Subject='Test Case',
            Status='New',
            Origin='Phone'
        );

        Test.startTest();
        insert c;
        Test.stopTest();

        Case insertedCase=[SELECT Id,CaseNumber FROM Case WHERE Id=:c.Id];

        Account result=[SELECT Id,Latest_Case_Number__c FROM Account WHERE Id=:acc.Id];

        System.assertEquals(insertedCase.CaseNumber,result.Latest_Case_Number__c);
    }
}