@isTest
public class Assignment31TestClass {

    @testSetup
    static void setupData() {

        StudentT__c st = new StudentT__c(
            Name = 'Test Student'
        );
        insert st;

        Training__c tr = new Training__c(
            Name = 'Test Training',
            Fees__c = 1000
        );
        insert tr;

        EnrollmentT__c en = new EnrollmentT__c(
            Student_Name__c = st.Id,
            Training_Name__c = tr.Id
        );
        insert en;
    }

    @isTest
    static void assignment31AfterInsertTestClass() {

        StudentT__c st = [SELECT Id,Total_Fees__c FROM StudentT__c WHERE Name = 'Test Student' LIMIT 1];
        Training__c tr = [SELECT Id,Fees__c FROM Training__c WHERE Name = 'Test Training' LIMIT 1];

        Test.startTest();

        EnrollmentT__c en = new EnrollmentT__c(
            Student_Name__c = st.Id,
            Training_Name__c = tr.Id
        );
        insert en;

        Test.stopTest();

        StudentT__c result = [SELECT Id,Total_Fees__c FROM StudentT__c WHERE Id = :st.Id];

        System.assertEquals(2000,result.Total_Fees__c);
    }

    @isTest
    static void assignment31AfterUpdateTestClass() {

        StudentT__c st = [SELECT Id,Total_Fees__c FROM StudentT__c WHERE Name = 'Test Student' LIMIT 1];
        EnrollmentT__c en = [SELECT Id,Student_Name__c,Training_Name__c FROM EnrollmentT__c WHERE Student_Name__c = :st.Id LIMIT 1];

        Test.startTest();

        update en;

        Test.stopTest();

        StudentT__c result = [SELECT Id,Total_Fees__c FROM StudentT__c WHERE Id = :st.Id];

        System.assertEquals(1000,result.Total_Fees__c);
    }
}