public class ContactTriggerHandler {
   public static void beforeInsert(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap, 
                                   List<Contact> triggerOld, Map<Id,Contact> triggerOldMap){
        //ContactTriggerHelper.assignment13(triggerNew, triggerNewMap, triggerOld, triggerOldMap); 
       //  ContactTriggerHelper.assignment15(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
         // ContactTriggerHelper.assignment16(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
          //ContactTriggerHelper.assignment35(triggerNew, triggerNewMap, triggerOld, triggerOldMap); 
                                     
                                    }
    public static void beforeUpdate(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap, 
                                    List<Contact> triggerOld, Map<Id,Contact> triggerOldMap){
          //ContactTriggerHelper.assignment13(triggerNew, triggerNewMap, triggerOld, triggerOldMap); 
          //ContactTriggerHelper.assignment16(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
         // ContactTriggerHelper.assignment35(triggerNew, triggerNewMap, triggerOld, triggerOldMap); 
                                        
                                    }
    public static void beforeDelete(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap, 
                                    List<Contact> triggerOld, Map<Id,Contact> triggerOldMap){
         //ContactTriggerHelper.assignment10(triggerNew, triggerNewMap, triggerOld, triggerOldMap);  // didn't work in afterdelete
                                                                    
                                    }
    public static void afterInsert(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap, 
                                   List<Contact> triggerOld, Map<Id,Contact> triggerOldMap){
         //ContactTriggerHelper.createContactRelationshipByContact(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
         //ContactTriggerHelper.CountOfContacts(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
         //ContactTriggerHelper.assignment8(triggerNew, triggerNewMap, triggerOld, triggerOldMap); 
        // ContactTriggerHelper.assignment26(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
         //ContactTriggerHelper.assignment29(triggerNew, triggerNewMap, triggerOld, triggerOldMap); 
          // ContactTriggerHelper.updateAccountContactCount(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
                                    }
    public static void afterUpdate(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap, 
                                   List<Contact> triggerOld, Map<Id,Contact> triggerOldMap){
         //ContactTriggerHelper.assignment26(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
        //ContactTriggerHelper.assignment36(triggerNew, triggerNewMap, triggerOld, triggerOldMap);  
        
                                    }
    
    public static void afterDelete(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap, 
                                   List<Contact> triggerOld, Map<Id,Contact> triggerOldMap){
        //ContactTriggerHelper.CountOfContacts(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
       // ContactTriggerHelper.assignment26(triggerNew, triggerNewMap, triggerOld, triggerOldMap); 
        // ContactTriggerHelper.updateAccountContactCount(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
                                    }
    
    public static void afterUndelete(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap, 
                                     List<Contact> triggerOld, Map<Id,Contact> triggerOldMap){
        //ContactTriggerHelper.CountOfContacts(triggerNew, triggerNewMap, triggerOld, triggerOldMap);  
                                        
                                    }
}