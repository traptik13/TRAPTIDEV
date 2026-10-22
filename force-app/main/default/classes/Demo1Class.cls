public class Demo1Class {
    Public List<Position__c> createPosition(String name,Integer minPay, Integer maxPay,Integer n){
      List<Position__c> posList = new List<Position__c>();
      for(Integer i = 0; i < n; i++){
         Position__c pos = new Position__c();
         pos.Name = name + i;
         pos.Min_Pay__c = minPay;
         pos.Max_Pay__c = maxPay;
         posList.add(pos);
      }
         if (!posList.isEmpty()) {
              insert posList;
         }

      return posList;	
   }

}