public class AccountCreator {
    public Account accountRecord;
    public AccountCreator(String accName, String phone) {
        this.accountRecord = new Account(
            Name = accName,
            Phone = phone,
            Industry = 'Technology' );
    }
  
    public AccountCreator(String accName) {
        this(accName, '555-1212'); 
        
    }
}