@isTest
public class Assignment27TestClass{
    @isTest
    static void testAssignment27AfterInsert(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Opportunity opp=new Opportunity(
            Name='Test Opportunity',
            AccountId=acc.Id,
            Amount=20000,
            StageName='Prospecting',
            CloseDate=System.today()+30
        );

        Test.startTest();
        insert opp;
        Test.stopTest();

        System.assertEquals(20000,opp.Amount);
    }

    @isTest
    static void testAssignment27AfterUpdate(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Opportunity opp=new Opportunity(
            Name='Test Opportunity',
            AccountId=acc.Id,
            Amount=5000,
            StageName='Prospecting',
            CloseDate=System.today()+30
        );
        insert opp;

        opp.Amount=20000;

        Test.startTest();
        update opp;
        Test.stopTest();

        System.assertEquals(20000,opp.Amount);
    }
}