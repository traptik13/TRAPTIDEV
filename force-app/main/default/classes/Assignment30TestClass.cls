@isTest
public class Assignment30TestClass{
    @isTest
    static void testAssignment31AfterInsert(){
        StudentT__c student=new StudentT__c(Name='Test Student');
        insert student;

        Training__c training=new Training__c(
            Name='Test Training',
            Fees__c=10000
        );
        insert training;

        EnrollmentT__c en=new EnrollmentT__c(
            Student_Name__c=student.Id,
            Training_Name__c=training.Id
        );

        Test.startTest();
        insert en;
        Test.stopTest();

        StudentT__c result=[SELECT Id,Total_Fees__c FROM StudentT__c WHERE Id=:student.Id];

        System.assertEquals(10000,result.Total_Fees__c);
    }

    @isTest
    static void testAssignment31AfterUpdate(){
        StudentT__c student=new StudentT__c(Name='Test Student');
        insert student;

        Training__c training=new Training__c(
            Name='Test Training',
            Fees__c=10000
        );
        insert training;

        EnrollmentT__c en=new EnrollmentT__c(
            Student_Name__c=student.Id,
            Training_Name__c=training.Id
        );
        insert en;

        Test.startTest();
        en.Training_Name__c=training.Id;
        update en;
        Test.stopTest();

        StudentT__c result=[SELECT Id,Total_Fees__c FROM StudentT__c WHERE Id=:student.Id];

        System.assertEquals(10000,result.Total_Fees__c);
    }

    @isTest
static void testAssignment31AfterDelete(){
    StudentT__c student=new StudentT__c(Name='Test Student');
    insert student;

    Training__c training=new Training__c(
        Name='Test Training',
        Fees__c=10000
    );
    insert training;

    EnrollmentT__c en=new EnrollmentT__c(
        Student_Name__c=student.Id,
        Training_Name__c=training.Id
    );
    insert en;

    Test.startTest();
    delete en;
    Test.stopTest();

    StudentT__c result=[SELECT Id,Total_Fees__c FROM StudentT__c WHERE Id=:student.Id];

    System.assertEquals(10000,result.Total_Fees__c);
}

    @isTest
    static void testAssignment31AfterUndelete(){
        StudentT__c student=new StudentT__c(Name='Test Student');
        insert student;

        Training__c training=new Training__c(
            Name='Test Training',
            Fees__c=10000
        );
        insert training;

        EnrollmentT__c en=new EnrollmentT__c(
            Student_Name__c=student.Id,
            Training_Name__c=training.Id
        );
        insert en;

        delete en;

        Test.startTest();
        undelete en;
        Test.stopTest();

        StudentT__c result=[SELECT Id,Total_Fees__c FROM StudentT__c WHERE Id=:student.Id];

        System.assertEquals(10000,result.Total_Fees__c);
    }
}