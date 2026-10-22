trigger EnrollmentTTrigger on EnrollmentT__c (before insert, before update, before delete, after insert, 
                                              after update, after delete, after Undelete) {
                                                  
         if(Trigger.isBefore && Trigger.isInsert){   
         EnrollmentTTriggerHandler.beforeInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                                  
         if(Trigger.isBefore && Trigger.isUpdate){   
         EnrollmentTTriggerHandler.beforeUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                                  
         if(Trigger.isBefore && Trigger.isDelete){   
         EnrollmentTTriggerHandler.beforeDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                                  
         if(Trigger.isafter && Trigger.isInsert){   
         EnrollmentTTriggerHandler.afterInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                                  
         if(Trigger.isafter && Trigger.isUpdate){   
         EnrollmentTTriggerHandler.afterUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                                  
         if(Trigger.isafter && Trigger.isDelete){   
         EnrollmentTTriggerHandler.afterDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                                  
         if(Trigger.isafter && Trigger.isUndelete){   
         EnrollmentTTriggerHandler.afterUndelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
}