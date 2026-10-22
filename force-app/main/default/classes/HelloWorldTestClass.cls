//Assignment2 ---

@isTest
private class HelloWorldTestClass {

    @testSetup
    static void setupData() {
        // Insert the Account record once for all test methods
        Account a = new Account(Name = 'T1 Account');
        insert a;
    }

    @isTest
    static void validateHelloWorld() {
        // Retrieve the account inserted in @testSetup
        Account a = [SELECT hello__c FROM Account WHERE Name = 'T1 Account' LIMIT 1];

        // Validate that the HelloWorld logic populated the 'hello__c' field correctly
        System.assertEquals('World', a.hello__c);
    }
}