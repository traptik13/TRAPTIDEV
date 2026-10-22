@isTest
public class Assignment23TestClass{
    @isTest
    static void testAssignment23WithAnotherOpportunity(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Opportunity opp1=new Opportunity(
            Name='Opportunity 1',
            AccountId=acc.Id,
            Amount=50000,
            StageName='Prospecting',
            CloseDate=System.today()+30
        );

        Opportunity opp2=new Opportunity(
            Name='Opportunity 2',
            AccountId=acc.Id,
            Amount=75000,
            StageName='Prospecting',
            CloseDate=System.today()+30
        );

        insert new List<Opportunity>{opp1,opp2};

        Task t=new Task(
            WhatId=opp1.Id,
            Subject='Test Task',
            Status='Not Started',
            Priority='Normal'
        );
        insert t;

        Test.startTest();
        delete opp1;
        Test.stopTest();

        List<Task> taskList=[SELECT Id,WhatId FROM Task WHERE Id=:t.Id];

        System.assertEquals(1,taskList.size(),'Task should still exist');
        System.assertEquals(opp2.Id,taskList[0].WhatId);
    }
}