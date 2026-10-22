public with sharing class UserManagement{

    @AuraEnabled(cacheable=true)
    public static List<User> getUsers() {

        return [
            SELECT Id, Name, FirstName, LastName, IsActive, Username, Email
            FROM User
            ORDER BY CreatedDate DESC
        ];
    }
}