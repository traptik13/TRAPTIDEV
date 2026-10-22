public with sharing class Assignment1{

    @AuraEnabled(cacheable=true)
    public static List<User> getUsers() {

        return [SELECT Id, Name, Username, IsActive, Email FROM User ORDER BY Name LIMIT 3
        ];

    }

}