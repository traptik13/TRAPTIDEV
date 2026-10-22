public with sharing class LwcAssignment1 {

    @AuraEnabled(cacheable=true)
    public static List<User> getUsers() {
        return [
            SELECT Id, Name, LastName, IsActive, Email, Username
            FROM User
            ORDER BY CreatedDate DESC
        ];
    }

    @AuraEnabled
    public static User createUser(
        String lastName,
        String email,
        String username,
        Id profileId
    ) {
        User u = new User();

        u.FirstName = 'Test';
        u.LastName = lastName;
        u.Email = email;
        u.Username = username;
        u.Alias = 'testuser';
        u.ProfileId = profileId;
        u.TimeZoneSidKey = 'Asia/Kolkata';
        u.LocaleSidKey = 'en_IN';
        u.EmailEncodingKey = 'UTF-8';
        u.LanguageLocaleKey = 'en_US';
        u.IsActive = true;

        insert u;

        return u;
    }
}