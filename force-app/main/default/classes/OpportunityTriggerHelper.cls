public class OpportunityTriggerHelper {

    public static void opportunityTeamInsert(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                             List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap){
      List<OpportunityShare>  oppShareList = new List<OpportunityShare>();
      List<OpportunityTeamMember>  oppTeamList = new List<OpportunityTeamMember>();
           
      OpportunityShare oppShare = new OpportunityShare();
          oppShare.OpportunityId = triggerNew[0].Id;
          oppShare.OpportunityAccessLevel = 'edit';
          oppShare.UserOrGroupId = triggerNew[0].CreatedbyId;
          oppShareList.add(oppshare);
          
              
      OpportunityTeamMember oppTeam = new  OpportunityTeamMember();
          oppTeam.OpportunityId = triggerNew[0].Id;
          oppTeam.UserId = triggerNew[0].OwnerId;
          oppTeam.TeamMemberRole = 'Account Manager';
          oppTeamList.add(oppTeam);    
              
      if(oppTeamList!=null && oppTeamList.size()>0){
        insert oppTeamList;
       }
                                                 
      if(oppShareList!=null && oppShareList.size()>0){
        list<Database.SaveResult> sr = Database.insert(oppShareList,false);
      }
                                           
  }
    
    public static void UpdateATMwithOwneronOptyCreate(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                                      List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap) {
  
  List<AccountShare> list_share = new List<AccountShare>();
  List<AccountTeamMember> list_atm = new List<AccountTeamMember>();
                                                          
  for (Opportunity opp : triggerNew) {
    if (opp.Probability == 20) {
      AccountTeamMember atm = new AccountTeamMember();
      atm.accountid = opp.accountid;
      atm.teamMemberRole = 'Account Manager';
      atm.UserId = opp.Ownerid;
        
      AccountShare share = new AccountShare();
      share.AccountId = opp.Accountid;
      share.UserOrGroupId = opp.OwnerId;
      share.AccountAccessLevel = 'Read/Write';
      share.OpportunityAccessLevel = 'Read Only';
      share.CaseAccessLevel = 'Read Only';
        
      list_atm.add(atm);
      list_share.add(share);
    }
  }
  if (list_atm != null)
    insert list_atm;
                                                          
  if (list_share != null && list_share.size() > 0)
    List<Database.saveresult> sr = Database.insert(list_share, false);

}

    public static void assignment18(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                    List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap){
      if(triggerNew != Null){                        
           for(Opportunity opp: triggerNew){
               if(opp.Amount != null && opp.Amount > 100000){
                   opp.Description = 'Hot Opportunity';
               }                              
           }
      }     
        
    }
    
    /*
     public static void assignment22(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap){
    
    Set<Id> accIdSet = new Set<Id>();

    for(Opportunity opp : triggerNew){
        if(opp.AccountId != null){
            accIdSet.add(opp.AccountId);
        }
    }
    List<Opportunity> oppList = ([SELECT Id, AccountId, Amount, CreatedDate FROM Opportunity 
                                 WHERE AccountId IN :accIdSet ORDER BY Id DESC]);

    Map<Id,Opportunity> oppMap = new Map<Id,Opportunity>();

    for(Opportunity opp : oppList){
        if(!oppMap.containsKey(opp.AccountId)){
            oppMap.put(opp.AccountId,opp);
        }
    }

    List<Account> accList = new List<Account>();

    for(Id accId : oppMap.keySet()){
        Opportunity opp = oppMap.get(accId);
        Account acc = new Account(Id = accId, Recent_Opportunity_Amount__c = opp.Amount);
        accList.add(acc);
    }

    if(!accList.isEmpty()){
        update accList;
    }
}*/
    
    public static void assignment22(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                    List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap){
    Set<Id> accIdSet = new Set<Id>();

    if(triggerNew != null){
        for(Opportunity opp : triggerNew){
            if(opp.AccountId != null){
                accIdSet.add(opp.AccountId);
            }
        }
    }

    if(accIdSet.isEmpty()){ 
        return; 
    }

    List<Opportunity> oppList = ([SELECT Id, AccountId, Amount FROM Opportunity 
                                  WHERE AccountId IN :accIdSet ORDER BY ID DESC]);

    Map<Id,Opportunity> oppMap = new Map<Id,Opportunity>();

    for(Opportunity opp : oppList){
        if(!oppMap.containsKey(opp.AccountId)){
            oppMap.put(opp.AccountId,opp);
        }
    }

    List<Account> accList = new List<Account>();

    for(Id accId : oppMap.keySet()){
        Opportunity opp = oppMap.get(accId);
        Account acc = new Account(Id = accId, Recent_Opportunity_Amount__c = opp.Amount);
        accList.add(acc);
    }

    if(!accList.isEmpty()){
        update accList;
    }
}
    
    /* public static void assignment23(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                    List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap){
           Set<ID> accIdSet = new Set<ID>();
           Set<ID> oppIdSet = new Set<ID>();
          if(triggerOLd != Null){                             
          for(Opportunity opp: triggerOLd){
              if(opp.AccountId != null){
                  accIdSet.add(opp.AccountId);
              }
              if(opp.id != null){
                  oppIdSet.add(opp.id);
              }
          }
          }    
           List<Task> taskList2 = new List<Task>();
                                        
           List<Opportunity> oppList = ([SELECT Id, AccountId FROM Opportunity WHERE AccountId IN: accIdSet AND Id NOT IN: oppIdSet]);
           List<Task> taskList = ([SELECT Id, WhatId FROM Task WHERE WhatId IN: oppIdSet]);
                                        
                  System.debug(tasklist);                      
                    for(Task t: taskList){
                    if(!oppList.isempty()){
                        t.WhatId = oppList[0].id;
                        taskList2.add(t);
                        system.debug(oppList[0].id);
                        system.debug(t.WhatId);
                    }
                 else {
                        
                         taskList2.add(t);                          
                             
                    }
                 
       }
                   if(!taskList2.isEmpty()){
                   update taskList2;
                   }
                 
}*/
    
    public static void assignment23(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                    List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap){
    Set<Id> accIdSet = new Set<Id>();
    Set<Id> oppIdSet = new Set<Id>();

    if(triggerOld != null){
        for(Opportunity opp : triggerOld){
            if(opp.AccountId != null){
                accIdSet.add(opp.AccountId);
            }
            if(opp.Id != null){
                oppIdSet.add(opp.Id);
            }
        }
    }

    if(accIdSet.isEmpty()){ 
        return; 
    }

    List<Task> taskList2 = new List<Task>();
    List<Task> taskListToDelete = new List<Task>();

    List<Opportunity> oppList = ([SELECT Id, AccountId FROM Opportunity 
                                 WHERE AccountId IN :accIdSet AND Id NOT IN :oppIdSet]);
    List<Task> taskList = ([SELECT Id, WhatId FROM Task WHERE WhatId IN :oppIdSet]);

    Map<Id,Id> accountOppMap = new Map<Id,Id>();

    for(Opportunity opp : oppList){
        if(!accountOppMap.containsKey(opp.AccountId)){
            accountOppMap.put(opp.AccountId,opp.Id);
        }
    }

    Map<Id,Id> deletedOppAccountMap = new Map<Id,Id>();

    for(Opportunity opp : triggerOld){
        if(opp.Id != null && opp.AccountId != null){
            deletedOppAccountMap.put(opp.Id,opp.AccountId);
        }
    }

    for(Task t : taskList){
        Id accId = deletedOppAccountMap.get(t.WhatId);

        if(accountOppMap.containsKey(accId)){
            t.WhatId = accountOppMap.get(accId);
            taskList2.add(t);
        }
        else{
            taskListToDelete.add(t);
        }
    }

    if(!taskList2.isEmpty()){
        update taskList2;
    }

    if(!taskListToDelete.isEmpty()){
        delete taskListToDelete;
    }
}
    
      /*public static void assignment27(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                      List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap, boolean isNew){
                                          
            List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();
            if(triggerNew != Null){
             for(Opportunity opp: triggerNew){
                if(Opp.Amount > 10000){
                  
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                mail.setToAddresses(new String[] { opp.ownerId });
                mail.setSubject('Opportunity Created and Updated');
                mail.setPlainTextBody('An Opportunity is inserted with an amount greater 10000.\n'+
                                       +'Opp Id:' + opp.Id +'\n'+ 
                                      +'Amount:' + opp.amount); 
                if(!isNew){ 
                mail.setPlainTextBody('An Opportunity is Updated with an amount greater 10000.\n'+
                                       +'Opp Id:' + opp.Id +'\n'+ 
                                      +'Amount:' + opp.amount);
                
                }   
                  emailsToSend.add(mail);
                }                                
             }
            }    
              if(!emailsToSend.isEmpty()) {
               Messaging.sendEmail(emailsToSend);
             }
            --------                              
            /* List<Messaging.SingleEmailMessage> emailsToSend2 = new List<Messaging.SingleEmailMessage>(); 
               if(triggerOld != Null){                            
              for(Opportunity opp: triggerOld){
                if(Opp.Amount > 10000){
                  
                Messaging.SingleEmailMessage mail2 = new Messaging.SingleEmailMessage();
                mail2.setToAddresses(new String[] { opp.ownerId });
                mail2.setSubject('Opportunity Created and Updated');
                mail2.setPlainTextBody('An Opportunity is Updated with an amount greater 10000.\n'+
                                       +'Opp Id:' + opp.Id +'\n'+ 
                                      +'Amount:' + opp.amount);
                emailsToSend2.add(mail2);
                }
              }
            }
             
               if(!emailsToSend.isEmpty()) {
               Messaging.sendEmail(emailsToSend2);
             }                                     
}*/
    
    public static void assignment27(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                    List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap, boolean isNew){
    List<Messaging.SingleEmailMessage> emailsToSend = new List<Messaging.SingleEmailMessage>();

    if(triggerNew != null){
        for(Opportunity opp : triggerNew){
            if(opp.Amount != null && opp.Amount > 10000){
                if(isNew || (triggerOldMap != null && triggerOldMap.containsKey(opp.Id) && 
                   (triggerOldMap.get(opp.Id).Amount == null || triggerOldMap.get(opp.Id).Amount <= 10000))){
                    Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
                    mail.setToAddresses(new String[] {opp.OwnerId});

                    if(isNew){
                        mail.setSubject('Opportunity Created and Updated');
                        mail.setPlainTextBody('An Opportunity is inserted with an amount greater 10000.\n'+'Opp Id:' + opp.Id +'\n'+'Amount:' + opp.Amount);
                    }else{
                        mail.setSubject('Opportunity Created and Updated');
                        mail.setPlainTextBody('An Opportunity is Updated with an amount greater 10000.\n'+'Opp Id:' + opp.Id +'\n'+'Amount:' + opp.Amount);
                    }

                    emailsToSend.add(mail);
                }
            }
        }
    }

    if(!emailsToSend.isEmpty()){
        Messaging.sendEmail(emailsToSend);
    }
}
       public static void assignment37(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                        List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap){
         
        Set<Id> accIdSet = new Set<Id>();
        if(triggerNew != Null){
        for(Opportunity opp: triggerNew){
            if(opp.AccountId != Null){
                accIdSet.add(opp.AccountId);
            }                                     
        }
        }
        if(triggerOld != Null){
        for(Opportunity opp: triggerOld){
            if(opp.AccountId != Null){
                accIdSet.add(opp.AccountId);
            }                                     
        }
        }     
          
        List<Opportunity> oppList = ([Select Id, AccountId, Amount from Opportunity 
                                     Where AccountId IN: accIdSet And StageName ='Closed Won']);  
                                            
        Map<Id, List<Opportunity>> amtMap = new Map<Id, List<Opportunity>>();
        
        for(Opportunity opp: oppList){
            if(!amtMap.containsKey(opp.AccountId)){
                amtMap.put(opp.AccountId, new List<Opportunity>());
            }
            amtMap.get(opp.AccountId).add(opp);
        }
        
        List<Account> accList2 = new List<Account>();
                                            
        for(Id accId: accIdSet){
            decimal totalamount = 0;    
            if(amtMap.containsKey(accId)){  
                List<Opportunity> oppList2 = amtMap.get(accId);
                for(Opportunity opp1: oppList2){
                    if(opp1.Amount != Null){
                        totalamount = totalamount + opp1.Amount;
                    }
                }
                
                Account acc = new Account(Id=accId, Amount__c=totalamount);
                accList2.add(acc);    
            }
            else{
                Account acc = new Account(Id=accId, Amount__c=500);
                accList2.add(acc);
            }   
        }
                                            
        if(!accList2.isEmpty()){
            update accList2;                              
        }
}     
    
     public static void assignment38(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                        List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap){
                                            
         Set<Id> accIdSet = new Set<Id>();
        if(triggerNew != Null){                                 
        for(Opportunity opp: triggerNew){
            if(opp.AccountId != Null){
                accIdSet.add(opp.AccountId);
            }                                     
        }
        }
        if(triggerOld != Null){                                    
        for(Opportunity opp: triggerOld){
            if(opp.AccountId != Null){
                accIdSet.add(opp.AccountId);
            }                                     
        }
        }     
                                            
        List<Account> accList = ([Select Id, Amount__c, (select Id, AccountId, Amount from Opportunities where stageName ='Closed Won') 
                                 from Account Where Id IN:accIdSet]);
                                          
        List<Account> accList2 = new List<Account>();    
                                            
        for(Account acc: accList){
            decimal totalamount = 0;
            List<opportunity> oppList = acc.opportunities;
            for(opportunity opp: oppList){ 
                if(opp.Amount != Null){
                    totalamount = totalamount + opp.Amount;
                }
            }
            
            if(totalamount == 0){
                acc.Amount__c = 500;
            }
            else{
                acc.Amount__c = totalamount;
            }
            
            accList2.add(acc);
        }
                                            
        if(!accList2.isEmpty()){
            update accList2;
        }
    }
    
    public static void assignment(List<Opportunity> triggerNew, Map<Id,Opportunity> triggerNewMap, 
                                    List<Opportunity> triggerOld, Map<Id,Opportunity> triggerOldMap){
     
      Set<ID> accIdSet = new Set<ID>();
        if(triggerNew != Null){
            for(opportunity opp: triggerNew){
                if(opp.AccountId != Null){
                    accIdSet.add(opp.AccountId);
                }
            }
        }    
         if(triggerOld != Null){
            for(opportunity opp: triggerOld){
                if(opp.AccountId != Null){
                    accIdSet.add(opp.AccountId);
                }
            }
        } 
          if(accIdSet.IsEmpty()){
            return;                                
           }                           
                                        
        List<AggregateResult> result =([SELECT AccountId, MAX(Amount) MaximumAmount FROM Opportunity 
                                        WHERE AccountId IN:accIdSet
                                        GROUP BY AccountId
                                   ]);                        
        Map<Id, Decimal> accMap = new Map<Id, Decimal>();
          
         for(AggregateResult ar: result){
            Id accId = (Id)ar.get('AccountId');
            Decimal max = (Decimal)ar.get('MaximumAmount');
             if(!accMap.containsKey(accId)){
                 accMap.put(accId, Max);
             }
         }
        List<Account> accListToInsert = new List<Account>();
        List<Account> accList = ([SELECT Maximum_Amount__C FROM Account WHERE Id IN: accIdSet]);
            
                 for(Account acc: accList){
                   acc.Maximum_Amount__c = accMap.get(acc.Id);
                    accListToInsert.add(acc);
                }
                                    
          if(!accListToInsert.IsEmpty()){
             update accListToInsert;                               
          }                    
                                    
                                    
                                    
                                    
                                    
   }
}