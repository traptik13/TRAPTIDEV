@isTest
public class Assignment12TestClass{
    @isTest
    static void testAssignment12(){
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

        Account result=[SELECT Id,Description FROM Account WHERE Id=:acc.Id];

        System.assertNotEquals(null,result.Description,'Account Description was not updated');
        System.assert(result.Description.contains(c.CaseNumber));
        System.assert(result.Description.contains('New'));

        List<Task> tasks=[SELECT Id,WhatId,Subject,Status,Priority,OwnerId FROM Task WHERE WhatId=:acc.Id AND Subject=:c.CaseNumber];

        System.assertEquals(1,tasks.size(),'Expected one Task to be created');

        Task task=tasks[0];

        System.assertEquals(acc.Id,task.WhatId);
        System.assertEquals(c.CaseNumber,task.Subject);
        System.assertEquals('New',task.Status);
        System.assertEquals('Normal',task.Priority);
        System.assertEquals(c.OwnerId,task.OwnerId);
    }
}