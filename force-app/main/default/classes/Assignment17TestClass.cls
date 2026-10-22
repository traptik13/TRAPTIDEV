@isTest
public class Assignment17TestClass{
    @isTest
    static void testAssignment17BeforeInsert(){
        Contact con=new Contact(
            LastName='Existing Contact',
            Email='test@example.com'
        );
        insert con;

        Lead l=new Lead(
            LastName='Test Lead',
            Company='Test Company',
            Email='test@example.com'
        );

        Test.startTest();
        try{
            insert l;
            System.assert(false,'Lead should not be inserted because email already exists in Contact');
        }catch(DmlException e){
            System.assert(e.getMessage().contains('email is already existed in contacts'));
        }
        Test.stopTest();
    }

    @isTest
    static void testAssignment17BeforeUpdate(){
        Contact con=new Contact(
            LastName='Existing Contact',
            Email='test@example.com'
        );
        insert con;

        Lead l=new Lead(
            LastName='Test Lead',
            Company='Test Company',
            Email='new@example.com'
        );
        insert l;

        l.Email='test@example.com';

        Test.startTest();
        try{
            update l;
            System.assert(false,'Lead should not be updated because email already exists in Contact');
        }catch(DmlException e){
            System.assert(e.getMessage().contains('email is already existed in contacts'));
        }
        Test.stopTest();
    }
}