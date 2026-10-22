global class ScheduleClass implements Schedulable {

    global void execute(SchedulableContext sc) {

        List<Opportunity> oppsList = [
            SELECT Id, Name, OwnerId, CloseDate
            FROM Opportunity
            WHERE IsClosed = false
            AND CloseDate < TODAY
        ];

        ScheduleBatchClass.reminderOwner(oppsList);
    }
}