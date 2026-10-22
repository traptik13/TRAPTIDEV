public with sharing class OpportunityController1 {
    @AuraEnabled(cacheable=true)
    public static List<Opportunity> getRecentOpportunities() {
        return [SELECT Id, Name, StageName, Amount, CloseDate 
                FROM Opportunity ORDER BY CreatedDate DESC LIMIT 10];
    }

    // Optional: Custom Apex insert if you need complex logic
    @AuraEnabled
    public static Opportunity createOppRecord(Opportunity opp){
        insert opp;
        return opp;
    }
}