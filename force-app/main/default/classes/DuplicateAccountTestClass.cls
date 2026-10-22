//Assignment 1 -----
 
 @isTest
public class DuplicateAccountTestClass {

    @testSetup
    static void setupData() {
        // Insert the first account – this will be used by all test methods
        Account a1 = new Account(Name = 'Test Account');
        insert a1;
    }

    @isTest
    static void testAccountDuplicateTrigger() {
        // Try to insert a duplicate account (same name)
        Account a2 = new Account(Name = 'Test Account');
        String expectedError = 'You Cannot Create the Duplicate Account';

        try {
            insert a2;
            // If no exception is thrown, fail the test
            System.assert(false, 'Expected an exception for duplicate account, but none occurred.');
        } catch (Exception e) {
            // Make sure the exception was thrown, meaning the trigger worked
            System.debug('We want to see this. This means the trigger is working.');
            System.assert(e.getMessage().contains(expectedError), 'Error message did not match expected.');
        }
    }
}