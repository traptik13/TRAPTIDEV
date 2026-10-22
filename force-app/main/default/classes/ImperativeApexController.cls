public with sharing class ImperativeApexController {

    // FETCH - Get 10 Accounts
    @AuraEnabled
    public static List<Account> getAccounts() {

        return [
            SELECT Id, Name, Phone, Industry
            FROM Account
            LIMIT 10
        ];
    }


    // INSERT - Create 1 Account
    @AuraEnabled
    public static Account createAccount(String accountName) {

        Account acc = new Account();
        acc.Name = accountName;

        insert acc;

        return acc;
    }


    // UPDATE - Update 1 Account
    @AuraEnabled
    public static Account updateAccount(Id accountId, String newName) {

        Account acc = new Account();

        acc.Id = accountId;
        acc.Name = newName;

        update acc;

        return acc;
    }


    // DELETE - Delete 1 Account
    @AuraEnabled
    public static void deleteAccount(Id accountId) {

        Account acc = new Account(
            Id = accountId
        );

        delete acc;
    }
}