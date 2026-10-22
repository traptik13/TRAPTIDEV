trigger CustomerProjectTrigger on CustomerProject__c (before insert, before update, before delete, 
                                           after insert, after update, after delete, after  undelete) {
                     
         if(trigger.isBefore && trigger.isInsert){
         CustomerProjectTriggerHandler.beforeInsert(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }
        
         if(trigger.isBefore && trigger.isUpdate){
         CustomerProjectTriggerHandler.beforeUpdate(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }

         if(trigger.isBefore && trigger.isDelete){
         CustomerProjectTriggerHandler.beforeDelete(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }

         if(trigger.isafter && trigger.isInsert){
         CustomerProjectTriggerHandler.afterInsert(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }

         if(trigger.isafter && trigger.isUpdate){
         CustomerProjectTriggerHandler.afterUpdate(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }

         if(trigger.isafter && trigger.isDelete){
         CustomerProjectTriggerHandler.afterDelete(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }

         if(trigger.isafter && trigger.isUndelete){
         CustomerProjectTriggerHandler.afterUndelete(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }

                                               

}