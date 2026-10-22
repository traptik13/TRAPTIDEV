public class UpdateAccountsQueueable implements Queueable {
    public void execute(QueueableContext context) {
        List<Account> accountsToUpdate = [SELECT Id, Name FROM Account LIMIT 10];
        for(Account acc : accountsToUpdate) {
            acc.Name += ' Updated';
        }
        update accountsToUpdate;
    }
}