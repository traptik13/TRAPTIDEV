trigger TopXDesignationTrigger on Top_X_Designation__c (before insert, before update, before delete, 
                                                        after insert, after update, after delete, after undelete) {

         if(Trigger.isBefore && Trigger.isInsert){   
         TopXDesignationTriggerHandler.beforeInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                                            
         if(Trigger.isBefore && Trigger.isUpdate){   
         TopXDesignationTriggerHandler.beforeUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                                            
         if(Trigger.isBefore && Trigger.isDelete){   
         TopXDesignationTriggerHandler.beforeDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                                            
         if(Trigger.isafter && Trigger.isInsert){   
         TopXDesignationTriggerHandler.afterInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                                            
         if(Trigger.isafter && Trigger.isUpdate){   
         TopXDesignationTriggerHandler.afterUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                                            
         if(Trigger.isafter && Trigger.isDelete){   
         TopXDesignationTriggerHandler.afterDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
                                                            
         if(Trigger.isafter && Trigger.isUndelete){   
         TopXDesignationTriggerHandler.afterUndelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

          }
}