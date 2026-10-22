trigger StudentTrigger on Studentlwc__c (before insert, before update, before delete, 
                                         after insert, after update, after delete, after undelete) {
  
    if(Trigger.isBefore && Trigger.isInsert){   
         StudentTriggerHandler.beforeInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
                                             
    if(Trigger.isBefore && Trigger.isUpdate){   
         StudentTriggerHandler.beforeUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
                                             
    if(Trigger.isBefore && Trigger.isDelete){   
         StudentTriggerHandler.beforeDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
                                             
    if(Trigger.isafter && Trigger.isInsert){   
         StudentTriggerHandler.afterInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
                                             
    if(Trigger.isafter && Trigger.isUpdate){   
         StudentTriggerHandler.afterUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
                                             
    if(Trigger.isafter && Trigger.isDelete){   
         StudentTriggerHandler.afterDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
                                             
    if(Trigger.isafter && Trigger.isUndelete){   
         StudentTriggerHandler.afterUndelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
}