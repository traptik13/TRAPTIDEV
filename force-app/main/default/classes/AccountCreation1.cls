Public Class AccountCreation1{
   Public List<Account> createAccount(String name, String phone, Integer n){
      List<Account> accList = new List<Account>();
      for(Integer i = 0; i < n; i++){
         Account acc = new Account();
         acc.Name = name + i;
         acc.Phone = phone;
         accList.add(acc);
      }
         if (!accList.isEmpty()) {
              insert accList;
         }

      return accList;	
   }
}