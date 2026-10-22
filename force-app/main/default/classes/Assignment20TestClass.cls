@isTest
public class Assignment20TestClass{
    @isTest
    static void testAssignment20WithNullValues(){
        Position__c pos=new Position__c();

        Test.startTest();
        insert pos;
        Test.stopTest();

        Position__c result=[SELECT Id,Open_Date__c,Min_Pay__c,Max_Pay__c FROM Position__c WHERE Id=:pos.Id];

        System.assertEquals(System.today(),result.Open_Date__c);
        System.assertEquals(10000,result.Min_Pay__c);
        System.assertEquals(15000,result.Max_Pay__c);
    }

    @isTest
    static void testAssignment20WithValues(){
        Position__c pos=new Position__c(
            Open_Date__c=System.today()-10,
            Min_Pay__c=12000,
            Max_Pay__c=18000
        );

        Test.startTest();
        insert pos;
        Test.stopTest();

        Position__c result=[SELECT Id,Open_Date__c,Min_Pay__c,Max_Pay__c FROM Position__c WHERE Id=:pos.Id];

        System.assertEquals(System.today()-10,result.Open_Date__c);
        System.assertEquals(12000,result.Min_Pay__c);
        System.assertEquals(18000,result.Max_Pay__c);
    }
}