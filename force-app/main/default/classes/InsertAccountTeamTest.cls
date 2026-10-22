@isTest
public class InsertAccountTeamTest {

    private static User createTestUser() {
        Profile p = [SELECT Id FROM Profile WHERE Name = 'System Administrator' LIMIT 1];
        User u = new User(
            LastName = 'Test User',
            Alias = 'ta',
            Email = 'testuser@test.com',
            Username = 'testuseraccount@test.com.users',
            CommunityNickname = 'TestCN',
            TimeZoneSidKey = 'America/Los_Angeles',
            LocaleSidKey = 'en_US',
            EmailEncodingKey = 'ISO-8859-1',
            LanguageLocaleKey = 'en_US',
            ProfileId = p.Id
        );
        insert u;
        return u;
    }

    @isTest
    static void AccountManagerInsertIntoAccountTeam() {
        // Step 1: Create test user (outside runAs)
        User u = createTestUser();

        // Step 2: Use runAs to simulate actions of that user
        System.runAs(u) {
            // Insert Account
            Account a = new Account(Name = 'Test Account');
            insert a;

            // Insert CustomerTrigger__c linked to Account and User 
           CustomerTrigger__c c = new CustomerTrigger__c(
                Name = 'Test',
                Account__c = a.Id,
                Account_Manager__c = u.Id
            );
            insert c;

            // Verify AccountTeamMember was created
            AccountTeamMember atm = [
                SELECT UserId FROM AccountTeamMember WHERE AccountId = :a.Id LIMIT 1
            ];
            System.assertEquals(u.Id, atm.UserId, 'AccountTeamMember was not created with correct User');
        }
    }
}