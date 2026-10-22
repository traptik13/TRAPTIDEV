public class OpportunityTriggerHandler {
    
    public static void beforeInsert(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                    List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap){
          //OpportunityTriggerHelper.assignment18(triggerNew, triggerNewMap, triggerOld, triggerOldMap);                             
                                    }
    
    public static void beforeUpdate(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                    List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap){
                                        
                                    }
    
    public static void beforeDelete(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                    List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap){
       //OpportunityTriggerHelper.assignment23(triggerNew, triggerNewMap, triggerOld, triggerOldMap);                                 
                                    }
    
    public static void afterInsert(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                    List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap){
           //OpportunityTriggerHelper.opportunityTeamInsert(triggerNew, triggerNewMap, triggerOld, triggerOldMap); 
          // OpportunityTriggerHelper.UpdateATMwithOwneronOptyCreate(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
          //OpportunityTriggerHelper.assignment22(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
        // OpportunityTriggerHelper.assignment27(triggerNew, triggerNewMap, triggerOld, triggerOldMap, true);
        //  OpportunityTriggerHelper.assignment37(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
        // OpportunityTriggerHelper.assignment38(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
          // OpportunityTriggerHelper.assignment(triggerNew, triggerNewMap, triggerOld, triggerOldMap);                                
                                    }
                                      
    public static void afterUpdate(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                   List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap){
           //OpportunityTriggerHelper.UpdateATMwithOwneronOptyCreate(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
          // OpportunityTriggerHelper.assignment27(triggerNew, triggerNewMap, triggerOld, triggerOldMap, false);
         //  OpportunityTriggerHelper.assignment37(triggerNew, triggerNewMap, triggerOld, triggerOldMap); 
          //OpportunityTriggerHelper.assignment38(triggerNew, triggerNewMap, triggerOld, triggerOldMap);                             
          //  OpportunityTriggerHelper.assignment(triggerNew, triggerNewMap, triggerOld, triggerOldMap);       
                                   }
    public static void afterDelete(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                    List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap){
         // OpportunityTriggerHelper.assignment37(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
        // OpportunityTriggerHelper.assignment38(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
        // OpportunityTriggerHelper.assignment(triggerNew, triggerNewMap, triggerOld, triggerOldMap);       
                       
                                    }
    
    public static void afterUndelete(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                     List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap){
        //    OpportunityTriggerHelper.assignment37(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
        // OpportunityTriggerHelper.assignment38(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
      //  OpportunityTriggerHelper.assignment(triggerNew, triggerNewMap, triggerOld, triggerOldMap);                            
                                    }
}