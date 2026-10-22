public class CaseTriggerHelper {
    
    public static void assignment11(List<Case> triggerNew, Map<Id,Case> triggerNewMap, 
                                    List<Case> triggerOld, Map<Id,Case> triggerOldMap){
    Set<Id> accIdSet = new Set<Id>();
    List<Account> accList = new List<Account>();

    if(triggerNew != null){
        for(Case c : triggerNew){
            if(c.AccountId != null){
                accIdSet.add(c.AccountId);
            }
        }
    }

    if(triggerOld != null){
        for(Case c : triggerOld){
            if(c.AccountId != null){
                accIdSet.add(c.AccountId);
            }
        }
    }

    if(accIdSet.isEmpty()){ 
     return; 
    }

    for(Id accId : accIdSet){
        accList.add(new Account(Id = accId, Rating = 'Cold'));
    }

    Map<Id,Account> accountsToUpdateMap = new Map<Id,Account>(accList);

    List<AggregateResult> aggregateResults = ([SELECT AccountId, COUNT(Id) caseCount FROM Case 
                                              WHERE AccountId IN :accIdSet AND Status = 'Closed' GROUP BY AccountId]);

    for(AggregateResult ar : aggregateResults){
        Id accId = (Id)ar.get('AccountId');
        Integer count = (Integer)ar.get('caseCount');
        Account acc = accountsToUpdateMap.get(accId);

        if(count > 5){
            acc.Rating = 'Hot';
        }else if(count > 2){
            acc.Rating = 'Warm';
        }else{
            acc.Rating = 'Cold';
        }
    }

    if(!accountsToUpdateMap.isEmpty()){
        update accountsToUpdateMap.values();
    }
}


   /* public static void assignment11(List<Case> triggerNew, Map<Id,Case> triggerNewMap, 
                                    List<Case> triggerOld, Map<Id,Case> triggerOldMap){
        Set<ID> accIdSet = new Set<ID>();
        List<Account> accList = new List<Account>();
         
                                        
           if(triggerNew != Null){
             for(Case c : triggerNew){
               if(c.accountId != Null){
                 accIdSet.add(c.accountId);
                 }         
               }
            }
             if(triggerOld != Null){
             for(Case c : triggerOld){
               if(c.accountId != Null){
                 accIdSet.add(c.accountId);
                 }         
               }
            }
                                        
                 for(Account acc :([SELECT Id, Rating,(SELECT Id, CaseNumber FROM Cases Where status ='Closed' ) FROM Account WHERE Id IN: accIdSet])){
                   Integer count = acc.Cases.size();
                    
                    if(count > 5){
                         acc.Rating = 'Hot';                   
                    }
                    else if(count > 2){
                         acc.Rating = 'warm';                   
                    }
                    else{
                          acc.Rating = 'Cold';
                      }
                     accList.add(acc);
                 }  
                 if(!accList.isEmpty()){    
                 update accList;
                 }
    }*/
    
   /* public static void assignment12byList(List<Case> triggerNew, Map<Id,Case> triggerNewMap, 
                                    List<Case> triggerOld, Map<Id,Case> triggerOldMap){
        
        List<Account> accList = new List<Account>();   //not compatible for the bulkification
        List<Task> taskList = new List<Task>();
         Set<ID> accIdSet = new Set<ID>();
             for(Case c : triggerNew){
               if(c.accountId != Null){
                 accIdSet.add(c.accountId);
                 }         
               }
                  List<case> caseList = ([SELECT Id, AccountId, CaseNumber, CreatedDate FROM Case 
                                         Where AccountId IN: accIdSet order by CaseNumber desc]);
                  List<Account> accList2 = ([SELECT Id, Description FROM Account WHERE Id IN: accIdSet]);
                  for(Case c : caseList){                     
                  for(Account acc :accList2){
                     
                      acc.Description = 'caseNumber:'+' '+ c.CaseNumber+' '+'status:'+' '+c.Status;                     
                      
                      accList.add(acc);
                       
                  }                         
                      if(c.AccountId != Null){
                          Task newTask = new Task();
                          newTask.WhatId = c.AccountId;
                          newTask.Status = c.Status;
                          newTask.Subject = c.CaseNumber;
                          newTask.Priority = 'Normal';
                          newTask.ownerId = c.OwnerId;
                          taskList.add(newTask);
                         
                      }
                  }
                 
                  if(!accList.isEmpty()){                      
                  update accList;
                  }
                  if(!tasklist.isEmpty()){
                  insert tasklist;
                  }
         
   }*/
    
    public static void assignment12(List<Case> triggerNew, Map<Id,Case> triggerNewMap, 
                                    List<Case> triggerOld, Map<Id,Case> triggerOldMap){
    List<Account> accList = new List<Account>();
    List<Task> taskList = new List<Task>();
    Set<Id> accIdSet = new Set<Id>();

    if(triggerNew != null){
        for(Case c : triggerNew){
            if(c.AccountId != null){
                accIdSet.add(c.AccountId);
            }
        }
    }

    if(accIdSet.isEmpty()){ 
    return; 
    }

    List<Case> caseList = ([SELECT Id, AccountId, CaseNumber, Status, OwnerId, CreatedDate FROM Case 
                           WHERE AccountId IN :accIdSet ORDER BY CreatedDate DESC]);

    Map<Id,Case> caseMap = new Map<Id,Case>();

    for(Case c : caseList){
        if(!caseMap.containsKey(c.AccountId)){
            caseMap.put(c.AccountId,c);
        }
    }

    for(Id accId : caseMap.keySet()){
        Case c = caseMap.get(accId);
        Account acc = new Account(Id = accId, Description = c.CaseNumber + ' ' + c.Status);
        accList.add(acc);
    }

    for(Case c : triggerNew){
        if(c.AccountId != null){
            Task t = new Task();
            t.WhatId = c.AccountId;
            t.Subject = c.CaseNumber;
            t.Status = c.Status;
            t.Priority = 'Normal';
            t.OwnerId = c.OwnerId;
            taskList.add(t);
        }
    }

    if(!accList.isEmpty()){
        update accList;
    }

    if(!taskList.isEmpty()){
        insert taskList;
    }
}
    
   /* public static void assignment21byList(List<Case> triggerNew, Map<Id,Case> triggerNewMap, 
                                    List<Case> triggerOld, Map<Id,Case> triggerOldMap){
           Set<ID> accIdSet = new Set<ID>();               //not compatible for the bulkification              
           for(Case cs: triggerNew){
               if(cs.AccountId != Null){
                  accIdSet.add(cs.AccountId);
               }                           
            }
            List<Account> accList = new List<Account>();
           for(Case cs: triggerNew){
               for(Account acc: [SELECT Id, Latest_Case_Number__c FROM Account WHERE Id IN: accIdSet]){
                   acc.Latest_Case_Number__c = cs.CaseNumber;
                   accList.add(acc);
               }                            
           }
             if(!accList.isEmpty()){
              update accList;  
             }
    }*/
    
       
     /*public static void assignment21(List<Case> triggerNew, Map<Id,Case> triggerNewMap, 
                                          List<Case> triggerOld, Map<Id,Case> triggerOldMap){
        
        List<Account> accList = new List<Account>();

         Set<ID> accIdSet = new Set<ID>();
             for(Case c : triggerNew){
               if(c.accountId != Null){
                 accIdSet.add(c.accountId);
                 }         
               }
              
              List<case> caseList = ([SELECT Id, AccountId, CaseNumber, CreatedDate FROM Case 
                                      where AccountId IN: accIdSet order by CaseNumber desc]);
              Map<Id, string> Map1 = new  Map<Id, String>();
              for(Case c: caseList){
                 if(!Map1.containsKey(c.AccountId)){
                    Map1.put(c.AccountId, c.CaseNumber);
                 }                               
               }                          
               
               for(Id accId : Map1.keySet()){
              if(Map1.containsKey(accId)){
               Account acc = new Account( Id = accId, Latest_Case_Number__c = Map1.get(accId));     
               accList.add(acc);
               } 
            }     
                  if(!accList.isEmpty()){                                         
                  update accList; 
                  }
   }*/
    public static void assignment21(List<Case> triggerNew, Map<Id,Case> triggerNewMap, 
                                    List<Case> triggerOld, Map<Id,Case> triggerOldMap){
    List<Account> accList = new List<Account>();
    Set<Id> accIdSet = new Set<Id>();

    if(triggerNew != null){
        for(Case c : triggerNew){
            if(c.AccountId != null){
                accIdSet.add(c.AccountId);
            }
        }
    }

    if(accIdSet.isEmpty()){ 
     return; 
    }

    List<Case> caseList = ([SELECT Id, AccountId, CaseNumber, CreatedDate FROM Case
                           WHERE AccountId IN :accIdSet ORDER BY CaseNumber DESC]);

    Map<Id,String> Map1 = new Map<Id,String>();

    for(Case c : caseList){
        if(!Map1.containsKey(c.AccountId)){
            Map1.put(c.AccountId,c.CaseNumber);
        }
    }

    for(Id accId : Map1.keySet()){
        Account acc = new Account(Id = accId, Latest_Case_Number__c = Map1.get(accId));
        accList.add(acc);
    }

    if(!accList.isEmpty()){
        update accList;
    }
}
    
    /*public static void assignment24(List<Case> triggerNew, Map<Id,Case> triggerNewMap, 
                                    List<Case> triggerOld, Map<Id,Case> triggerOldMap){
          Set<ID> accIdSet = new Set<ID>();
                                      
           for(Case cs : triggerOld){
              if(cs.AccountId != null){
                  accIdSet.add(cs.AccountId);
               }
           }
            
          List<Account> accList = ([SELECT Id, Name, OwnerId, Owner.Email FROM Account WHERE Id IN: accIdSet]);
          List<Task> taskList = new List<Task>();
          List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();
              for(Case cs : triggerOld){
              for(Account acc: accList){
                  Task newTask = new Task();
                  newTask.WhatId = acc.id;
                  newTask.Status = 'Not Started';
                  newTask.Subject = 'Case is Deleted';
                  newTask.Priority ='Normal';
                  newTask.OwnerId = acc.OwnerId;
                  taskList.add(newTask);  
              
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(new String[] { acc.ownerId });
                mail.setSubject('Alert: Case Deleted from Account ' + acc.Name);
                mail.setPlainTextBody('Case is Deleted for your account and a follow-up task has been created for you');
                emailsToSend.add(mail);
              }
             }
                                        
                if(!taskList.isEmpty()){
                 insert taskList;
              }

              if(!emailsToSend.isEmpty()){
               Messaging.sendEmail(emailsToSend);
             }
    }*/
    
    public static void assignment24(List<Case> triggerNew, Map<Id,Case> triggerNewMap, 
                                    List<Case> triggerOld, Map<Id,Case> triggerOldMap){
    Set<Id> accIdSet = new Set<Id>();

    if(triggerOld != null){
        for(Case cs : triggerOld){
            if(cs.AccountId != null){
                accIdSet.add(cs.AccountId);
            }
        }
    }

    if(accIdSet.isEmpty()){ 
        return; 
    }

    List<Account> accList = ([SELECT Id, Name, OwnerId, Owner.Email FROM Account WHERE Id IN :accIdSet]);
    Map<Id,Account> accMap = new Map<Id,Account>(accList);
    List<Task> taskList = new List<Task>();
    List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();

    for(Case cs : triggerOld){
        if(cs.AccountId != null && accMap.containsKey(cs.AccountId)){
            Account acc = accMap.get(cs.AccountId);

            Task newTask = new Task();
            newTask.WhatId = acc.Id;
            newTask.Status = 'Not Started';
            newTask.Subject = 'Case is Deleted';
            newTask.Priority = 'Normal';
            newTask.OwnerId = acc.OwnerId;
            taskList.add(newTask);

            if(acc.Owner.Email != null){
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(new String[] {acc.Owner.Email});
                mail.setSubject('Alert: Case Deleted from Account ' + acc.Name);
                mail.setPlainTextBody('Case is Deleted for your account and a follow-up task has been created for you');
                emailsToSend.add(mail);
            }
        }
    }

    if(!taskList.isEmpty()){
        insert taskList;
    }

    if(!emailsToSend.isEmpty()){
        Messaging.sendEmail(emailsToSend);
    }
}
     /* public static void assignment25(List<Case> triggerNew, Map<Id,Case> triggerNewMap, 
                                      List<Case> triggerOld, Map<Id,Case> triggerOldMap){
                                          
           List<Contact> conList = ([SELECT id, Email from Contact]);
           List<Contact> conList2 = new List<Contact>();
           for(Case cs: triggerNew){
               boolean isMatched = false;
                 For(Contact conn : conList){
                   if(cs.SuppliedEmail == conn.email){
                       cs.ContactId = conn.id;
                       isMatched = true;
                   }
                 }    
                 if(!isMatched){
                       Contact newcon = new Contact();
                       newcon.LastName = 'case Contact';
                       newcon.Email = cs.SuppliedEmail;
                       conList2.add(newcon);
                     }
                 }
           
               if(!conList2.isEmpty()){
                     insert conList2;                           
               }
                                          
                 for(Case cs: triggerNew){
                    for(Integer i=0; i<conList2.size(); i++){
                        cs.ContactId = conList2[i].id;
                        
                    }                           
                }
}*/
    public static void assignment25(List<Case> triggerNew, Map<Id,Case> triggerNewMap, 
                                    List<Case> triggerOld, Map<Id,Case> triggerOldMap){
    Set<String> suppliedEmailSet = new Set<String>();
    List<Contact> conList2 = new List<Contact>();
    Map<String,Contact> conMap = new Map<String,Contact>();

    if(triggerNew != null){
        for(Case cs : triggerNew){
            if(cs.SuppliedEmail != null){
                suppliedEmailSet.add(cs.SuppliedEmail);
            }
        }
    }

    if(suppliedEmailSet.isEmpty()){ 
        return; 
    }

    List<Contact> conList = ([SELECT Id, Email FROM Contact WHERE Email IN :suppliedEmailSet]);

    for(Contact conn : conList){
        conMap.put(conn.Email,conn);
    }

    for(Case cs : triggerNew){
        if(cs.SuppliedEmail != null){
            if(conMap.containsKey(cs.SuppliedEmail)){
                cs.ContactId = conMap.get(cs.SuppliedEmail).Id;
            }
            else if(!conMap.containsKey(cs.SuppliedEmail)){
                Contact newcon = new Contact();
                newcon.LastName = 'case Contact';
                newcon.Email = cs.SuppliedEmail;
                conList2.add(newcon);
                conMap.put(cs.SuppliedEmail,newcon);
            }
        }
    }

    if(!conList2.isEmpty()){
        insert conList2;
    }

    for(Case cs : triggerNew){
        if(cs.SuppliedEmail != null && conMap.containsKey(cs.SuppliedEmail)){
            cs.ContactId = conMap.get(cs.SuppliedEmail).Id;
        }
    }
}
    
      public static void assignment34(List<Case> triggerNew, Map<Id,Case> triggerNewMap, 
                                      List<Case> triggerOld, Map<Id,Case> triggerOldMap){
       Set<Id> newIdSet = new Set<Id>(); 
       Set<Id> oldIdSet = new Set<Id>(); 
        for(case c: triggerNew){
            if(c.OwnerId != Null){
                newIdSet.add(c.OwnerId);
            }                                   
        }
        for(case c: triggerOld){
            if(c.OwnerId != Null){
                oldIdSet.add(c.OwnerId);
            }                                       
       }
        
        List<User> userList = ([Select Id, Name From user Where Id In: newIdSet]);
        List<User> userList2 = ([Select Id, Name From user Where Id In: oldIdSet]);
        
        Map<Id, String> nameMap = new Map<Id, String>();
        for(User u: userList){
            if(!nameMap.containskey(u.id)){
                nameMap.put(u.id, u.Name);
            }                                              
        } 
    
       Map<Id, String> nameOldMap = new Map<Id, String>();
        for(User u: userList2){
            if(!nameOldMap.containskey(u.id)){
                nameOldMap.put(u.id, u.Name);
            }                                              
        }  
        
          for(case c: triggerNew){
              for(Id userId: nameMap.keyset()){
               for(Id userOldId: nameOldMap.keyset()){
                c.Current_Owner__c = nameMap.get(userId);
                  c.Prior_Owner__c = nameOldMap.get(userOldId);    
           }
              }
          }



          /* 
            for(Id caseId: triggerNewMap.keyset()){
               case cs = triggerNewMap.get(caseId);
              for(Id oldId: triggerNewMap.keyset()){
                case c = triggerOldMap.get(OldId);
                cs.Current_Owner__c = cs.OwnerId;
                cs.Prior_Owner__c = c.OwnerId;
         }
         
       }    */  
   }
}