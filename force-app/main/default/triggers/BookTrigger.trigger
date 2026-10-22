trigger BookTrigger on Book__c (before insert, before update, before delete, 
                                after insert, after update, after delete, after undelete) {
       if(trigger.isBefore && trigger.isInsert){
            BookTriggerHandler.beforeInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
       }
       if(trigger.isBefore && trigger.isUpdate){
            BookTriggerHandler.beforeUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
       }
       if(trigger.isBefore && trigger.isDelete){
            BookTriggerHandler.beforeDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
       }
       if(trigger.isAfter && trigger.isInsert){
            BookTriggerHandler.afterInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
       }
       if(trigger.isAfter && trigger.isUpdate){
            BookTriggerHandler.afterUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
       }
       if(trigger.isAfter && trigger.isDelete){
            BookTriggerHandler.afterDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
       }
       if(trigger.isAfter && trigger.isUndelete){
            BookTriggerHandler.afterUndelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
       }
}