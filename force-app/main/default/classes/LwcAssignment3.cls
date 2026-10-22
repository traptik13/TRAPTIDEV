public with sharing class LwcAssignment3{

    @AuraEnabled(cacheable=true)
    public static List<Opac__c> getOpacRecords(Id productId) {
        return [
            SELECT Id, Name, Product__c, Product__r.Name, Min__c, Max__c, Price__c
            FROM Opac__c
            WHERE Product__c = :productId
            ORDER BY Min__c
        ];
    }

    @AuraEnabled
    public static void saveOPAC(Opac__c opac) {
        upsert opac;
    }
}