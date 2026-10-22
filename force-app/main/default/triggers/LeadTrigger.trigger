trigger LeadTrigger on Lead (before insert, before update, before delete, 
                             after insert, after update, after delete, after undelete) {
        
        if(trigger.isBefore && trigger.isInsert){
             LeadTriggerHandler.beforeInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

                                     
                                 }
        if(trigger.isBefore && trigger.isUpdate){
             LeadTriggerHandler.beforeUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

                                     
                                 }
        if(trigger.isBefore && trigger.isDelete){
             LeadTriggerHandler.beforeDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

                                     
                                 }
        if(trigger.isAfter && trigger.isInsert){
             LeadTriggerHandler.afterInsert(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

                                     
                                 }
        if(trigger.isAfter && trigger.isUpdate){
             LeadTriggerHandler.afterUpdate(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

                                     
                                 }
        if(trigger.isAfter && trigger.isDelete){
             LeadTriggerHandler.afterDelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

                                     
                                 }
        if(trigger.isAfter && trigger.isUndelete){
             LeadTriggerHandler.afterUndelete(Trigger.New, Trigger.NewMap, Trigger.Old, Trigger.OldMap);

                                     
                                 }
                                     
                                 
}