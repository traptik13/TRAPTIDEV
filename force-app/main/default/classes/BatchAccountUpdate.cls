global class BatchAccountUpdate implements Database.Batchable<SObject> {

    // Start Method
    global Database.QueryLocator start(Database.BatchableContext bc) {
        
        String query = 'SELECT Id, Name FROM Account';
        
        return Database.getQueryLocator(query);
    }

    // Execute Method
    global void execute(Database.BatchableContext bc, List<Account> scope) {
        
        for (Account acc : scope) {
            acc.Name = acc.Name + ' Update';
        }
        
        update scope;
    }

    // Finish Method
    global void finish(Database.BatchableContext bc) {
        
        System.debug('Batch Account Update completed successfully.');
    }
}