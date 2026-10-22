public class OpacTriggerHandler {

    public static void beforeInsert(List<OPAC__c> triggerNew, Map<Id,OPAC__c> triggerNewMap, 
                                    List<OPAC__c> triggerOld, Map<Id,OPAC__c> triggerOldMap){
        OpacTriggerHelper.lwcassignmentMinMax(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
    }

    public static void beforeUpdate(List<OPAC__c> triggerNew, Map<Id,OPAC__c> triggerNewMap, 
                                    List<OPAC__c> triggerOld, Map<Id,OPAC__c> triggerOldMap){
        OpacTriggerHelper.lwcassignmentMinMax(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
    }
}