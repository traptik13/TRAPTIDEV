global class EmailService {

    @future
    public static void sendEmailNotification() {

        Messaging.SingleEmailMessage mail =
            new Messaging.SingleEmailMessage();

        mail.setToAddresses(
            new List<String>{'a@b.com', 's@s.com'}
        );

        mail.setSenderDisplayName('Salesforce Email');
        mail.setSubject('New Reminder');
        mail.setHtmlBody('Password');

        Messaging.sendEmail(
            new List<Messaging.SingleEmailMessage>{mail}
        );
    }
}