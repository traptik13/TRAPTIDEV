@isTest
public class OPACTriggerTest {

    @isTest
    public static void testFirstOPACRecord(){

        String productName = 'Test Product ' + System.currentTimeMillis();

        Product2 product = new Product2(
            Name = productName,
            IsActive = true
        );
        insert product;

        OPAC__c opac = new OPAC__c(
            Product__c = product.Id,
            Min__c = 1,
            Max__c = 5,
            Price__c = 10
        );

        Test.startTest();
        insert opac;
        Test.stopTest();

        OPAC__c result = [Select Id, Product__c, Min__c, Max__c, Price__c From OPAC__c Where Id = :opac.Id];

        System.assertEquals(product.Id, result.Product__c);
        System.assertEquals(1, result.Min__c);
        System.assertEquals(5, result.Max__c);
        System.assertEquals(10, result.Price__c);
    }


    @isTest
    public static void testNextMinValue(){

        String productName = 'Test Product ' + System.currentTimeMillis();

        Product2 product = new Product2(
            Name = productName,
            IsActive = true
        );
        insert product;

        OPAC__c opac1 = new OPAC__c(
            Product__c = product.Id,
            Min__c = 1,
            Max__c = 5,
            Price__c = 10
        );
        insert opac1;

        OPAC__c opac2 = new OPAC__c(
            Product__c = product.Id,
            Min__c = 6,
            Max__c = 9,
            Price__c = 15
        );

        Test.startTest();
        insert opac2;
        Test.stopTest();

        OPAC__c result = [Select Id, Min__c, Max__c From OPAC__c Where Id = :opac2.Id];

        System.assertEquals(6, result.Min__c);
        System.assertEquals(9, result.Max__c);
    }


    @isTest
    public static void testInvalidMinValue(){

        String productName = 'Test Product ' + System.currentTimeMillis();

        Product2 product = new Product2(
            Name = productName,
            IsActive = true
        );
        insert product;

        OPAC__c opac1 = new OPAC__c(
            Product__c = product.Id,
            Min__c = 1,
            Max__c = 5,
            Price__c = 10
        );
        insert opac1;

        OPAC__c opac2 = new OPAC__c(
            Product__c = product.Id,
            Min__c = 10,
            Max__c = 20,
            Price__c = 20
        );

        Test.startTest();

        try {
            insert opac2;
            System.assert(false);
        }
        catch(DmlException e) {
            System.assert(e.getMessage().contains('Min value must be 6'));
        }

        Test.stopTest();
    }
}