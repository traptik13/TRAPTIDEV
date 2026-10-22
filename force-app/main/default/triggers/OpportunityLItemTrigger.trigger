trigger OpportunityLItemTrigger on OpportunityLineItem(before insert, before update, before delete, 
                                                       after insert, after update, after delete, after  undelete) {

       if(trigger.isBefore && trigger.isInsert){
          OpportunityLItemTriggerHandler.beforeInsert(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }   
                                                           
       if(trigger.isBefore && trigger.isUpdate){
         OpportunityLItemTriggerHandler.beforeUpdate(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       } 
                                                           
       if(trigger.isBefore && trigger.isDelete){
            OpportunityLItemTriggerHandler.beforeDelete(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }
       if(trigger.isAfter && trigger.isInsert){
            OpportunityLItemTriggerHandler.afterInsert(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }
       if(trigger.isAfter && trigger.isUpdate){
            OpportunityLItemTriggerHandler.afterUpdate(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }
       if(trigger.isAfter && trigger.isDelete){
            OpportunityLItemTriggerHandler.afterDelete(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }
       if(trigger.isAfter && trigger.isUndelete){
            OpportunityLItemTriggerHandler.afterUndelete(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }
                                                           
}