public class TopXDesignationTriggerHelper {
    
    public static void updateHandoffAttached(List<Top_X_Designation__c> triggerNew, Map<Id, Top_X_Designation__c> triggerNewMap,
                                             List<Top_X_Designation__c> triggerOld, Map<Id, Top_X_Designation__c> triggerOldMap){

        Map<Id, Id> mapDocAttchTrue = new Map<Id, Id>();
        Map<Id, Id> mapDocAttchFalse = new Map<Id, Id>();
        Set<Id> setOppId = new Set<Id>();
        Set<Id> setOppIdDelete = new Set<Id>();
        List<Opportunity> listOppUpdate = new List<Opportunity>();
       
        // INSERT / UPDATE
        if (triggerNew != null) {
            for (Top_X_Designation__c ada : triggerNew) {
                if (ada.Opportunity__c != null && ada.Document_Attached__c && ada.Item_Type__c == 'Contract Flow Down/Handoff'){
                    mapDocAttchTrue.put(ada.Opportunity__c,ada.Id);
                    setOppId.add(ada.Opportunity__c);
                } else if (ada.Opportunity__c != null) {
                    mapDocAttchFalse.put(ada.Opportunity__c,ada.Id);
                    setOppId.add(ada.Opportunity__c); 
                }
            }
            // UPDATE ONLY
            if (triggerOld != null) {
                for (Top_X_Designation__c ada : triggerOld) {
                    if (ada.Opportunity__c != null) {
                        setOppId.add(ada.Opportunity__c);
                    }
                }
            }
        }
        // DELETE ONLY
        if (triggerNew == null && triggerOld != null) {
            for (Top_X_Designation__c ada : triggerOld) {
                if (ada.Opportunity__c != null) {
                    setOppIdDelete.add(ada.Opportunity__c);
                    setOppId.add(ada.Opportunity__c);
                }
            }
        }
        // Get Opportunities
        List<Opportunity> listOpp = [SELECT Id, Handoff_Attached__c FROM Opportunity WHERE Id IN :setOppId];
        // Update Opportunities
        for (Opportunity opp : listOpp) {
            // DELETE
            if (setOppIdDelete.contains(opp.Id)) {
                opp.Handoff_Attached__c = '';
            }
            // INSERT / UPDATE - Valid condition
            else if (mapDocAttchTrue.containsKey(opp.Id)) {
                opp.Handoff_Attached__c = 'Yes';
            }
            // INSERT / UPDATE - Invalid condition
            else if (mapDocAttchFalse.containsKey(opp.Id)) {
                opp.Handoff_Attached__c = 'No';
            }
            listOppUpdate.add(opp);
        }

        if (!listOppUpdate.isEmpty()) {
            update listOppUpdate;
        }
    }

}