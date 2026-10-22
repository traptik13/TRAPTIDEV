public class BatchOpportunityRecordCount
    implements Database.Batchable<SObject>, Database.Stateful {

    public Integer recordCount = 0;

    public Database.QueryLocator start(Database.BatchableContext bc) {

        return Database.getQueryLocator(
            'SELECT Id, Name, LeadSource FROM Opportunity'
        );
    }

    public void execute(
        Database.BatchableContext bc,
        List<SObject> scope
    ) {

        for (SObject record : scope) {

            Opportunity opp = (Opportunity) record;

            if (opp.LeadSource == 'Web') {
                recordCount++;
            }
        }
    }

    public void finish(Database.BatchableContext bc) {

        System.debug('Record Count = ' + recordCount);
    }
}