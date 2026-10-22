@isTest
public class Assignment4TestClass{
    @isTest
    static void testAccountCannotBeDeleted(){
        Account acc=new Account(Name='Test Account');
        insert acc;

        Test.startTest();
        try{
            delete acc;
            System.assert(false,'Account should not be deleted');
        }catch(DmlException e){
            System.assert(e.getMessage().contains('You cannot delete the account'));
        }
        Test.stopTest();

        Account remainingAccount=[SELECT Id,Name FROM Account WHERE Id=:acc.Id];
        System.assertEquals('Test Account',remainingAccount.Name);
    }
}