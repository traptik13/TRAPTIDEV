public class ContactWrapper {
    
    // Instance variable
    public String name;
    
    // Constructor
    public ContactWrapper(String name) {
        
        // this.name = instance variable
        // name = constructor parameter
        this.name = name;
    }
    
    // Method to display contact name
    public void displayContact() {
        System.debug('Contact Name: ' + this.name);
    }
}