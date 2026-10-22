public class StudentTriggerHelper {

    public static void lwcAssignment2Count(List<Studentlwc__c> triggerNew, Map<Id, Studentlwc__c> triggerNewMap, 
                                          List<Studentlwc__c> triggerOld, Map<Id, Studentlwc__c> triggerOldMap) {
    Set<Id> classIds = new Set<Id>();

    if(triggerNew != null){
        for(Studentlwc__c student : triggerNew){
            if(student.Class__c != null){
                classIds.add(student.Class__c);
            }
            if(triggerOldMap != null && triggerOldMap.containsKey(student.Id)){
                Studentlwc__c oldStudent = triggerOldMap.get(student.Id);
                if(student.Class__c != oldStudent.Class__c && oldStudent.Class__c != null){
                    classIds.add(oldStudent.Class__c);
                }
            }
        }
    }

    if(triggerNew == null && triggerOld != null){
        for(Studentlwc__c student : triggerOld){
            if(student.Class__c != null){
                classIds.add(student.Class__c);
            }
        }
    }

    Map<Id, Integer> countMap = new Map<Id, Integer>();
    for(AggregateResult ar : ([SELECT Class__c classId, COUNT(Id) total FROM Studentlwc__c 
                               WHERE Class__c IN :classIds GROUP BY Class__c])){
                                   
        countMap.put((Id) ar.get('classId'), (Integer) ar.get('total'));
    }

    List<Class__c> classesToUpdate = new List<Class__c>();
                                              
    for(Id classId : classIds){
        Integer count = countMap.containsKey(classId) ? countMap.get(classId) : 0;
        classesToUpdate.add(new Class__c(Id = classId, Number_Of_Students__c = count));
    }

    if(!classesToUpdate.isEmpty()){
        update classesToUpdate;
    }
}

    public static void lwcAssignment2Email(List<Studentlwc__c> triggerNew, Map<Id, Studentlwc__c> triggerNewMap, 
                                           List<Studentlwc__c> triggerOld, Map<Id, Studentlwc__c> triggerOldMap){

        List<Messaging.SingleEmailMessage> emails = new List<Messaging.SingleEmailMessage>();

        for(Studentlwc__c student : triggerNew){
            if (student.Email__c != null){
                
                Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();

                mail.setToAddresses(new String[] { student.Email__c });
                mail.setSubject('Student Record Created');
                mail.setPlainTextBody(student.Name +' ,your student record created.');

                emails.add(mail);
            }
        }

        if(!emails.isEmpty()){
            Messaging.sendEmail(emails);
        }
    }
}