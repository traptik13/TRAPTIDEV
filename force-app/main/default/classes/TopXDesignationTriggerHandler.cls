public class TopXDesignationTriggerHandler {

    public static void beforeInsert(List<Top_X_Designation__c> triggerNew, Map<Id,Top_X_Designation__c> triggerNewMap, 
                                    List<Top_X_Designation__c> triggerOld, Map<Id,Top_X_Designation__c> triggerOldMap){
                                        
                                    }
    
    public static void beforeUpdate(List<Top_X_Designation__c> triggerNew, Map<Id,Top_X_Designation__c> triggerNewMap, 
                                    List<Top_X_Designation__c> triggerOld, Map<Id,Top_X_Designation__c> triggerOldMap){
                                        
                                    }
    
    public static void beforeDelete(List<Top_X_Designation__c> triggerNew, Map<Id,Top_X_Designation__c> triggerNewMap, 
                                    List<Top_X_Designation__c> triggerOld, Map<Id,Top_X_Designation__c> triggerOldMap){
                                        
                                    }
    
    public static void afterInsert(List<Top_X_Designation__c> triggerNew, Map<Id,Top_X_Designation__c> triggerNewMap, 
                                    List<Top_X_Designation__c> triggerOld, Map<Id,Top_X_Designation__c> triggerOldMap){
           TopXDesignationTriggerHelper.updateHandoffAttached(triggerNew, triggerNewMap, triggerOld, triggerOldMap);                             
                                    }
    
    public static void afterUpdate(List<Top_X_Designation__c> triggerNew, Map<Id,Top_X_Designation__c> triggerNewMap, 
                                    List<Top_X_Designation__c> triggerOld, Map<Id,Top_X_Designation__c> triggerOldMap){
            TopXDesignationTriggerHelper.updateHandoffAttached(triggerNew, triggerNewMap, triggerOld, triggerOldMap);                             
                                               
                                    }
    
    public static void afterDelete(List<Top_X_Designation__c> triggerNew, Map<Id,Top_X_Designation__c> triggerNewMap, 
                                   List<Top_X_Designation__c> triggerOld, Map<Id,Top_X_Designation__c> triggerOldMap){
            TopXDesignationTriggerHelper.updateHandoffAttached(triggerNew, triggerNewMap, triggerOld, triggerOldMap);                             
                                                         
                                    }
    
    public static void afterUndelete(List<Top_X_Designation__c> triggerNew, Map<Id,Top_X_Designation__c> triggerNewMap, 
                                     List<Top_X_Designation__c> triggerOld, Map<Id,Top_X_Designation__c> triggerOldMap){
                                        
                                    }
}