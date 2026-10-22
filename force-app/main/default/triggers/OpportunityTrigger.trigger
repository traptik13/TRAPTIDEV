trigger OpportunityTrigger on Opportunity (before insert, before update, before delete, 
                                           after insert, after update, after delete, after  undelete) {
                                               
       if(trigger.isBefore && trigger.isInsert){
           OpportunityTriggerHandler.beforeInsert(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }
       if(trigger.isBefore && trigger.isUpdate){
            OpportunityTriggerHandler.beforeUpdate(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }
       if(trigger.isBefore && trigger.isDelete){
            OpportunityTriggerHandler.beforeDelete(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }
       if(trigger.isAfter && trigger.isInsert){
            OpportunityTriggerHandler.afterInsert(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }
       if(trigger.isAfter && trigger.isUpdate){
            OpportunityTriggerHandler.afterUpdate(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }
       if(trigger.isAfter && trigger.isDelete){
            OpportunityTriggerHandler.afterDelete(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }
       if(trigger.isAfter && trigger.isUndelete){
            OpportunityTriggerHandler.afterUndelete(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }

}