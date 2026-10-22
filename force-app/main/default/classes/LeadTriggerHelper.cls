public class LeadTriggerHelper {

    public static void prefixDoctor(List<Lead> triggerNew, Map<id,Lead> triggerNewMap, 
                                    List<Lead> triggerOld, Map<id,Lead> triggerOldMap) {
           List<Lead> leadList = triggernew;
           For(Lead l : leadList){
              if(l.firstName!=null && !l.FirstName.Contains('Dr.')){
               l.FirstName = 'Dr.'+ l.Firstname;                           
              }
          }        
           
    }
    
      public static void assignment3(List<Lead> triggerNew, Map<id,Lead> triggerNewMap, 
                                    List<Lead> triggerOld, Map<id,Lead> triggerOldMap){
           For(Lead l : triggerNew){
             if(l.Salutation == null || l.Salutation != 'Dr.'){
              l.Salutation = 'Dr.';
              } 
           }

  } 
    
    
    
    /* public static void assignment17(List<Lead> triggerNew, Map<id,Lead> triggerNewMap, 
                                    List<Lead> triggerOld, Map<id,Lead> triggerOldMap) {
       List<Contact> conList = ([SELECT Email from Contact]);
            for(Lead l: triggerNew){
               For(Contact conn : conList){
                   if(l.email == conn.email){
                       l.email.addError('email is already existed in contacts');
                   }
                }
            }                        
       }*/
    public static void assignment17(List<Lead> triggerNew, Map<Id,Lead> triggerNewMap, 
                                    List<Lead> triggerOld, Map<Id,Lead> triggerOldMap){
    Set<String> emailSet = new Set<String>();

    if(triggerNew != null){
        for(Lead l : triggerNew){
            if(l.Email != null){
                emailSet.add(l.Email);
            }
        }
    }

    if(emailSet.isEmpty()){ 
        return; 
    }

    List<Contact> conList = ([SELECT Id, Email FROM Contact WHERE Email IN :emailSet]);
    Set<String> contactEmailSet = new Set<String>();

    for(Contact conn : conList){
        if(conn.Email != null){
            contactEmailSet.add(conn.Email);
        }
    }

    Set<String> leadEmailSet = new Set<String>();

    for(Lead l : triggerNew){
        if(l.Email != null){
            if(contactEmailSet.contains(l.Email)){
                l.Email.addError('email is already existed in contacts');
            }else if(leadEmailSet.contains(l.Email)){
                l.Email.addError('email is already existed in leads');
            }else{
                leadEmailSet.add(l.Email);
            }
        }
    }
}
    
    
    
}