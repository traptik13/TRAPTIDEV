public class PositionTriggerHelper {

    public static void assignment20(List<Position__c> triggerNew, Map<Id,Position__c> triggerNewMap, 
                                    List<Position__c> triggerOld, Map<Id,Position__c> triggerOldMap){
    for(Position__c pos : triggerNew){
        if(pos.Open_Date__c == null){
            pos.Open_Date__c = System.today();
        }
        if(pos.Min_Pay__c == null){
            pos.Min_Pay__c = 10000;
        }
        if(pos.Max_Pay__c == null){
            pos.Max_Pay__c = 15000;
        }
    }
}
}