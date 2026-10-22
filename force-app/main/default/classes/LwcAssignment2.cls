public with sharing class LwcAssignment2 {

    @AuraEnabled(cacheable=false)
    public static List<Studentlwc__c> getStudents(Id classId) {
        if (classId == null) {
            return new List<Studentlwc__c>();
        }
        
        return [
            SELECT Id, Name, Email__c, Age__c, Class__c, Class__r.Name
            FROM Studentlwc__c 
            WHERE Class__c = :classId 
            ORDER BY Name ASC
        ];
    }

    @AuraEnabled
    public static void deleteStudents(List<Id> studentIds) {
        if (studentIds == null || studentIds.isEmpty()) {
            return;
        }
        
        List<Studentlwc__c> studentsToDelete = [
            SELECT Id FROM Studentlwc__c WHERE Id IN :studentIds
        ];
        
        if (!studentsToDelete.isEmpty()) {
            try {
                delete studentsToDelete;
            } catch (Exception ex) {
                throw new AuraHandledException('Error executing record deletions: ');
            }
        }
    }
}