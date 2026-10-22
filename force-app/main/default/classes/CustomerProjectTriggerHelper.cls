public class CustomerProjectTriggerHelper {

    public static void UpdateCPActiveOnOpportunity(List<CustomerProject__c> triggerNew, Map<Id,CustomerProject__c> triggerNewMap, 
                                                    List<CustomerProject__c> triggerOld, Map<Id,CustomerProject__c> triggerOldMap){
    List<Opportunity> opps = new List<Opportunity>();
    for(CustomerProject__c cp : triggerNew){
        if(cp.Status__c == 'Active'){
            Opportunity opp= new Opportunity(id=cp.Opportunity__c);
            opp.Active_Customer_Project__c = True;
            opps.add(opp);
        }
    }
    update opps;
}


}