@isTest
public class Assignment14TestClass{
    @isTest
    static void testAssignment14(){
        Account acc=new Account(Name='Test Account',Is_Opp_Eligible_for_Close__c=true);
        insert acc;

        Opportunity opp=new Opportunity(
            Name='Test Opportunity',
            AccountId=acc.Id,
            StageName='Prospecting',
            CloseDate=Date.today().addDays(10),
            Probability=80
        );
        insert opp;

        System.assertEquals('Prospecting',opp.StageName);

        Test.startTest();
        acc.Name='Updated Account';
        update acc;
        Test.stopTest();

        Opportunity result=[SELECT Id,StageName,Probability FROM Opportunity WHERE Id=:opp.Id];
        System.assertEquals('Closed Won',result.StageName);
    }
}