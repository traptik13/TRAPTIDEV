@isTest
public class OpportunityLItemTriggerTest {

    @isTest
    public static void testOpportunityLineItemPrice(){

        Product2 product = new Product2(
            Name = 'Test Product',
            IsActive = true
        );
        insert product;

        OPAC__c opac = new OPAC__c(
            Product__c = product.Id,
            Min__c = 1,
            Max__c = 5,
            Price__c = 10
        );
        insert opac;

        Pricebook2 pricebook = new Pricebook2(
            Name = 'Test Pricebook',
            IsActive = true
        );
        insert pricebook;

        PricebookEntry standardEntry = new PricebookEntry(
            Pricebook2Id = Test.getStandardPricebookId(),
            Product2Id = product.Id,
            UnitPrice = 10,
            IsActive = true
        );
        insert standardEntry;

        PricebookEntry pricebookEntry = new PricebookEntry(
            Pricebook2Id = pricebook.Id,
            Product2Id = product.Id,
            UnitPrice = 10,
            IsActive = true
        );
        insert pricebookEntry;

        Opportunity opp = new Opportunity(
            Name = 'Test Opportunity',
            StageName = 'Prospecting',
            CloseDate = Date.today(),
            Pricebook2Id = pricebook.Id
        );
        insert opp;

        OpportunityLineItem oppItem = new OpportunityLineItem(
            OpportunityId = opp.Id,
            PricebookEntryId = pricebookEntry.Id,
            Quantity = 4,
            UnitPrice = 10
        );

        Test.startTest();
        insert oppItem;
        Test.stopTest();

        OpportunityLineItem result = [
            SELECT Id, Quantity, UnitPrice, TotalPrice
            FROM OpportunityLineItem
            WHERE Id = :oppItem.Id
        ];

        System.assertEquals(4, result.Quantity);
        System.assertEquals(10, result.UnitPrice);
        System.assertEquals(40, result.TotalPrice);
    }
}