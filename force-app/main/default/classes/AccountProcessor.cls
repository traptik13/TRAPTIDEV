public with sharing class AccountProcessor {

    // Called by Contact Trigger
    public static void onAfterSave(List<Contact> Contacts) {

        Set<Id> accountIds = new Set<Id>();

        // Collect Account IDs from Contacts
        for (Contact con : Contacts) {

            if (con.AccountId != null) {
                accountIds.add(con.AccountId);
            }
        }

        // Call Future Method
        if (!accountIds.isEmpty()) {
            updateAccount(accountIds);
        }
    }


    // Future Method
    @future(callout = false)
    private static void updateAccount(Set<Id> accountIds) {

        // Get Accounts and their related Contacts
        List<Account> accounts = [
            SELECT Id,
                   Name,
                   Count_of_Contacts__c,
                   (SELECT Id FROM Contacts)
            FROM Account
            WHERE Id IN :accountIds
        ];

        // Update Contact count
        for (Account acc : accounts) {

            acc.Count_of_Contacts__c = acc.Contacts.size();

            System.debug(
                'Account: ' + acc.Name +
                ' has ' + acc.Count_of_Contacts__c +
                ' Contacts'
            );
        }

        // Save Account changes
        if (!accounts.isEmpty()) {
            update accounts;
        }
    }
}