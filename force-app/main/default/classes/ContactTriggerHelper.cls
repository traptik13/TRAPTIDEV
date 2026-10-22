public class ContactTriggerHelper{

    
    public static void createContactRelationshipByContact(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap, 
                                                          List<Contact> triggerOld, Map<Id,Contact> triggerOldMap)
    {
        List<Contact_Relationship__c> CRlist = new List<Contact_Relationship__c>();

        for(Contact newconlist : triggerNew)
        {
            if(newconlist.Create_Contact_Relationship__c == True)
            {
                Contact_Relationship__c cr = new Contact_Relationship__c();

                cr.Name = newconlist.LastName;
                cr.Contact__c = newconlist.Id;

                CRlist.add(cr);
            }
        }

        if(CRlist.size() > 0)
        {
            insert CRlist;
        }
    }
    
    
   /*public static void CountOfContacts( List<Contact> triggerNew, Map<Id, Contact> triggerNewMap, List<Contact> triggerOld,Map<Id, Contact> triggerOldMap){

    Set<Id> accountIds = new Set<Id>();

    // Get Account Ids from new Contacts
    for (Contact con : triggerNew) {
        if (con.AccountId != null) {
            accountIds.add(con.AccountId);
        }
    }

    // Get Account Ids from old Contacts
    for (Contact con : triggerOld) {
        if (con.AccountId != null) {
            accountIds.add(con.AccountId);
        }
    }

    // If no Account is related, stop here
    if (accountIds.isEmpty()) {
        return;
    }

    // Get all Contacts belonging to affected Accounts
    List<Contact> contactList = [SELECT Id, AccountId FROM Contact WHERE AccountId IN :accountIds];

    // AccountId → Contact Count
    Map<Id, Integer> mapCount = new Map<Id, Integer>();

    for (Contact con : contactList) {

        if (!mapCount.containsKey(con.AccountId)) {
            mapCount.put(con.AccountId, 0);
        }

        mapCount.put(
            con.AccountId,
            mapCount.get(con.AccountId) + 1
        );
    }

    // Get affected Accounts
    List<Account> accountList = [SELECT Id, Count_Of_Contacts__c FROM Account WHERE Id IN :accountIds];

    // Update count on Account
    for (Account acc : accountList) {

        if (mapCount.containsKey(acc.Id)) {
            acc.Count_Of_Contacts__c = mapCount.get(acc.Id);
        } else {
            acc.Count_Of_Contacts__c = 0;
        }
    }

    update accountList;
}*/

    
    
    
    
    public static void CountOfContacts(List<Contact> triggerNew, Map<Id, Contact> triggerNewMap, 
                                       List<Contact> triggerOld, Map<Id, Contact> triggerOldMap) {

    Set<Id> accid = new Set<Id>();
    List<Account> acclist = new List<Account>();

    // Get Account Ids from new Contacts
    if (triggerNew != null) {
        for (Contact con : triggerNew) {
            if (con.AccountId != null) {
                accid.add(con.AccountId);
            }
        }
    }
    // Get Account Ids from old Contacts
    if (triggerOld != null) {
        for (Contact con : triggerOld) {
            if (con.AccountId != null) {
                accid.add(con.AccountId);
            }
        }
    }       
    // Get Accounts and contacts
        for (Account acc : [SELECT Id, (SELECT Id FROM Contacts) FROM Account WHERE Id IN :accid]) {
            acc.Count_of_Contacts__c = acc.Contacts.size(); 
            acclist.add(acc);
        }
          // Perform DML update
        if (!acclist.isEmpty()) {
            update acclist;
        }
    }
    
    public static void assignment8(List<Contact> triggerNew, Map<Id, Contact> triggerNewMap, 
                                   List<Contact> triggerOld, Map<Id, Contact> triggerOldMap){
           List<Contact_Relationship__c> conRelList = new  List<Contact_Relationship__c>();
           if (triggerNew != null){
           for(Contact con: triggerNew){
               if(con.Create_Contact_Relationship__c == True){
                   Contact_Relationship__c conRel = new Contact_Relationship__c();
                   conRel.Name = con.LastName;
                   conRel.Contact__c = con.Id; 
                   conRelList.add(conRel);
               }
           }  
           }
             if(!conRelList.isEmpty()){
                insert conRelList;                          
              }
   }                             
                      
        public static void assignment10(List<Contact> triggerNew, Map<Id, Contact> triggerNewMap, 
                                        List<Contact> triggerOld, Map<Id, Contact> triggerOldMap){
             List<Contact_Relationship__c> conRelList = new List<Contact_Relationship__c>();
             Set<Id> conSet = new Set<Id>();
                 if(triggerOld != Null){  
                  for(Contact con : triggerOld){
                      If(con.Id != null){
                          conSet.add(con.Id);
                      }    
             }
         }   
          if(conSet.isEmpty()){
           return;
          }
            
            system.debug(conSet);
             
            List<Contact_Relationship__c> conList2 = ([SELECT Id, Contact__c FROM Contact_Relationship__c 
                                                      WHERE Contact__c IN :conSet]);                           
           System.debug(conList2);
                    for(Contact_Relationship__c conRel : conList2){
                         conRelList.add(conRel);      
                }
            
         
         if(!conRelList.isEmpty()){
             delete conRelList;  
         }      
                                        
}
   
    
    public static void assignment13(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap, 
                                    List<Contact> triggerOld, Map<Id,Contact> triggerOldMap){
    Set<Id> accIdSet = new Set<Id>();

    if(triggerNew != null){
        for(Contact conn : triggerNew){
            if(conn.AccountId != null && conn.Primary_Contact__c){
                accIdSet.add(conn.AccountId);
            }
        }
    }

    if(accIdSet.isEmpty()){ 
        return; 
    }

    List<Contact> conList = ([SELECT Id, AccountId, Primary_Contact__c FROM Contact 
                              WHERE Primary_Contact__c = true AND AccountId IN :accIdSet]);

    Map<Id,Contact> primaryConMap = new Map<Id,Contact>();

    for(Contact c : conList){
        if(!primaryconMap.containsKey(c.AccountId)){
         primaryConMap.put(c.AccountId,c);
        }
    }

    Set<Id> newPrimaryAccIdSet = new Set<Id>();

    for(Contact conn : triggerNew){
        if(conn.AccountId != null && conn.Primary_Contact__c){
            if(primaryConMap.containsKey(conn.AccountId)){
                conn.Primary_Contact__c.addError('only one primary contact allowed');
            }else if(newPrimaryAccIdSet.contains(conn.AccountId)){
                conn.Primary_Contact__c.addError('only one primary contact allowed');
            }else{
                newPrimaryAccIdSet.add(conn.AccountId);
            }
        }
    }
}
    
       /* public static void assignment15(List<Contact> triggerNew, Map<Id, Contact> triggerNewMap, 
                                        List<Contact> triggerOld, Map<Id, Contact> triggerOldMap){
                   
                   List<Account> accList = new List<Account>();                          
                                            
                   for(Contact conn: triggerNew){
                     if(conn.AccountId == NUll){
                       Account acc = new Account();
                       acc.Name = conn.LastName;
                       accList.add(acc);
                      
                      }
                   }
                   
                  if(!accList.isEmpty()){
                     insert accList;
                    
                  }
                  system.debug(accList[0].id);
                
                for(Contact conn: triggerNew){
                    for(Integer i=0; i<accList.size(); i++){
                        conn.AccountId = accList[i].id;
                        
                    }                           
                }
              
  } */   
    
    public static void assignment15(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap, 
                                    List<Contact> triggerOld, Map<Id,Contact> triggerOldMap){
    List<Account> accList = new List<Account>();
    if(triggerNew != null){
        for(Contact conn : triggerNew){
            if(conn.AccountId == null){
                Account acc = new Account();
                acc.Name = conn.LastName;
                accList.add(acc);
            }
        }
    }

    if(!accList.isEmpty()){
        insert accList;
    }

    Integer i = 0;

    for(Contact conn : triggerNew){
        if(conn.AccountId == null){
            conn.AccountId = accList[i].Id;
            i++;
        }
    }
}
    /* public static void assignment16(List<Contact> triggerNew, Map<Id, Contact> triggerNewMap, 
                                     List<Contact> triggerOld, Map<Id, Contact> triggerOldMap){
           Set<ID> accIdSet = new Set<Id>();
           for(Contact conn: triggerNew){
               if(conn.AccountId != null){
               accIdSet.add(conn.AccountId);
               }   
            }
           List<Account> accList = ([SELECT ID, Phone, Fax FROM Account WHERE Id IN: accIdSet]);
             For(Contact conn: triggerNew){
                 if(conn.AccountId == Null){
                     conn.Phone = Null;
                     conn.Fax = Null;
                 }
                 else {
                       for(Account acc: accLIst){
                        if(acc.phone != null && acc.fax !=null){
                        conn.phone = acc.Phone;
                        conn.fax = acc.Fax;
                        }
                       } 
                      }  
             }                                                                
  }*/

    public static void assignment16(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap, 
                                    List<Contact> triggerOld, Map<Id,Contact> triggerOldMap){
    Set<Id> accIdSet = new Set<Id>();

    if(triggerNew != null){
        for(Contact conn : triggerNew){
            if(conn.AccountId != null){
                accIdSet.add(conn.AccountId);
            }
        }
    }

    if(accIdSet.isEmpty()){ 
        return; 
    }

    List<Account> accList = ([SELECT Id, Phone, Fax FROM Account WHERE Id IN :accIdSet]);
    Map<Id,Account> accMap = new Map<Id,Account>(accList);

    for(Contact conn : triggerNew){
        if(conn.AccountId != null && accMap.containsKey(conn.AccountId)){
            Account acc = accMap.get(conn.AccountId);
            if(acc.Phone != null && acc.Fax != null){
                conn.Phone = acc.Phone;
                conn.Fax = acc.Fax;
            }
        }
    }
}
    
      /*public static void assignment26(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap,  
                                      List<Contact> triggerOld,Map<Id,Contact> triggerOldMap){
                
           Set<Id> accIdSet = new Set<Id>();
                if(triggerNew != Null){
                for(Contact conn : triggerNew){
                    if(conn.AccountId != null){
                       accIdSet.add(conn.AccountId);
                     }
                 }
                }
            if(triggerOld != Null){
            for(Contact conn : triggerOld){
               if(conn.AccountId != null){
                  accIdSet.add(conn.AccountId);
                   }
            }
            }
                    
           List<Account> accList = ([SELECT Id, Description FROM Account WHERE Id IN :accIdSet]);
           List<Contact> conList = ([SELECT Id, Name, AccountId, CreatedDate FROM Contact WHERE AccountId IN :accIdSet]);
                
              for(Account acc : accList){
                   acc.Description = '';
                    for(Contact con : conList){
                        if(con.AccountId == acc.Id){
                           acc.Description += con.Name + ' ' + con.CreatedDate;
                            System.debug(con.Name);
                         }
                     }
                 }
                
               if(!accList.isEmpty()){
                  update accList;
               }
                                          
 }*/
    
    public static void assignment26(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap, 
                                    List<Contact> triggerOld, Map<Id,Contact> triggerOldMap){
    Set<Id> accIdSet = new Set<Id>();

    if(triggerNew != null){
        for(Contact conn : triggerNew){
            if(conn.AccountId != null){
                accIdSet.add(conn.AccountId);
            }
        }
    }

    if(triggerOld != null){
        for(Contact conn : triggerOld){
            if(conn.AccountId != null){
                accIdSet.add(conn.AccountId);
            }
        }
    }

    if(accIdSet.isEmpty()){ 
        return; 
    }

    List<Account> accList = ([SELECT Id, Description FROM Account WHERE Id IN :accIdSet]);
    List<Contact> conList = ([SELECT Id, Name, AccountId, CreatedDate FROM Contact WHERE AccountId IN :accIdSet]);

    Map<Id,List<Contact>> conMap = new Map<Id,List<Contact>>();

    for(Contact con : conList){
        if(!conMap.containsKey(con.AccountId)){
            conMap.put(con.AccountId,new List<Contact>());
        }
        conMap.get(con.AccountId).add(con);
    }

    for(Account acc : accList){
        acc.Description = '';

        if(conMap.containsKey(acc.Id)){
            for(Contact con : conMap.get(acc.Id)){
                acc.Description += con.Name + ' ' + con.CreatedDate;
            }
        }
    }

    if(!accList.isEmpty()){
        update accList;
    }
}
    
  /*  public static void assignment29(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap,  
                                List<Contact> triggerOld, Map<Id,Contact> triggerOldMap){
                                          
            List<Account> accList2 = new List<Account>();
            List<Opportunity> oppList2 = new List<Opportunity>();
                                                  
            Set<Id> accIdSet = new Set<Id>();                                                                                 
            for(Contact conn : triggerNew){
                if(conn.AccountId != null){
                    accIdSet.add(conn.AccountId);
                } 
            } 
            List<Account> accList = ([SELECT Id, Description FROM Account WHERE Id IN :accIdSet]);
            List<Opportunity> oppList = ([SELECT Id, Amount, AccountId FROM Opportunity WHERE AccountId IN :accIdSet]);
                          
            for(Account acc : accList){ 
                Decimal totalAmount = 0;
                Boolean hasOpportunity = false;
                for(Opportunity opp : oppList){
                    if(opp.AccountId == acc.Id){
                        hasOpportunity = true;
                        if(opp.Amount != null){
                            totalAmount += opp.Amount;
                        }
                    }
                }
                
                acc.Description = String.valueOf(totalAmount);
                accList2.add(acc);
        
                if(!hasOpportunity){
                    Opportunity opp2 = new Opportunity();
                    opp2.AccountId = acc.Id;
                    opp2.Name = 'New Opportunity';
                    opp2.CloseDate = System.today() + 90;
                    opp2.StageName = 'Prospecting';
                    opp2.Amount = 100;
                    oppList2.add(opp2);
                }
            }
            if(!accList2.isEmpty()){
            update accList2;
            }
            
            if(!oppList2.isEmpty()){
                insert oppList2;
            }
 }  */ 
    
    public static void assignment29(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap, 
                                    List<Contact> triggerOld, Map<Id,Contact> triggerOldMap){
    List<Account> accList2 = new List<Account>();
    List<Opportunity> oppList2 = new List<Opportunity>();
    Set<Id> accIdSet = new Set<Id>();

    if(triggerNew != null){
        for(Contact conn : triggerNew){
            if(conn.AccountId != null){
                accIdSet.add(conn.AccountId);
            }
        }
    }

    if(accIdSet.isEmpty()){ 
        return; 
    }

    List<Account> accList = ([SELECT Id, Description FROM Account WHERE Id IN :accIdSet]);
    List<Opportunity> oppList = ([SELECT Id, Amount, AccountId FROM Opportunity WHERE AccountId IN :accIdSet]);

    Map<Id,Decimal> totalAmountMap = new Map<Id,Decimal>();
    Set<Id> accountWithOpportunitySet = new Set<Id>();

    for(Opportunity opp : oppList){
        accountWithOpportunitySet.add(opp.AccountId);

        if(!totalAmountMap.containsKey(opp.AccountId)){
            totalAmountMap.put(opp.AccountId,0);
        }

        if(opp.Amount != null){
            totalAmountMap.put(opp.AccountId,totalAmountMap.get(opp.AccountId) + opp.Amount);
        }
    }

    for(Account acc : accList){
        if(accountWithOpportunitySet.contains(acc.Id)){
            acc.Description = String.valueOf(totalAmountMap.get(acc.Id));
            accList2.add(acc);
        }else{
            Opportunity opp2 = new Opportunity();
            opp2.AccountId = acc.Id;
            opp2.Name = 'New Opportunity';
            opp2.CloseDate = System.today() + 90;
            opp2.StageName = 'Prospecting';
            opp2.Amount = 100;
            oppList2.add(opp2);
        }
    }

    if(!accList2.isEmpty()){
        update accList2;
    }

    if(!oppList2.isEmpty()){
        insert oppList2;
    }
 }

       public static void assignment35(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap,  
                                       List<Contact> triggerOld, Map<Id,Contact> triggerOldMap){
                                           
     Set<Id> accIdSet = new Set<Id>();                                
     for(Contact conn : triggerNew){   
        if(conn.AccountId != null && conn.Primary_Contact__c){ 
            accIdSet.add(conn.AccountId);    
        }     
    } 

    List<Contact> conList = ([SELECT Id, AccountId, Primary_Contact__c FROM Contact 
                              WHERE Primary_Contact__c = true AND AccountId IN :accIdSet]); 

    Map<Id, Contact> primaryConMap = new Map<Id, Contact>();

    for(Contact c : conList){
        primaryConMap.put(c.AccountId, c);
    }

    Set<Id> newPrimaryAccIdSet = new Set<Id>();

    for(Contact conn : triggerNew){   
        if(conn.AccountId != null && conn.Primary_Contact__c){

            if(primaryConMap.containsKey(conn.AccountId)){
                conn.Primary_Contact__c.addError('only one primary contact allowed');
            }
            else if(newPrimaryAccIdSet.contains(conn.AccountId)){
                conn.Primary_Contact__c.addError('only one primary contact allowed');
            }
            else{
                newPrimaryAccIdSet.add(conn.AccountId);
            }
        }   
    }                                           
  }
     public static void assignment36(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap,  
                                     List<Contact> triggerOld, Map<Id,Contact> triggerOldMap){
      Set<Id> accIdSet = new Set<Id>();
      Set<Id> connIdSet = new Set<Id>();                                  
      for(Contact conn: triggerNew){
          if(conn.AccountId != Null && conn.Primary_Contact__c){
            accIdSet.add(conn.AccountId);                                          
           } 
      }  
      for(Contact conn: triggerNew){
          if(conn.Id != Null){
           connIdSet.add(conn.Id);                                         
           } 
      }
      
     List<Contact> connList = ([Select Id, AccountId, Email, Phone From Contact 
                               Where AccountId IN : accIdSet And Id Not IN : connIdSet ]);
                                         
    /* Map<Id, Contact> connMap = new  Map<Id, Contact>();                                 
     for(Contact c: connList){
         if(!connMap.containsKey(c.AccountId)){
             connMap.put(c.AccountId, c);
         }                                   
     }----
      List<Contact> connList2 = new List<contact>();                                  
      for(contact conn: triggerNew){
            for(Contact c: connList){                                   //for(Id accId : connMap.Keyset()){
                                                                        //  contact c = connMap.get(accId);
              c.Phone = conn.Phone;
              c.Email = conn.Email;
              connList2.add(c);
          }                                            
      }*/
       Map<Id, List<Contact>> connMap = new  Map<Id, List<Contact>>(); 
         for(Contact c: connList){
         if(!connMap.containsKey(c.AccountId)){
             connMap.put(c.AccountId, connList);
         }                                   
     }  
              
       List<Contact> connList2 = new List<contact>(); 
                                         
        for(contact conn: triggerNew){
            for(Id accId : connMap.Keyset()){
            List<contact> cList = connMap.get(accId);
                for(contact c: cList){
                  c.Phone = conn.Phone;
                  c.Email = conn.Email;
                  connList2.add(c);
                } 
            }       
      }                                  
                                         
       if(!connList2.isEmpty()){
          update connList2;                                            
      }
 }
    
    public static void updateAccountContactCount(List<Contact> triggerNew, Map<Id,Contact> triggerNewMap, 
                                                 List<Contact> triggerOld, Map<Id,Contact> triggerOldMap) {
     List<Contact> contacts;

    if (triggerNew != null) {
        contacts = triggerNew;
    } else {
        contacts = triggerOld;
    }

                                                     
    AccountProcessor.onAfterSave(contacts);
}
}