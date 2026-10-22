trigger OPACTrigger on OPAC__c (before insert, before update) {

    if(Trigger.isBefore && Trigger.isInsert){
        OpacTriggerHandler.beforeInsert(Trigger.new, Trigger.newMap, Trigger.old, Trigger.oldMap);
    }

    if(Trigger.isBefore && Trigger.isUpdate){
        OpacTriggerHandler.beforeUpdate(Trigger.new, Trigger.newMap, Trigger.old, Trigger.oldMap);
    }
}