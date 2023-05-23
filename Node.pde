public class NodeEl{
  private int data;
  private NodeEl next;


  /* Constructors */

  public NodeEl(){

  }

  public NodeEl(int data){
    this.data = data;
    this.next = null;

  }


  public NodeEl(int data, NodeEl next){
    this.data = data;
    this.next = next;
  }

  // Getters
  
  public int getData(){
    return data;
  }
  public NodeEl getNext(){
    return next;
  }

  // Setters
  
  public void setData(int data){
    this.data = data;
  }
    
    public void setNext(NodeEl next){
  this.next = next;
  }

  
  // toString
  
  public String toString(){
    return "" + data + "->";
  }
}
