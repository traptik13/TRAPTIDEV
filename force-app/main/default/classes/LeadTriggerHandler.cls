public class LeadTriggerHandler {
        
     public static void beforeInsert(List<Lead> triggerNew, Map<Id,Lead> triggerNewMap, 
                                    List<Lead> triggerOld, Map<Id,Lead> triggerOldMap){
            //LeadTriggerHelper.prefixDoctor(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
            //LeadTriggerHelper.assignment3(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
           // LeadTriggerHelper.assignment17(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
    }
    
     public static void beforeUpdate(List<Lead> triggerNew, Map<Id,Lead> triggerNewMap, 
                                    List<Lead> triggerOld, Map<Id,Lead> triggerOldMap){
            //LeadTriggerHelper.prefixDoctor(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
           // LeadTriggerHelper.assignment3(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
          //LeadTriggerHelper.assignment17(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
    }
    
     public static void beforeDelete(List<Lead> triggerNew, Map<Id,Lead> triggerNewMap, 
                                    List<Lead> triggerOld, Map<Id,Lead> triggerOldMap){
    }
    
     public static void afterInsert(List<Lead> triggerNew, Map<Id,Lead> triggerNewMap, 
                                    List<Lead> triggerOld, Map<Id,Lead> triggerOldMap){
    }
    
     public static void afterUpdate(List<Lead> triggerNew, Map<Id,Lead> triggerNewMap, 
                                    List<Lead> triggerOld, Map<Id,Lead> triggerOldMap){
    }
    
     public static void afterDelete(List<Lead> triggerNew, Map<Id,Lead> triggerNewMap, 
                                    List<Lead> triggerOld, Map<Id,Lead> triggerOldMap){
    }
    
     public static void afterUnDelete(List<Lead> triggerNew, Map<Id,Lead> triggerNewMap, 
                                    List<Lead> triggerOld, Map<Id,Lead> triggerOldMap){
    }
}