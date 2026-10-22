Public class AccountCreation {
   Public void createAccount(String name){
      Account a= new Account();
      a.Name = name;
      insert a;
       this.name = name;
       System.debug(a.Id);
System.debug(a.name);
       
       
   }
    Public String Name;
}