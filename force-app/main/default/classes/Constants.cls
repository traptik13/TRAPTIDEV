public class Constants {
    
    // Static Final Variable
    public static final Double PI = 3.14159;
    
    // Instance Final Variable
    public final String accountType;
    
    // Constructor
    public Constants() {
        
        // Final variable can be assigned in constructor
        this.accountType = 'Prospect';
    }
    
    // Method to display values
    public void displayDetails() {
        
        System.debug('PI: ' + PI);
        System.debug('Account Type: ' + accountType);
    }
}