public class AddPrimaryContact implements Queueable {

    private Contact contact;
    private String state;

    // Constructor
    public AddPrimaryContact(Contact contactRecord, String stateValue) {
        this.contact = contactRecord;
        this.state = stateValue;
    }

    public void execute(QueueableContext context) {
        List<Account> accounts = getAccounts(state);

        if (!accounts.isEmpty()) {
            List<Contact> contactsToInsert = new List<Contact>();

            for (Account acc : accounts) {
                Contact newContact = new Contact();
                newContact.AccountId = acc.Id;
                newContact.FirstName = contact.FirstName;
                newContact.LastName = contact.LastName;
                newContact.Email = contact.Email;
                newContact.Phone = contact.Phone;
                newContact.Title = contact.Title;

                contactsToInsert.add(newContact);
            }

            if (!contactsToInsert.isEmpty()) {
                Database.SaveResult[] results = Database.insert(contactsToInsert, false);

                for (Database.SaveResult result : results) {
                    if (result.isSuccess()) {
                        System.debug('Successfully inserted contact: ' + result.getId());
                    } else {
                        for (Database.Error error : result.getErrors()) {
                            System.debug('Failed to insert contact: ' + error.getMessage());
                        }
                    }
                }
            }
        } else {
            System.debug('No accounts found for state: ' + state);
        }
    }

    public static List<Account> getAccounts(String state) {
        return [
            SELECT Id, Name FROM Account
            WHERE BillingState = :state
        ];
    }
}