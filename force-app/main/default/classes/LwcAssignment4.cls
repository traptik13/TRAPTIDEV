public with sharing class LwcAssignment4{

    @AuraEnabled(cacheable=true)
     public static List<Studentlwc2__c> getActiveStudents(Integer numberOfRecords) {
    if (numberOfRecords == null || numberOfRecords == 0) {
        return [SELECT Id, Name, Course__c, College__c, Active__c 
                FROM Studentlwc2__c 
                WHERE Active__c = true];
    }
    return [SELECT Id, Name, Course__c, College__c, Active__c 
            FROM Studentlwc2__c 
            WHERE Active__c = true 
            ORDER BY CreatedDate DESC 
            LIMIT :numberOfRecords];
        }

}