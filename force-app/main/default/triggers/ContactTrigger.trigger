trigger ContactTrigger on Contact (before insert, before update, before delete, 
                                   after insert, after update, after delete, after  undelete) {
         
        if(trigger.isBefore && trigger.isInsert){
           ContactTriggerHandler.beforeInsert(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }    
        if(trigger.isBefore && trigger.isUpdate){
           ContactTriggerHandler.beforeUpdate(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }    
        if(trigger.isBefore && trigger.isDelete){
           ContactTriggerHandler.beforeDelete(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }    
        if(trigger.isAfter && trigger.isInsert){
           ContactTriggerHandler.afterInsert(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }    
        if(trigger.isAfter && trigger.isUpdate){
           ContactTriggerHandler.afterUpdate(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }    
        if(trigger.isAfter && trigger.isDelete){
           ContactTriggerHandler.afterDelete(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }    
        if(trigger.isAfter && trigger.isUndelete){
           ContactTriggerHandler.afterUndelete(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);
                                                   
       }    
}