public class BookTriggerHandler {

     public static void beforeInsert(List<Book__c> triggerNew, Map<Id,Book__c> triggerNewMap, 
                                     List<Book__c> triggerOld, Map<Id,BooK__c> triggerOldMap){
            //BookTriggerHelper.discountPrice(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
                }
    
     public static void beforeUpdate(List<Book__c> triggerNew, Map<Id,Book__c> triggerNewMap, 
                                     List<Book__c> triggerOld, Map<Id,BooK__c> triggerOldMap){
            //BookTriggerHelper.discountPrice(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
                                     }
    
     public static void beforeDelete(List<Book__c> triggerNew, Map<Id,Book__c> triggerNewMap, 
                                     List<Book__c> triggerOld, Map<Id,BooK__c> triggerOldMap){
                                         
                                     }
    
     public static void afterInsert(List<Book__c> triggerNew, Map<Id,Book__c> triggerNewMap, 
                                     List<Book__c> triggerOld, Map<Id,BooK__c> triggerOldMap){
                                         
                                     }
    
     public static void afterUpdate(List<Book__c> triggerNew, Map<Id,Book__c> triggerNewMap, 
                                     List<Book__c> triggerOld, Map<Id,BooK__c> triggerOldMap){
                                         
                                     }
    
     public static void afterDelete(List<Book__c> triggerNew, Map<Id,Book__c> triggerNewMap, 
                                    List<Book__c> triggerOld, Map<Id,BooK__c> triggerOldMap){
                                         
                                     }
    
     public static void afterUndelete(List<Book__c> triggerNew, Map<Id,Book__c> triggerNewMap, 
                                      List<Book__c> triggerOld, Map<Id,BooK__c> triggerOldMap){
                                         
                                     }
}