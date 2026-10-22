public with sharing class AccountController1 {

    @AuraEnabled(cacheable=true)
    public static List<Account> getAccounts() {
        return [
            SELECT Id, Name, Industry, Phone
            FROM Account
            ORDER BY CreatedDate DESC LIMIT 10
        ];
    }

    @AuraEnabled
    public static Account insertAccount(
        String name,
        String industry,
        String phone
    ) {
        Account acc = new Account();
        acc.Name = name;
        acc.Industry = industry;
        acc.Phone = phone;

        insert acc;

        return acc;
    }
}