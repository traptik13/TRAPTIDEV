Public class Student8{ 
   Integer rollno; 
   String name; 
   static String college ='ITS';
   public Student8(Integer r, String n){ 
      rollno = r; 
      name = n;
   }
  public void display (){
      System.debug(rollno+' '+name+' '+college);
   } 
}