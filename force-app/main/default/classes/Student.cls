public class Student{ 
   Integer id; 
   String name; 
   Public Student() {
    }
   Public  Student(Integer  i, String  n){ 
      id = i; 
      name = n; 
   } 
  public void display(){
      System.debug(id+' '+name);
   }
}