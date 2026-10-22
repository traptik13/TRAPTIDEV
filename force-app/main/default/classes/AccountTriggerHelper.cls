public class AccountTriggerHelper {

       public static void addPrefixAsMr(List<Account> triggerNew, Map<Id,ACcount> triggerNewMap, 
                                        List<Account> triggerOld, Map<Id,ACcount> triggerOldMap){
        for(Account accObj : triggerNew){
            accObj.Name = 'Mr.'+ accObj.Name;
        }
    }
   
     public static void createContactByAccount(List<Account> triggerNew, Map<Id,Account> triggerNewMap, 
                                               List<Account> triggerOld, Map<Id,Account> triggerOldMap){
        Set<Id> accountIds = new Set<Id>();
        List<Contact> contactListToInsert = new List<Contact>();
        for(Account a : triggerNew){
            accountIds.add(a.Id);
        }
       
        List<Account> accList = [SELECT Id, Name FROM Account WHERE Id IN : accountIds];
        if(accList != Null){
            for(Account accObj : accList){
                Contact conObj = new Contact(LastName = 'ContactByAccount', AccountId = accObj.Id);
                contactListToInsert.add(conObj);
            }
            if(!contactListToInsert.isEmpty()){
                insert contactListToInsert;
            }
       }
    }


     public static void practice1Ownerchange(List<Account> triggerNew, Map<Id,ACcount> triggerNewMap, 
                                             List<Account> triggerOld, Map<Id,ACcount> triggerOldMap){
                                          
    Set<Id> accountIds = new Set<Id>();
    Map<Id, Id> accountOwnerMap = new Map<Id, Id>();

    // Step 1: Find Accounts whose Owner changed
    for (Account acc : triggerNew) {
        Account oldAcc = triggerOldMap.get(acc.Id);
         if (acc.OwnerId != oldAcc.OwnerId) {
          accountIds.add(acc.Id);
          accountOwnerMap.put(acc.Id, acc.OwnerId);
        }
    }
    // If no Account Owner changed, stop here
    if (accountIds.isEmpty()) {
        return;
    }
    // Step 2: Get Contacts belonging to those Accounts
    List<Contact> contactsToUpdate = [
        SELECT Id, AccountId, OwnerId
        FROM Contact
        WHERE AccountId IN :accountIds
    ];
    // Step 3: Change Contact Owner
    for (Contact con : contactsToUpdate) {

        con.OwnerId = accountOwnerMap.get(con.AccountId);
    }
    // Step 4: Update Contacts
    if (!contactsToUpdate.isEmpty()) {
        update contactsToUpdate;
    }
}

    public static void duplicateAccountNamebyMap(List<Account> triggerNew, Map<Id,Account> triggerNewMap, 
                                            List<Account> triggerOld, Map<Id,Account> triggerOldMap){
           
        Map<String,Account> duplicateMap = new Map<String,Account>();
        for(Account acc : [Select id, Name from Account]){  //not suitable method it will hit governor limits use set instead
            if(!duplicateMap.containsKey(acc.Name)){
                duplicateMap.put(acc.Name,acc);
            }
        }
    for(Account a:triggerNew){
        if(duplicateMap.containsKey(a.Name)){
            a.Name.addError('An Account with this name already exists.');
        }
    }  

    }
     public static void duplicateAccountNamebySet(List<Account> triggerNew, Map<Id,Account> triggerNewMap,
                                                  List<Account> triggerOld, Map<Id,Account> triggerOldMap){
     // Collect names of Accounts being inserted
        Set<String> accName = new Set<String>();         
           for(Account acc : triggerNew){
            if(accName != null){
                accName.add(acc.Name);
            }                                            
        }
      
    // Find only Accounts having these names                                                
     List<Account> accList = [SELECT Id, Name from Account where Name IN: accName]; 
     Set<String> accExisting = new Set<String>();
        for(Account a : accList){
         accExisting.add(a.Name);                                                
         }
          
    // Check new Accounts against existing Accounts
    for (Account acc : triggerNew) {
        if (accExisting.contains(acc.Name)) {
            acc.Name.addError('An Account with this name already exists.');
        }
    }                                            
  }
    
    public static void Helloworld(List<Account> triggerNew, Map<Id, Account> triggerNewMap, 
                                  List<Account> triggerOld, Map<Id, Account>triggerOldMap){
           for(Account acc: triggerNew){
               if(acc.Book__c != 'World'){
                   acc.Book__c = 'World';
               }                                        
            }    
    }
    
    public static void AccountDelete(List<Account> triggerNew, Map<Id, Account> triggerNewMap, 
                                     List<Account> triggerOld, Map<Id, Account>triggerOldMap) {
    for(Account acc: triggerOld){
        acc.adderror('You Cannot Delete the Account Record');
    }
    }
    
    public static void ContactsCreation(List<Account> triggerNew, Map<Id, Account> triggerNewMap, 
                                        List<Account> triggerOld, Map<Id, Account> triggerOldMap){
    List<contact> listContact = new List<contact>();    
    Map<Id,Decimal> mapAcc = new Map<Id,Decimal>();
    for(Account acc : triggerNew){
        mapAcc.put(acc.id,acc.Number_of_Locations__c);
    }

    if(mapAcc.size()>0 && mapAcc!=null){ // if(!mapAcc.isEmpty())
        for(Id acid : mapAcc.keyset()){
            for(Integer i=0; i < mapAcc.get(acid); i++){
                contact newContact = new contact();
                newContact.accountid = acid;
                newContact.lastname = 'contact' + i;
                listContact.add(newContact);
            }
        }
    }
    if(listContact.size()>0 && listContact!=null)
        insert listContact;
}

    public static void UpdateSalesRep(List<Account> triggerNew, Map<Id, Account> triggerNewMap, 
                                      List<Account> triggerOld, Map<Id, Account> triggerOldMap){    
    Set<Id> setAccOwner = new Set<Id>();
    for(Account Acc: triggerNew)  {
        setAccOwner.add(Acc.OwnerId);
    }
    Map<Id,User>User_map = new Map<Id,User>([select Name from User where id in:setAccOwner]);
    for(Account Acc: triggerNew){   
        User usr = User_map.get(Acc.OwnerId);
        Acc.Sales_Rep__c = usr.Name;
    }
}

    public static void assignment1(List<Account> triggerNew, Map<Id, Account> triggerNewMap,
                                   List<Account> triggerOld, Map<Id, Account> triggerOldMap){

    Set<String> accSet = new Set<String>();
     if(triggerNew != Null){  
       for (Account acc : triggerNew){
         if(acc.Name != null){
            accSet.add(acc.Name);
         }
       }
     }

    if(accSet.isEmpty()){
        return;
    }

    List<Account> accList = ([SELECT Name FROM Account WHERE Name IN :accSet]);

    Map<String, Account> accMap = new Map<String, Account>();

    for(Account a : accList){
        if(!accMap.containsKey(a.Name)){
            accMap.put(a.Name, a);
        }
    }

    for(Account acc : triggerNew){
        if(accMap.containsKey(acc.Name)){
            acc.Name.addError('You Cannot Create the Duplicate Account');
        }
    }
}
    /*public static void assignment1byList(List<Account> triggerNew, Map<Id, Account> triggerNewMap, 
                                           List<Account> triggerOld, Map<Id, Account> triggerOldMap){
           
            Set<String> accSet = new Set<String>();
                for(Account acc : triggerNew){
                    if(acc.Name != Null){
                        accSet.add(acc.Name);
                    }                        
                }
            
             if (accSet.isEmpty()){
              return;
            }
                                       
            List<Account> accExisting = ([SELECT Id, Name from Account WHERE Name In: accSet]);
                                       
                for(Account acc : triggerNew){
                    for(Account a: accExisting){
                        if(accSet.contains(a.Name)){
                            acc.Name.addError('Duplicate Account Name found');
                        }
                    }                           
                }                       
     }*/

    public static void assignment2(List<Account> triggerNew, Map<Id, Account> triggerNewMap, 
                                   List<Account> triggerOld, Map<Id, Account> triggerOldMap){
           for(Account acc : triggerNew){
            acc.Hello__c = 'World';                               
            }        
    }
 
    public static void assignment4(List<Account> triggerNew, Map<Id, Account> triggerNewMap, 
                                   List<Account> triggerOld, Map<Id, Account> triggerOldMap){
            for(Account acc : triggerOld){
                acc.addError('You cannot delete the account');          
                }                          
     }
     
      public static void assignment5(List<Account> triggerNew, Map<Id, Account> triggerNewMap,
                                   List<Account> triggerOld, Map<Id, Account> triggerOldMap){
                          
           List<Contact> conListtoInsert = new List<Contact>();                            
           for(Account acc: triggerNew){
              if(acc.Number_of_Locations__c != Null && acc.Number_of_Locations__c >0){
                 for(Integer i=1; i<=acc.Number_of_Locations__c; i++){
                    Contact con = new contact();{
                     con.accountid = acc.id;
                     con.LastName = 'Location'+i;
                     }
                     conListtoInsert.add(con);
                 }  
               }
            }
              if(!conListtoInsert.isEmpty()){
                      insert conListtoInsert;
              }
    }
    
    public static void assignment7(List<Account> triggerNew, Map<Id, Account> triggerNewMap,
                                   List<Account> triggerOld, Map<Id, Account> triggerOldMap){
           Set<Id> ownerSet = new Set<Id>();
           if(triggerNew != Null){                          
            for(Account acc: triggerNew){
               if(acc.OwnerId !=  Null){
                 ownerSet.add(acc.OwnerId);
            }                             
          }
        }      
            if(ownerSet.isEmpty()){
            return;
            }
                                       
           List<User> userList =([SELECT Name FROM User WHERE ID IN: ownerSet]);                       
               for(Account acc: triggerNew){
                   for(User u: UserList){
                       acc.Sales_Rep__c = u.Name;
                     }
                   }                           
                                      
       }
    
    /*public static void assignment14(List<Account> triggerNew, Map<Id, Account> triggerNewMap, 
                                    List<Account> triggerOld, Map<Id, Account> triggerOldMap){
                                        
           Set<Id> accIdSet = new Set<Id>();                             
              for(Account acc: triggerNew){
               if(acc.id != Null && acc.Is_Opp_Eligible_for_Close__c == true){
                   accIdSet.add(acc.id);
               }                              
              }
           List<Opportunity> oppList2 = new List<Opportunity>();  
           List<Opportunity> oppList = ([SELECT AccountId, StageName, Probability FROM Opportunity WHERE 
                                         Probability >=70 AND isClosed = false AND AccountId In: accIdSet ]);
                 for(Account acc: triggerNew){
                  for(Opportunity opp: OppList){
                      opp.StageName = 'Closed Won';
                      oppList2.add(opp);                        
                  }      
                }
               if(!oppList2.isEmpty()){                         
               update oppList2;
               }    
    }*/
    
    public static void assignment14(List<Account> triggerNew, Map<Id,Account> triggerNewMap, 
                                    List<Account> triggerOld, Map<Id,Account> triggerOldMap){
    Set<Id> accIdSet = new Set<Id>();

    if(triggerNew != null){
        for(Account acc : triggerNew){
            if(acc.Id != null && acc.Is_Opp_Eligible_for_Close__c == true){
                if(triggerOldMap == null || (triggerOldMap.containsKey(acc.Id) && triggerOldMap.get(acc.Id).Is_Opp_Eligible_for_Close__c == false)){
                    accIdSet.add(acc.Id);
                }
            }
        }
    }

    if(accIdSet.isEmpty()){ 
        return; 
    }

    List<Opportunity> oppList2 = new List<Opportunity>();
    List<Opportunity> oppList = ([SELECT Id, AccountId, StageName, Probability FROM Opportunity
                                  WHERE Probability >= 70 AND IsClosed = false AND AccountId IN :accIdSet]);

    for(Opportunity opp : oppList){
        opp.StageName = 'Closed Won';
        oppList2.add(opp);
    }

    if(!oppList2.isEmpty()){
        update oppList2;
    }
}
      
    public static void assignment19(List<Account> triggerNew, Map<Id, Account> triggerNewMap, 
                                    List<Account> triggerOld, Map<Id, Account> triggerOldMap){
            for(Account acc: triggerNew){
                if(acc.CopyBillingToShipping__c == true){
                  
                    acc.ShippingCountry = acc.BillingCountry;
                    acc.ShippingCountryCode = acc.BillingCountryCode;
                    acc.ShippingStreet = acc.BillingStreet;
                    acc.ShippingCity = acc.BillingCity;
                    acc.ShippingState = acc.BillingState;
                    acc.ShippingStateCode = acc.BillingStateCode;
                    acc.ShippingPostalCode = acc.BillingPostalCode;
                }
                                            
            }
        
    }
    
     /* public static void assignment28(List<Account> triggerNew, Map<Id, Account> triggerNewMap, 
                                      List<Account> triggerOld, Map<Id, Account> triggerOldMap){
                                          
          List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();                               
          Set<Id> accIdSet = new Set<Id>();                             
           For(Account acc: triggerNew){
               if(acc.id != null){
                   accIdSet.add(acc.id);
               }                                  
           } 
           
           List<Account> accList = ([Select Id, Name, LastModifiedDate, OwnerId From Account Where Id IN: accIdSet]);     
           List<Contact> conList = ([Select Id, LastName, AccountId, LastModifiedDate From Contact Where AccountId IN: accIdSet]);
   
                   For(Account acc1 : accList){
                    boolean isContact = False;
                       Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                       Messaging.SingleEmailMessage mail2 = new Messaging.SingleEmailMessage();
                  For(Contact con : conList){
                       
                      
                      if(con.AccountId == acc1.Id && con.LastModifiedDate > triggerOld[0].LastModifiedDate){
                           isContact = true; 
                      List<String> name = new List<String>();
                        name.add(con.LastName); 
                        system.debug(con.LastName);
                       
                        mail.setToAddresses(new String[] { acc1.ownerId });
                        mail.setSubject('Account Updated');
                        mail.setPlainTextBody('An Account has been Updated with the Following Contacts.\n'
                                               +'Account Name:' + acc1.Name +'\n'+ 
                                               +'Account Id:' + acc1.Id +'\n'+
                                               +'Contacts:' + name ); 
                        
                       emailsToSend.add(mail);   
                        system.debug(mail);  
                     
                          }
                      
                  
                      if(!isContact){
                      
                        mail2.setToAddresses(new String[] { acc1.ownerId });
                        mail2.setSubject('Account Updated');
                        mail2.setPlainTextBody('An Account has been Updated.\n'+
                                            +'Account Name:' + acc1.Name +'\n'+ 
                                            +'Account Id:' + acc1.Id +'\n');
                         
                       emailsToSend.add(mail2);   
                        system.debug(mail2);  
                     
                    } 
                  } 
                    
                   
                       // emailsToSend.add(mail);   
                        //system.debug(mail);  
                     
                        System.debug(acc1.ownerId);
                }
                  
               if(!emailsToSend.isEmpty()) {
                Messaging.sendEmail(emailsToSend);
                 
             }                       
  }*/
    
    public static void assignment28(List<Account> triggerNew, Map<Id,Account> triggerNewMap, 
                                    List<Account> triggerOld, Map<Id,Account> triggerOldMap){
    List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();
    Set<Id> accIdSet = new Set<Id>();

    if(triggerNew != null){
        for(Account acc : triggerNew){
            if(acc.Id != null){
                accIdSet.add(acc.Id);
            }
        }
    }

    if(accIdSet.isEmpty()){ 
        return; 
    }

    List<Account> accList = ([SELECT Id, Name, LastModifiedDate, OwnerId FROM Account WHERE Id IN :accIdSet]);
    List<Contact> conList = ([SELECT Id, LastName, AccountId, LastModifiedDate FROM Contact WHERE AccountId IN :accIdSet]);

    Map<Id,List<String>> contactNameMap = new Map<Id,List<String>>();

    for(Contact con : conList){
        if(con.AccountId != null && triggerOldMap.containsKey(con.AccountId)){
            Account oldAcc = triggerOldMap.get(con.AccountId);
            if(con.LastModifiedDate > oldAcc.LastModifiedDate){
                if(!contactNameMap.containsKey(con.AccountId)){
                    contactNameMap.put(con.AccountId,new List<String>());
                }
                contactNameMap.get(con.AccountId).add(con.LastName);
            }
        }
    }

    for(Account acc1 : accList){
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

        if(contactNameMap.containsKey(acc1.Id)){
            mail.setToAddresses(new String[] {acc1.OwnerId});
            mail.setSubject('Account Updated');
            mail.setPlainTextBody('An Account has been Updated with the Following Contacts.\n'+'Account Name:' + acc1.Name +'\n'+'Account Id:' + acc1.Id +'\n'+'Contacts:' + contactNameMap.get(acc1.Id));
        }else{
            mail.setToAddresses(new String[] {acc1.OwnerId});
            mail.setSubject('Account Updated');
            mail.setPlainTextBody('An Account has been Updated.\n'+'Account Name:' + acc1.Name +'\n'+'Account Id:' + acc1.Id +'\n');
        }

        emailsToSend.add(mail);
    }

    if(!emailsToSend.isEmpty()){
        Messaging.sendEmail(emailsToSend);
    }
}
    
    
}