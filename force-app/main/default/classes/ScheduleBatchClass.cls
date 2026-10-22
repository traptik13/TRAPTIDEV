public class ScheduleBatchClass {

    public static void reminderOwner(List<Opportunity> oppsList) {

        for (Opportunity opp : oppsList) {
            System.debug(
                'Reminder for Opportunity: ' + opp.Name +
                ', Owner Id: ' + opp.OwnerId +
                ', Close Date: ' + opp.CloseDate
            );
        }
    }
}