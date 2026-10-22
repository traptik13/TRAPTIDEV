@isTest
public class Assignment29TestClass{
    @isTest
    static void testAssignment29(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Contact con=new Contact(LastName='Test Contact',AccountId=acc.Id);

        Test.startTest();
        insert con;
        Test.stopTest();

        Account result=[SELECT Id,Description FROM Account WHERE Id=:acc.Id];
        System.assertEquals('0',result.Description);

        Opportunity opp=[SELECT Id,Name,AccountId,StageName,Amount,CloseDate FROM Opportunity WHERE AccountId=:acc.Id];

        System.assertEquals('New Opportunity',opp.Name);
        System.assertEquals(acc.Id,opp.AccountId);
        System.assertEquals('Prospecting',opp.StageName);
        System.assertEquals(100,opp.Amount);
        System.assertEquals(System.today()+90,opp.CloseDate);
    }
}