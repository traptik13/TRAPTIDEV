public class SchedulableApexAccountUpdate implements Schedulable {

    public void execute(SchedulableContext ctx) {

        BatchAccountUpdateService bau =
            new BatchAccountUpdateService();

        Database.executeBatch(bau);
    }
}