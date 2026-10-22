public class Contact_RelationshipHelper {

    public static void updateContactRelationshipNameByOwner(List<Contact_Relationship__c> triggerNew, Map<Id,Contact_Relationship__c> triggerNewMap, 
                                                            List<Contact_Relationship__c> triggerOld, Map<Id,Contact_Relationship__c> triggerOldMap){
        Set<Id> Idset = new Set<Id>();

        for(Contact_Relationship__c cr : triggerNew){
            if(cr.OwnerId != null){
                Idset.add(cr.OwnerId);
            }
        }

        List<User> u = ([SELECT Id, Name FROM User Where Id IN :Idset]);
        Map<Id, String> map_id_Name = new Map<Id, String>();

        for(User list_users : u){
            map_id_Name.put(list_users.Id, list_users.Name);}

        for(Contact_Relationship__c cr : triggerNew){
            if(cr.OwnerId != null){
                cr.Name = map_id_Name.get(cr.OwnerId);
            }
        }
    }
    
    public static void assignment9(List<Contact_Relationship__c> triggerNew, Map<Id,Contact_Relationship__c> triggerNewMap, 
                                   List<Contact_Relationship__c> triggerOld, Map<Id,Contact_Relationship__c> triggerOldMap){
           Set<Id> ownerSet = new Set<Id>();
           if(triggerNew != Null){                          
             for(Contact_Relationship__c conRel: triggerNew){
                if(conRel.OwnerId != Null){
                  ownerSet.add(conRel.OwnerId);
                }                                
             }
           }    
               
                                       
          if(ownerSet.isEmpty()){
          return;
         }
           List<User> userList = ([SELECT Name FROM User WHERE Id IN: ownerSet]);
               for(Contact_Relationship__c conRel: triggernew){
                   for(User u: userList){
                       conRel.Name = u.Name;
                    }   
               }
    }
}