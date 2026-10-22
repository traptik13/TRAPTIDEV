@isTest
public class UpdateIndustryBatchTest {

    // Common test data setup
    @testSetup
    static void setupTestData() {
        List<Account> testAccounts = new List<Account>();
        for (Integer i = 0; i < 10; i++) {
            testAccounts.add(new Account(Name = 'Test Account ' + i));
        }
        insert testAccounts;
    }

    @isTest
    static void testBatchExecution() {
        // Run the batch
        Test.startTest();
        UpdateIndustryBatch batch = new UpdateIndustryBatch();
        Database.executeBatch(batch, 10); // Scope size = 10
        Test.stopTest();

        // Verify updates
        List<Account> updatedAccounts = [SELECT Industry FROM Account WHERE Industry = 'Technology'];
        System.assertEquals(10, updatedAccounts.size(), 'All accounts should have Industry set to Technology');
    }
}