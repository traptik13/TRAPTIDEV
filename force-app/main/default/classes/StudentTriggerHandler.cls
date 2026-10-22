public class StudentTriggerHandler {

    public static void beforeInsert(List<Studentlwc__c> triggerNew, Map<Id,Studentlwc__c> triggerNewMap, 
                                    List<Studentlwc__c> triggerOld, Map<Id,Studentlwc__c> triggerOldMap){
                                        
                                    }
    
    public static void beforeUpdate(List<Studentlwc__c> triggerNew, Map<Id,Studentlwc__c> triggerNewMap, 
                                    List<Studentlwc__c> triggerOld, Map<Id,Studentlwc__c> triggerOldMap){
                                        
                                    }
    
    public static void beforeDelete(List<Studentlwc__c> triggerNew, Map<Id,Studentlwc__c> triggerNewMap, 
                                    List<Studentlwc__c> triggerOld, Map<Id,Studentlwc__c> triggerOldMap){
                                        
                                    }
    
    public static void afterInsert(List<Studentlwc__c> triggerNew, Map<Id,Studentlwc__c> triggerNewMap, 
                                    List<Studentlwc__c> triggerOld, Map<Id,Studentlwc__c> triggerOldMap){
           StudentTriggerHelper.lwcAssignment2Count(triggerNew,triggerNewMap,triggerOld,triggerOldMap);      
           StudentTriggerHelper.lwcAssignment2Email(triggerNew,triggerNewMap,triggerOld,triggerOldMap);      
                                    }
    
    public static void afterUpdate(List<Studentlwc__c> triggerNew, Map<Id,Studentlwc__c> triggerNewMap, 
                                    List<Studentlwc__c> triggerOld, Map<Id,Studentlwc__c> triggerOldMap){
          StudentTriggerHelper.lwcAssignment2Count(triggerNew,triggerNewMap,triggerOld,triggerOldMap);                              
                                    }
    
    public static void afterDelete(List<Studentlwc__c> triggerNew, Map<Id,Studentlwc__c> triggerNewMap, 
                                    List<Studentlwc__c> triggerOld, Map<Id,Studentlwc__c> triggerOldMap){
          StudentTriggerHelper.lwcAssignment2Count(triggerNew,triggerNewMap,triggerOld,triggerOldMap);                            
                                    }
    
    public static void afterUndelete(List<Studentlwc__c> triggerNew, Map<Id,Studentlwc__c> triggerNewMap, 
                                    List<Studentlwc__c> triggerOld, Map<Id,Studentlwc__c> triggerOldMap){
                                        
                                    }
    
    
    
}