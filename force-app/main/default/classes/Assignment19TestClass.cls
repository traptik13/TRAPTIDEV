@isTest
public class Assignment19TestClass{
    @isTest
    static void testAssignment19(){
        Account acc=new Account(
            Name='Test Account',
            CopyBillingToShipping__c=true,
            BillingCountry='India',
            BillingStreet='MG Road',
            BillingCity='Agra',
            BillingState='Uttar Pradesh',
            BillingPostalCode='282001'
        );

        Test.startTest();
        insert acc;
        Test.stopTest();

        Account insertedAccount=[SELECT Id,BillingCountry,ShippingCountry,BillingStreet,ShippingStreet,
                                BillingCity,ShippingCity,BillingState,ShippingState,BillingPostalCode,ShippingPostalCode 
                                 FROM Account WHERE Id=:acc.Id];

        System.assertEquals(insertedAccount.BillingCountry,insertedAccount.ShippingCountry);
        System.assertEquals(insertedAccount.BillingStreet,insertedAccount.ShippingStreet);
        System.assertEquals(insertedAccount.BillingCity,insertedAccount.ShippingCity);
        System.assertEquals(insertedAccount.BillingState,insertedAccount.ShippingState);
        System.assertEquals(insertedAccount.BillingPostalCode,insertedAccount.ShippingPostalCode);

    }
}