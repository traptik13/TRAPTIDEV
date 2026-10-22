public class BookTriggerHelper {
 public static void discountPrice(List<Book__c> triggerNew, Map<Id,Book__c> triggerNewMap, 
                                  List<Book__c> triggerOld, Map<Id,BooK__c> triggerOldMap){
        for(Book__c b: triggerNew){
             b.price__c = b.Price__c*0.9;                             
          }              
    }
}