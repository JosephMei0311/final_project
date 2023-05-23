public class StackEl{
  // This Stack class is designed for integer values >= 0

  // Instance variables here
  NodeEl Top;
  int size = 0;

 // Constructor
  public StackEl(){
    Top = new NodeEl();
  }   

  // Add element to stack
  public void push(int value){
    if(isEmpty())
      Top.setData(value);
    else {
    Top = new NodeEl(value, Top);
    }
    size++;
  }

  // Remove element from stack  
  public int pop(){
    if(isEmpty()){
      return -1;
    }
    NodeEl temp = Top;
    Top = Top.getNext();
    size--;
    return temp.getData();
  }

  // Get top element
  public int top(){
    if(isEmpty()) {
      return -1;
    }
    return Top.getData();
  }

  // Check is stack empty
  public boolean isEmpty(){
    if(size == 0)
      return true;
    return false;
  }

  // Return size stack
  public int size(){
    return size;
  }

  // Print stack
  public String toString(){
    NodeEl walker = Top;
    String list = "";
    for(int counter = 0; counter < this.size(); counter++) {
        list += walker.getData() + ", ";
        walker = walker.getNext();
    }
    return list;
  }


}
