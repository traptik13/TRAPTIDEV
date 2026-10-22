@isTest
public class Assignment34TestClass {

    @testSetup
    static void setupData() {

        User u1 = new User(
            FirstName = 'Old',
            LastName = 'Owner',
            Alias = 'oldown',
            Email = 'oldowner@test.com',
            Username = 'oldowner' + System.currentTimeMillis() + '@test.com',
            ProfileId = UserInfo.getProfileId(),
            TimeZoneSidKey = 'Asia/Kolkata',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US'
        );
        insert u1;

        User u2 = new User(
            FirstName = 'New',
            LastName = 'Owner',
            Alias = 'newown',
            Email = 'newowner@test.com',
            Username = 'newowner' + System.currentTimeMillis() + '@test.com',
            ProfileId = UserInfo.getProfileId(),
            TimeZoneSidKey = 'Asia/Kolkata',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'UTF-8',
            LanguageLocaleKey = 'en_US'
        );
        insert u2;

        Case c = new Case(
            Subject = 'Test Case',
            Status = 'New',
            Origin = 'Phone',
            OwnerId = u1.Id
        );
        insert c;
    }

    @isTest
    static void assignment34BeforeUpdateTestClass() {

        Case c = [SELECT Id,OwnerId,Current_Owner__c,Prior_Owner__c FROM Case WHERE Subject = 'Test Case' LIMIT 1];

        User newOwner = [SELECT Id,Name FROM User WHERE FirstName = 'New' AND LastName = 'Owner' LIMIT 1];

        c.OwnerId = newOwner.Id;

        Test.startTest();
        update c;
        Test.stopTest();

        Case result = [SELECT Id,OwnerId,Current_Owner__c,Prior_Owner__c FROM Case WHERE Id = :c.Id];

        User oldOwner = [SELECT Id,Name FROM User WHERE FirstName = 'Old' AND LastName = 'Owner' LIMIT 1];

        System.assertEquals(newOwner.Name,result.Current_Owner__c);
        System.assertEquals(oldOwner.Name,result.Prior_Owner__c);
    }
}