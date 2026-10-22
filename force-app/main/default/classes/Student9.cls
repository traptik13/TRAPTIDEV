//Program of changing the common property of all objects(static field). 

Public class Student9{ 
   Integer rollno; 
   String name; 
    static String colleges = 'ITS';
   static String college = 'ITS'; 
   Public static void change(){
      college = 'BBDIT'; 
   } 
   Public student9(Integer  r, String n){ 
      rollno = r; 
      name = n; 
   }
   public void display (){
      System.debug(rollno+' '+name+' '+college+' '+colleges);
   } 
}