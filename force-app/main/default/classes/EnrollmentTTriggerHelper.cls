public class EnrollmentTTriggerHelper{
  
    public static void assignment31(List<EnrollmentT__c> triggerNew, Map<Id,EnrollmentT__c> triggerNewMap, 
                                    List<EnrollmentT__c> triggerOld, Map<Id,EnrollmentT__c> triggerOldMap){
      
     Set<Id> idSet = new Set<Id>();
     if(triggerNew != Null){
     for(EnrollmentT__c en : triggerNew){
         if(en.Student_Name__c != null){
             idSet.add(en.Student_Name__c);
         }
     }
     }    
     if(triggerOld != Null){
     for(EnrollmentT__c en : triggerOld){
         if(en.Student_Name__c != null){
             idSet.add(en.Student_Name__c);
         }
     }
     }    
                                
      List<EnrollmentT__c> enList = ([Select Id, Name, Student_Name__c, Training_Name__r.Fees__c From EnrollmentT__c
                                      Where Student_Name__c IN :idSet]);    
                                        
      //List<StudentT__c> stList2 = new List<StudentT__c>();
                                        
     //Map<Id,EnrollmentT__c > enMap = new Map<Id, EnrollmentT__c>([Select Id, Name, Student_Name__r.Total_fees__c, Training_Name__r.fees__c From EnrollmentT__c  where id In: idSet2]);                                 
     // Map<Id, StudentT__c> stMap = new Map<Id, StudentT__c>([Select Id, Name, Total_fees__c, (Select Id, Student_Name__c from Enrollments__r)  
                                                           // From StudentT__c where id In: idSet2]);
     // Map<Id, Training__c> trMap = new Map<Id, Training__c> ([Select Id, Name, Fees__c, (Select Id, Training_Name__c from Enrollments__r) 
                                                             // From Training__c where id In: idSet]);
      //    system.debug(enMap);
    Map<Id, Decimal> studentTotalMap = new Map<Id, Decimal>();
     for(EnrollmentT__c en : enList){
        Decimal fee = en.Training_Name__r.Fees__c;
         if(Fee != Null){
         if(!studentTotalMap.containsKey(en.Student_Name__c)){
            studentTotalMap.put(en.Student_Name__c,fee);
       }  
      
        else{
           studentTotalMap.put(en.Student_Name__c, studentTotalMap.get(en.Student_Name__c) + fee);
        }
        }    
    }
                                        
      List<StudentT__c> stList = new  List<StudentT__c>();
   
        for(Id stId : studentTotalMap.keySet()){
        if(studentTotalMap.containsKey(stId)){
            StudentT__c s = new StudentT__c( Id = stId, Total_Fees__c = studentTotalMap.get(stId)  );     
            stList.add(s);
        } 
    }

    if(!stList.isEmpty()){
    update stList;
    }
}
                                      
        /* for(EnrollmentT__c en3: enMap){
              decimal totalFees = 0;
             for(StudentT__c st: stMap){
                 totalFees = totalFees + enMap.get(en3.Fees__c);
                 st.Total_fees__c = totalFees;
                 stList2.add(st);
             }
         }
 
           if(!stList2.isEmpty()){
                update stList2;                           
              }                           
    }*/

     public static void assignment31byList(List<EnrollmentT__c> triggerNew, Map<Id, EnrollmentT__c> triggerNewMap,
                                           List<EnrollmentT__c> triggerOld, Map<Id, EnrollmentT__c> triggerOldMap){
                                               
    Set<Id> IdSet = new Set<Id>();
     if(triggerNew != null){
        for(EnrollmentT__c en : triggerNew){
            if(en.Student_Name__c != null){
                IdSet.add(en.Student_Name__c);
            }
        }
    }

     if(triggerOld != null){
        for(EnrollmentT__c en : triggerOld){
            if(en.Student_Name__c != null){
                IdSet.add(en.Student_Name__c);
            }
        }
    }

   
    List<StudentT__c> stList = ([SELECT Id, Name, Total_Fees__c FROM StudentT__c WHERE Id IN :IdSet]);
    List<EnrollmentT__c> enList = ([SELECT Id, Student_Name__c, Training_Name__c FROM EnrollmentT__c
                                    WHERE Student_Name__c IN :IdSet]);
    
    Set<Id> IdSet2 = new Set<Id>();
     for(EnrollmentT__c en : enList){
        if(en.Training_Name__c != null){
            IdSet2.add(en.Training_Name__c);
        }
    }
    List<Training__c> trList = ([SELECT Id, Name, Fees__c FROM Training__c WHERE Id IN :IdSet2]);

    List<StudentT__c> stList2 = new List<StudentT__c>();

     for(StudentT__c st : stList){
        Decimal totalFees = 0;
        for(EnrollmentT__c en : enList){
            if(en.Student_Name__c == st.Id){
                for(Training__c tr : trList){
                    if(en.Training_Name__c == tr.Id){
                        if(tr.Fees__c != null){
                            totalFees = totalFees + tr.Fees__c;
                        }
                   }
               }
           }
        }

        st.Total_Fees__c = totalFees;
        stList2.add(st);
    }
                                               
     if(!stList2.isEmpty()){
        update stList2;
     }
}
}