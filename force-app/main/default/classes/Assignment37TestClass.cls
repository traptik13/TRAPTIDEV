@isTest
public class Assignment37TestClass{

    @testSetup
    static void setupData(){

        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;
    }

    @isTest
    static void assignment37AfterInsertTestClass(){

        Account acc = [SELECT Id,Amount__c FROM Account WHERE Name = 'Test Account' LIMIT 1];

        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            AccountId = acc.Id,
            StageName = 'Closed Won',
            CloseDate = Date.today(),
            Amount = 1000
        );

        Test.startTest();
        insert opp;
        Test.stopTest();

        Account result = [SELECT Id,Amount__c FROM Account WHERE Id = :acc.Id];

        System.assertEquals(1000,result.Amount__c);
    }

    @isTest
    static void assignment37AfterUpdateTestClass(){

        Account acc = [SELECT Id,Amount__c FROM Account WHERE Name = 'Test Account' LIMIT 1];

        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            AccountId = acc.Id,
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Amount = 1000
        );
        insert opp;

        opp.StageName = 'Closed Won';
        opp.Amount = 2000;

        Test.startTest();
        update opp;
        Test.stopTest();

        Account result = [SELECT Id,Amount__c FROM Account WHERE Id = :acc.Id];

        System.assertEquals(2000,result.Amount__c);
    }

    @isTest
    static void assignment37AfterDeleteTestClass(){

        Account acc = [SELECT Id,Amount__c FROM Account WHERE Name = 'Test Account' LIMIT 1];

        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            AccountId = acc.Id,
            StageName = 'Closed Won',
            CloseDate = Date.today(),
            Amount = 1000
        );
        insert opp;

        Test.startTest();
        delete opp;
        Test.stopTest();

        Account result = [SELECT Id,Amount__c FROM Account WHERE Id = :acc.Id];

        System.assertEquals(500,result.Amount__c);
    }

    @isTest
    static void assignment37AfterUndeleteTestClass(){

        Account acc = [SELECT Id,Amount__c FROM Account WHERE Name = 'Test Account' LIMIT 1];

        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            AccountId = acc.Id,
            StageName = 'Closed Won',
            CloseDate = Date.today(),
            Amount = 1000
        );
        insert opp;

        delete opp;

        Test.startTest();
        undelete opp;
        Test.stopTest();

        Account result = [SELECT Id,Amount__c FROM Account WHERE Id = :acc.Id];

        System.assertEquals(1000,result.Amount__c);
    }
}