@isTest
public class Assignment18TestClass{
    @isTest
    static void testAssignment18HotOpportunity(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Opportunity opp=new Opportunity(
            Name='Hot Opportunity Test',
            AccountId=acc.Id,
            Amount=150000,
            StageName='Prospecting',
            CloseDate=System.today()+30
        );

        Test.startTest();
        insert opp;
        Test.stopTest();

        Opportunity result=[SELECT Id,Amount,Description FROM Opportunity WHERE Id=:opp.Id];

        System.assertEquals(150000,result.Amount);
        System.assertEquals('Hot Opportunity',result.Description);
    }

    @isTest
    static void testAssignment18NormalOpportunity(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Opportunity opp=new Opportunity(
            Name='Normal Opportunity Test',
            AccountId=acc.Id,
            Amount=50000,
            StageName='Prospecting',
            CloseDate=System.today()+30
        );

        Test.startTest();
        insert opp;
        Test.stopTest();

        Opportunity result=[SELECT Id,Amount,Description FROM Opportunity WHERE Id=:opp.Id];

        System.assertEquals(50000,result.Amount);
        System.assertEquals(null,result.Description);
    }
}