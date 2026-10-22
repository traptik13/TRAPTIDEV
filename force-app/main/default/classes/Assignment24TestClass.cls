@isTest
public class Assignment24TestClass{
    @isTest
    static void testAssignment24(){
        User u=[SELECT Id,Email FROM User WHERE Id=:UserInfo.getUserId()];

        Account acc=new Account(Name='Test Account',OwnerId=u.Id);
        insert acc;

        Case cs=new Case(
            AccountId=acc.Id,
            Subject='Test Case',
            Status='New',
            Origin='Phone'
        );
        insert cs;

        Test.startTest();
        delete cs;
        Test.stopTest();

        Task task=[SELECT Id,WhatId,Status,Subject,Priority,OwnerId FROM Task WHERE WhatId=:acc.Id AND Subject='Case is Deleted' LIMIT 1];

        System.assertEquals(acc.Id,task.WhatId);
        System.assertEquals('Not Started',task.Status);
        System.assertEquals('Case is Deleted',task.Subject);
        System.assertEquals('Normal',task.Priority);
        System.assertEquals(acc.OwnerId,task.OwnerId);
    }
}