public class Candidate2Helper {

   public static void assignment30(List<Candidate2__c> triggerNew, Map<Id,Candidate2__c> triggerNewMap, 
                                   List<Candidate2__c> triggerOld, Map<Id,Candidate2__c> triggerOldMap){
                                         
    List<Candidate_Skill__c> canSkillList = new List<Candidate_Skill__c>();     
    List<Skill__c> skillList2 = new List< Skill__c>();   
                                         
    Set<String> skillSet = new Set<String>();                                   
     for(Candidate2__c can: triggerNew){
         if(can.Skill__c != Null){
            skillSet.add(can.Skill__c); 
         }
     }
         
      List<Skill__c> skillList = ([SELECT Id, Name FROM Skill__c WHERE Name IN: skillSet]);
       for (Candidate2__c can: triggerNew){
            if(!skillList.isempty()){
           for (Skill__c sk: skillList ){
              
               if(can.Skill__c == sk.Name){
                   Candidate_Skill__c newcanSkill = new Candidate_Skill__c();
                   newcanSkill.candidate_Name__c = can.Id;
                   newcanSkill.Skill_Name__c = sk.Id;
                   canSkillList.add(newcanSkill);
                   System.debug(can.Skill__c);
                   System.debug(sk.Name);
               }
           }
            }
            
                if(skillList.isempty()){
                    Skill__c newSkill = new Skill__c();
                    newSkill.Name = can.Skill__c;
                    skillList2.add(newSkill);
                    system.debug(skillList2);
             }     
           
       }
     
                  if(!skillList2.isEmpty()){
                    insert skillList2;
                  }
                                         
                  for(Candidate2__c can: triggerNew){
                      for(Skill__c sk1: skillList2){
                          Candidate_Skill__c newcanSkill = new Candidate_Skill__c();
                           newcanSkill.candidate_Name__c = can.Id;
                           newcanSkill.Skill_Name__c = sk1.Id;
                           canSkillList.add(newcanSkill);
                           system.debug(newcanSkill); 
                      }                       
                  }                         
                                         
                  
                  if(!canSkillList.isEmpty()){
                    insert canSkillList;
                  }
                                         
   }
    
    /*public static void assignment30(List<Candidate2__c> triggerNew, Map<Id,Candidate2__c> triggerNewMap, 
                                        List<Candidate2__c> triggerOld, Map<Id,Candidate2__c> triggerOldMap){
    List<Candidate_Skill__c> canSkillList = new List<Candidate_Skill__c>();
    List<Skill__c> skillList2 = new List<Skill__c>();
    Set<String> skillSet = new Set<String>();

    if(triggerNew != null){
        for(Candidate2__c can : triggerNew){
            if(can.Skill__c != null){
                for(String skill : can.Skill__c.split(',')){
                    if(skill.trim() != ''){
                        skillSet.add(skill.trim());
                    }
                }
            }
        }
    }

    if(skillSet.isEmpty()){ 
        return; 
    }

    List<Skill__c> skillList = ([SELECT Id, Name FROM Skill__c WHERE Name IN :skillSet]);
    Map<String,Id> skillMap = new Map<String,Id>();

    for(Skill__c sk : skillList){
        skillMap.put(sk.Name,sk.Id);
    }

    Set<String> newSkillSet = new Set<String>();

    for(Candidate2__c can : triggerNew){
        if(can.Skill__c != null){
            for(String skill : can.Skill__c.split(',')){
                String skillName = skill.trim();

                if(skillName != ''){
                    if(!skillMap.containsKey(skillName) && !newSkillSet.contains(skillName)){
                        Skill__c newSkill = new Skill__c();
                        newSkill.Name = skillName;
                        skillList2.add(newSkill);
                        newSkillSet.add(skillName);
                    }
                }
            }
        }
    }

    if(!skillList2.isEmpty()){
        insert skillList2;
    }

    for(Skill__c sk : skillList2){
        skillMap.put(sk.Name,sk.Id);
    }

    for(Candidate2__c can : triggerNew){
        if(can.Skill__c != null){
            for(String skill : can.Skill__c.split(',')){
                String skillName = skill.trim();

                if(skillName != '' && skillMap.containsKey(skillName)){
                    Candidate_Skill__c newcanSkill = new Candidate_Skill__c();
                    newcanSkill.candidate_Name__c = can.Id;
                    newcanSkill.Skill_Name__c = skillMap.get(skillName);
                    canSkillList.add(newcanSkill);
                }
            }
        }
    }

    if(!canSkillList.isEmpty()){
        insert canSkillList;
    }
}*/
    
}