trigger CaseTrigger on Case (before insert, before update, before delete, 
                             after insert, after update, after delete, after undelete) {

         if(Trigger.isBefore && Trigger.isInsert){   
         CaseTriggerHandler.beforeInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                 
         if(Trigger.isBefore && Trigger.isUpdate){   
         CaseTriggerHandler.beforeUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                 
         if(Trigger.isBefore && Trigger.isDelete){   
         CaseTriggerHandler.beforeDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                 
         if(Trigger.isafter && Trigger.isInsert){   
         CaseTriggerHandler.afterInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                 
         if(Trigger.isafter && Trigger.isUpdate){   
         CaseTriggerHandler.afterUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                 
         if(Trigger.isafter && Trigger.isDelete){   
         CaseTriggerHandler.afterDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                 
         if(Trigger.isafter && Trigger.isUndelete){   
         CaseTriggerHandler.afterUndelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
}