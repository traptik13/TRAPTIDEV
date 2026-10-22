trigger PositionTrigger on Position__c (before insert, before update, before delete, 
                                        after insert, after update, after delete, after undelete) {

         if(Trigger.isBefore && Trigger.isInsert){   
         PositionTriggerHandler.beforeInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                            
         if(Trigger.isBefore && Trigger.isUpdate){   
         PositionTriggerHandler.beforeUpdate(trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);         
             
          }
                                            
         if(Trigger.isBefore && Trigger.isDelete){   
         PositionTriggerHandler.beforeDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
        
         }

         if(Trigger.isafter && Trigger.isInsert){   
         PositionTriggerHandler.afterInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
             
         }

         if(Trigger.isafter && Trigger.isUpdate){   
         PositionTriggerHandler.afterUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
             
         }

         if(Trigger.isafter && Trigger.isDelete){   
         PositionTriggerHandler.afterDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);
         
         }

         if(Trigger.isafter && Trigger.isUndelete){   
         PositionTriggerHandler.afterUndelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

         }
 }