trigger CustomerTriggerTrigger on CustomerTrigger__c (before insert, before update, before delete, 
                                                      after insert, after update, after delete, after undelete) {

         if(Trigger.isBefore && Trigger.isInsert){   
         CustomerTriggerTriggerHandler.beforeInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
         if(Trigger.isBefore && Trigger.isUpdate){   
         CustomerTriggerTriggerHandler.beforeUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
         if(Trigger.isBefore && Trigger.isDelete){   
         CustomerTriggerTriggerHandler.beforeDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
         if(Trigger.isafter && Trigger.isInsert){   
         CustomerTriggerTriggerHandler.afterInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
         if(Trigger.isafter && Trigger.isUpdate){   
         CustomerTriggerTriggerHandler.afterUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
         if(Trigger.isafter && Trigger.isDelete){   
         CustomerTriggerTriggerHandler.afterDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
         if(Trigger.isafter && Trigger.isUndelete){   
         CustomerTriggerTriggerHandler.afterUndelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
                                                          
}