trigger Candidate2Trigger on Candidate2__c (before insert, before update, before delete, 
                                            after insert, after update, after delete, after undelete) {
 
         if(Trigger.isBefore && Trigger.isInsert){   
         Candidate2Handler.beforeInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
         if(Trigger.isBefore && Trigger.isUpdate){   
         Candidate2Handler.beforeUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
         if(Trigger.isBefore && Trigger.isDelete){   
         Candidate2Handler.beforeDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
         if(Trigger.isAfter && Trigger.isInsert){   
         Candidate2Handler.afterInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
         if(Trigger.isAfter && Trigger.isUpdate){   
         Candidate2Handler.afterUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
         if(Trigger.isAfter && Trigger.isDelete){   
         Candidate2Handler.afterDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
         if(Trigger.isAfter && Trigger.isUndelete){   
         Candidate2Handler.afterUndelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

 }
                                                
                                                
}