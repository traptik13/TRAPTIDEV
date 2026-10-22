@isTest
public class Assignment13TestClass{
    @isTest
    static void testAssignment13BeforeInsert(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Contact con1=new Contact(LastName='Primary Contact',AccountId=acc.Id,Primary_Contact__c=true);
        insert con1;

        Contact con2=new Contact(LastName='Second Contact',AccountId=acc.Id,Primary_Contact__c=true);

        Test.startTest();
        try{
            insert con2;
            System.assert(false,'Second primary contact should not be allowed');
        }catch(DmlException e){
            System.assert(e.getMessage().contains('only one primary contact allowed'));
        }
        Test.stopTest();
    }

    @isTest
    static void testAssignment13BeforeUpdate(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Contact con1=new Contact(LastName='Primary Contact',AccountId=acc.Id,Primary_Contact__c=true);
        insert con1;

        Contact con2=new Contact(LastName='Second Contact',AccountId=acc.Id,Primary_Contact__c=false);
        insert con2;

        con2.Primary_Contact__c=true;

        Test.startTest();
        try{
            update con2;
            System.assert(false,'Second primary contact should not be allowed');
        }catch(DmlException e){
            System.assert(e.getMessage().contains('only one primary contact allowed'));
        }
        Test.stopTest();
    }
}