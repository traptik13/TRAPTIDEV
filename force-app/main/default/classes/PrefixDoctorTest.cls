//Assignment 3 -----

@isTest
public class PrefixDoctorTest {
    @testSetup
    static void setupData() {
        // Create test Lead record once for the entire class
        Lead l = new Lead(
            LastName = 'Anil',
            Company  = 'Wipro',
            Status   = 'Open - Not Contacted'
        );
        Test.startTest();
        insert l;
        // Use Test.startTest()/stopTest() to preserve governor limits per test :contentReference[oaicite:1]{index=1}
        
        Test.stopTest();
    }

    @isTest
    static void testLeadExistsAndHasCorrectPrefix() {
        // Retrieve the Lead inserted in setup
        Lead l = [SELECT Id, LastName, Company, Status FROM Lead WHERE LastName = 'Anil' LIMIT 1];
        System.assertEquals('Anil', l.LastName);
        System.assertEquals('Wipro', l.Company);
        System.assertEquals('Open - Not Contacted', l.Status);

        // Example assertion for your actual PrefixDoctor logic:
        // e.g., String prefix = PrefixDoctor.getPrefix(l);
        // System.assertEquals('Dr.', prefix);
    }
    
    @isTest
    static void testModifyLeadAndValidate() {
        // Again retrieve fresh copy
        Lead l = [SELECT Id, Status FROM Lead WHERE LastName = 'Anil' LIMIT 1];
        // Perform changes or invoke your class under test
        l.Status = 'Contacted';
        update l;
        
        // Re-query and assert changes
        Lead updated = [SELECT Status FROM Lead WHERE Id = :l.Id];
        System.assertEquals('Contacted', updated.Status);
    }
}