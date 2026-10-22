Public class FetchAccountNameFromPhone{
   Public Set<String> FetchAccName(String p){
      Set<String> s1= new Set<String>();
      List<Account> accList =[Select id, Name From Account where phone =: p];
      for(Account accObj : accList ){
         String s = accObj.Name;
         s1.add(s);
      }
      System.debug('xxxxxxxxx' + s1);
      return s1;
      }
}