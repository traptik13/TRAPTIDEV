public with sharing class AccountController {
    @AuraEnabled(cacheable=true)
    public static List<Account> getAccountList() {
        return [SELECT Id, Name, Industry, Phone, Type 
                FROM Account 
                ORDER BY CreatedDate DESC 
                LIMIT 10];
    }
}