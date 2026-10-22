public class HelloWorldUsingSchedule implements Schedulable {

    public void execute(SchedulableContext ctx) {

        List<Account> accounts = [
            SELECT Id, Name, Hello__c
            FROM Account
        ];

        HelloWorldService.addHelloWorld(accounts);

        update accounts;
    }
}