public class OpacTriggerHelper{

    public static void lwcassignmentMinMax(List<Opac__c> triggerNew, Map<Id,Opac__c> triggerNewMap, 
                                        List<Opac__c> triggerOld, Map<Id,Opac__c> triggerOldMap){
     
        Set<Id> productIdSet = new Set<Id>();                                
        for(Opac__c opac : triggerNew){
            if(opac.Product__c != null){
                productIdSet.add(opac.Product__c);
            }     
        } 
                                                                           
        List<Opac__c> opacList = ([SELECT Id, Product__c, Min__c, Max__c FROM Opac__c 
                                   WHERE Product__c IN :productIdSet]);
                                         
        Map<Id, Decimal> maxMap = new Map<Id, Decimal>();                                  
        for(Opac__c opac : opacList){
            if(opac.Max__c == null){
                continue;
            }
            if(!maxMap.containsKey(opac.Product__c)){
                maxMap.put(opac.Product__c, opac.Max__c);
            }
            else if(opac.Max__c > maxMap.get(opac.Product__c)){
                maxMap.put(opac.Product__c, opac.Max__c);
            }                                     
        }
                                         
        for(Opac__c opac : triggerNew){
            if(opac.Id != null){
                Opac__c oldOpac = triggerOldMap.get(opac.Id);
                if(opac.Product__c != oldOpac.Product__c || opac.Min__c != oldOpac.Min__c || opac.Max__c != oldOpac.Max__c){
                    opac.addError('Min and Max values cannot be changed once the record is created.');
                }
                continue;
            }
            
            Decimal newValue = 1;
            
            if(maxMap.containsKey(opac.Product__c)){
                newValue = maxMap.get(opac.Product__c) + 1;
            }
            
            if(opac.Min__c != newValue){
                opac.Min__c.addError('Min value must be ' + newValue + ' for this Product.');
                continue;
            }
            
            if(opac.Max__c != null){
                maxMap.put(opac.Product__c, opac.Max__c);
            }
        }     
    }
}