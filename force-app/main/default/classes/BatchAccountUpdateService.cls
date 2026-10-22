global class BatchAccountUpdateService implements Database.Batchable<sObject> {

    global Database.QueryLocator start(Database.BatchableContext bc) {

        return Database.getQueryLocator(
            'SELECT Id, Name FROM Account'
        );
    }

    global void execute(
        Database.BatchableContext bc,
        List<Account> scope
    ) {

        for (Account acc : scope) {
            acc.Name = acc.Name + ' Update';
        }

        update scope;
    }

    global void finish(Database.BatchableContext bc) {

        System.debug('Account update batch completed.');
    }
}