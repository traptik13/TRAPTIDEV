public class OpportunityLItemTriggerHelper {
 
     public static void assignment33(List<OpportunityLineItem> triggerNew, Map<Id,OpportunityLineItem> triggerNewMap, 
                                     List<OpportunityLineItem> triggerOld, Map<Id,OpportunityLineItem> triggerOldMap){
     
      Set<Id> oppIdSet = new Set<Id>();                                
       for(OpportunityLineItem oppItem : triggerNew){
          if(oppItem.Product2Id != Null){
              oppIdSet.add(oppItem.Product2Id);
          }     
      } 
                                         
      List<Product_Pricing__c> ppList = ([Select Id, Product2Id__c, Price__c From Product_Pricing__c 
                                          Where Product2Id__c In : oppIdSet]);
                                         
      Map<Id, Decimal> priceMap = new  Map<Id, Decimal>();                                  
      for(Product_Pricing__c pp : ppList){
          if(!priceMap.containsKey(pp.Product2Id__c)){
              priceMap.Put(pp.Product2Id__c, pp.Price__c);
          }                                     
      }
                                         
       for(OpportunityLineItem oppItem : triggerNew){
        for(Id ppId : priceMap.Keyset()){
            if(oppItem.Product2Id != Null && oppItem.Product2Id == ppId){
                oppItem.UnitPrice = oppItem.Quantity * priceMap.get(ppId);
            }                                      
        }
       }                                        
  }
    
     public static void lwcassignmentPrice(List<OpportunityLineItem> triggerNew, Map<Id,OpportunityLineItem> triggerNewMap, 
                                        List<OpportunityLineItem> triggerOld, Map<Id,OpportunityLineItem> triggerOldMap){
     
        Set<Id> productIdSet = new Set<Id>();                                
        for(OpportunityLineItem oppItem : triggerNew){
            if(oppItem.Product2Id != Null){
                productIdSet.add(oppItem.Product2Id);
            }     
        } 
                                         
        List<Opac__c> opacList = ([Select Id, Product__c, Min__c, Max__c, Price__c From Opac__c 
                                   Where Product__c In :productIdSet]);
                                         
        for(OpportunityLineItem oppItem : triggerNew){
            for(Opac__c opac : opacList){
                if(oppItem.Product2Id != Null && oppItem.Product2Id == opac.Product__c
                   && oppItem.Quantity >= opac.Min__c && oppItem.Quantity <= opac.Max__c){
                       
                    oppItem.UnitPrice = opac.Price__c;
                }                                      
            }
        }     
    }
}