public class AccountTriggerHandler {
    public static void beforeInsert(List<Account> triggerNew, Map<Id,Account> triggerNewMap, 
                                    List<Account> triggerOld, Map<Id,ACcount> triggerOldMap){
           //AccountTriggerHelper.addPrefixAsMr(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
          // AccountTriggerHelper.duplicateAccountNamebyMap(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
          // AccountTriggerHelper.duplicateAccountNamebySet(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
          //AccountTriggerHelper.Helloworld(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
          //AccountTriggerHelper.UpdateSalesRep(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
         //AccountTriggerHelper.assignment1(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
        // AccountTriggerHelper.assignment2(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
        // AccountTriggerHelper.assignment7(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
        //AccountTriggerHelper.assignment19(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
       //AccountTriggerHelper.assignment1byMap(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
    }
    
     public static void beforeUpdate(List<Account> triggerNew, Map<Id,Account> triggerNewMap, 
                                     List<Account> triggerOld, Map<Id,Account> triggerOldMap){
            //AccountTriggerHelper.addPrefixAsMr(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
            //AccountTriggerHelper.Helloworld(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
            //AccountTriggerHelper.UpdateSalesRep(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
           //AccountTriggerHelper.assignment2(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
         //  AccountTriggerHelper.assignment7(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
           
    }    
    
    public static void beforeDelete(List<Account> triggerNew, Map<Id,Account> triggerNewMap, 
                                    List<Account> triggerOld, Map<Id,Account> triggerOldMap){
           //AccountTriggerHelper.AccountDelete(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
           //AccountTriggerHelper.assignment4(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
    }
    
    public static void afterInsert(List<Account> triggerNew, Map<Id,Account> triggerNewMap, 
                                   List<Account> triggerOld, Map<Id,Account> triggerOldMap){
           //AccountTriggerHelper.createContactByAccount(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
           //AccountTriggerHelper.ContactsCreation(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
         //AccountTriggerHelper.assignment5(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
         //AccountTriggerHelper.assignment14(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
            
    }
    
    public static void afterUpdate(List<Account> triggerNew, Map<Id,Account> triggerNewMap, 
                                   List<Account> triggerOld, Map<Id,Account> triggerOldMap){
           //AccountTriggerHelper.practice1Ownerchange(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
           //AccountTriggerHelper.ContactsCreation(triggerNew,triggerNewMap,triggerOld,triggerOldMap);
          // AccountTriggerHelper.assignment5(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
           //AccountTriggerHelper.assignment14(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
           //AccountTriggerHelper.assignment28(triggerNew, triggerNewMap, triggerOld, triggerOldMap);
          

    }
    
    public static void afterDelete(List<Account> triggerNew, Map<Id,Account> triggerNewMap, 
                                   List<Account> triggerOld, Map<Id,Account> triggerOldMap){
    }
    
    public static void afterUndelete(List<Account> triggerNew, Map<Id,Account> triggerNewMap, 
                                     List<Account> triggerOld, Map<Id,Account> triggerOldMap){
    }
}