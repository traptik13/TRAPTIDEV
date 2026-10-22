Public class Counter2{ 
   static Integer count=0; //will get memory only once and retain its value 
   public counter2(){ 
      count++; 
      System.debug(count); 
   } 
}