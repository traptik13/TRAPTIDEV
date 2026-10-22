trigger Contact_RelationshipTrigger on Contact_Relationship__c (before insert, before update, before delete, 
                                            after insert, after update, after delete, after  undelete) {
                                                
           if(trigger.isBefore && trigger.isInsert){
           Contact_RelationshipHandler.beforeInsert(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);                                             
       } 
           if(trigger.isBefore && trigger.isUpdate){
           Contact_RelationshipHandler.beforeUpdate(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);                                             
       } 
           if(trigger.isBefore && trigger.isDelete){
           Contact_RelationshipHandler.beforeDelete(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);                                             
       } 
           if(trigger.isafter && trigger.isInsert){
           Contact_RelationshipHandler.afterInsert(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);                                             
       } 
           if(trigger.isafter && trigger.isUpdate){
           Contact_RelationshipHandler.afterUpdate(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);                                             
       } 
           if(trigger.isafter && trigger.isDelete){
           Contact_RelationshipHandler.afterDelete(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);                                             
       } 
           if(trigger.isafter && trigger.isUndelete){
           Contact_RelationshipHandler.afterUndelete(trigger.New, trigger.NewMap, trigger.Old, trigger.OldMap);                                             
       } 

}