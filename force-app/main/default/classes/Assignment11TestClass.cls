@isTest
public class Assignment11TestClass{
    @isTest
    static void testAssignment11(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        List<Case> cases=new List<Case>();
        for(Integer i=0;i<6;i++){
            cases.add(new Case(
                AccountId=acc.Id,
                Subject='Test Case '+i,
                Status='Closed',
                Origin='Phone'
            ));
        }
        insert cases;

        Test.startTest();

        Case newCase=new Case(
            AccountId=acc.Id,
            Subject='New Case',
            Status='Closed',
            Origin='Phone'
        );
        insert newCase;

        newCase.Subject='Updated Case';
        update newCase;

        delete newCase;

        undelete newCase;

        Test.stopTest();

        Account result=[SELECT Id,Rating FROM Account WHERE Id=:acc.Id];

        System.assertEquals('Hot',result.Rating);
    }
}