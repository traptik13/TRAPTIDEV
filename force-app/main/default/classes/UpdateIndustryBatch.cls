public class UpdateIndustryBatch implements Database.Batchable<SObject> {

    // Start method: Defines the query for the records to process
    public Database.QueryLocator start(Database.BatchableContext BC) {
        return Database.getQueryLocator(
            'SELECT Id, Name, Industry FROM Account WHERE Industry = NULL'
        );
    }

    // Execute method: Processes each batch of records
    public void execute(Database.BatchableContext BC, List<SObject> scope) {
        List<Account> accListToUpdate = new List<Account>();

        for (SObject s : scope) {
            Account acc = (Account)s;
            acc.Industry = 'Technology';
            accListToUpdate.add(acc);
        }

        if (!accListToUpdate.isEmpty()) {
            update accListToUpdate;
        }
    }

    // Finish method: Runs after all batches are processed
    public void finish(Database.BatchableContext BC) {
        System.debug('Finished updating industries on accounts.');
    }
}