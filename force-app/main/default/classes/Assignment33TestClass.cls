@isTest
public class Assignment33TestClass {

    @testSetup
    static void setupData() {

        Product2 prod = new Product2(
            Name = 'Test Product',
            IsActive = true
        );
        insert prod;

        Product_Pricing__c pp = new Product_Pricing__c(
            Product2Id__c = prod.Id,
            Price__c = 100
        );
        insert pp;

        Account acc = new Account(
            Name = 'Test Account'
        );
        insert acc;

        Id standardPricebookId = Test.getStandardPricebookId();

        PricebookEntry pbe = new PricebookEntry(
            Pricebook2Id = standardPricebookId,
            Product2Id = prod.Id,
            UnitPrice = 100,
            IsActive = true
        );
        insert pbe;

        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            AccountId = acc.Id,
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Pricebook2Id = standardPricebookId
        );
        insert opp;
    }

    @isTest
    static void assignment33UpdateTestClass() {

        // Run as a System Administrator so FLS on OpportunityLineItem
        // fields (UnitPrice, Quantity, PricebookEntryId, etc.) doesn't
        // block the DML for whatever user actually executes the test.
        User adminUser = [
            SELECT Id
            FROM User
            WHERE Profile.Name = 'System Administrator'
            AND IsActive = true
            LIMIT 1
        ];

        System.runAs(adminUser) {

            Product2 prod = [
                SELECT Id
                FROM Product2
                WHERE Name = 'Test Product'
                LIMIT 1
            ];

            Opportunity opp = [
                SELECT Id
                FROM Opportunity
                WHERE Name = 'Test Opportunity'
                LIMIT 1
            ];

            PricebookEntry pbe = [
                SELECT Id, Product2Id
                FROM PricebookEntry
                WHERE Product2Id = :prod.Id
                LIMIT 1
            ];

            OpportunityLineItem oli = new OpportunityLineItem(
                OpportunityId = opp.Id,
                PricebookEntryId = pbe.Id,
                Quantity = 2
            );

            insert oli;

            oli = [
                SELECT Id, Product2Id, PricebookEntryId, Quantity, UnitPrice
                FROM OpportunityLineItem
                WHERE Id = :oli.Id
            ];

            oli.Quantity = 5;

            Test.startTest();
            update oli;
            Test.stopTest();

            OpportunityLineItem result = [
                SELECT Id, Product2Id, Quantity, UnitPrice
                FROM OpportunityLineItem
                WHERE Id = :oli.Id
            ];

            System.assertEquals(500, result.UnitPrice, 'UnitPrice should be Quantity * Product_Pricing__c.Price__c');
        }
    }
}