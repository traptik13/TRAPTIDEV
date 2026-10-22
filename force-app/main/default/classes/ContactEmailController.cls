public with sharing class ContactEmailController {
    
    // Empty constructor (optional, keep if needed for your component)
    public ContactEmailController() { }

    @AuraEnabled
    public static void validateAndCreateContact(Contact con) {
        // Validate email format
        if (String.isBlank(con.Email) || !Pattern.matches(
            '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}$', 
            con.Email
        )) {
            throw new AuraHandledException('Please enter a valid email address.');
        }

        // Check for duplicates
        if (![SELECT Id FROM Contact WHERE Email = :con.Email LIMIT 1].isEmpty()) {
            throw new AuraHandledException('A contact with this email already exists.');
        }

        // Insert contact
        insert con;
    }
}