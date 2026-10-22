@isTest
public class assignment22TestClass{
    @isTest
    static void testAssignment22(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Opportunity opp=new Opportunity(
            Name='Test Opportunity',
            AccountId=acc.Id,
            Amount=75000,
            StageName='Prospecting',
            CloseDate=System.today()+30
        );

        Test.startTest();
        insert opp;
        Test.stopTest();

        Account result=[SELECT Id,Recent_Opportunity_Amount__c FROM Account WHERE Id=:acc.Id];

        System.assertEquals(75000,result.Recent_Opportunity_Amount__c);
    }
}