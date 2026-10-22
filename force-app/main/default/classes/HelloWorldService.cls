public class HelloWorldService {

    public static void addHelloWorld(List<Account> accounts) {

        for (Account acc : accounts) {

            if (acc.Hello__c != 'World') {
                acc.Hello__c = 'World';
            }
        }
    }
}