import java.util.ArrayList;
import javax.swing.JOptionPane;
nodes n = new nodes();
ArrayList<stuff> s=new ArrayList<stuff>();
boolean flag = true;
String t, l0, l1, v, a, input;
int l0i, l1i;

void setup() {
  makematrix();
}

double[][] makematrix() {

  while (flag == true) {
    t = JOptionPane.showInputDialog("Enter the type(b or r): ");
    l0 = JOptionPane.showInputDialog("Enter position zero: ");
    l1 = JOptionPane.showInputDialog("Enter position one: ");
    v = JOptionPane.showInputDialog("Enter the value: ");
    //input = JOptionPane.showInputDialog("Enter the line ");
    //String[] data = input.split(" ");
    s.add(new stuff(t, l0, l1, v));
    //s.add(new stuff(data[0],data[1],data[2],data[3]));
    
    l0i = Integer.parseInt(l0);
    l1i = Integer.parseInt(l1);

    if (!n.contains(l0i)) {
      n.add(l0i);
    }
    if (!n.contains(l1i)) {
      n.add(l1i);
    }


    a = JOptionPane.showInputDialog("Do you wish to enter another item? yes or no ");
    if (a.equals("no") == true) {
      flag = false;
    }
  }


  ArrayList<stuff> batteries=new ArrayList<stuff>();
  for (stuff temp : s) {
    if (temp.gettype()=='b')
      batteries.add(temp);
  }
  int rows = batteries.size()+n.num;
  int row =0;
  double[][] output = new double[rows][rows+1];
  output[row++][0]=1;
  //n1-n0=Vbat
  for (stuff temp : batteries) {
    output[row][n.getnum(temp.get(0))]=-1;
    output[row][n.getnum(temp.get(1))]=1;
    output[row][rows]=temp.value();
    row++;
  }

  //nodes are not always in order
  int[] nodes = n.toArray();
  ArrayList<stuff> connect;
  for (int z=1; z<n.num(); z++) {


    for (int i = 0; i<batteries.size(); i++) {
      if (batteries.get(i).contains(nodes[z])&&!batteries.get(i).contains(0)) {

        if (batteries.get(i).position(nodes[z])==1) {
          output[row][nodes.length+i]=-1;
        } else {
          output[row][nodes.length+i]=1;
        }
      }
      if (batteries.get(i).contains(0)) {
        z++;
        break;
      }
    }

    connect=new ArrayList<stuff>();
    //find all parts connect to this node
    for (stuff temp : s) {
      if (temp.contains(nodes[z])) {
        connect.add(temp);
      }
    }
    //n1-n0/R
    for (stuff temp : connect) {
      if (temp.gettype()!='b') {
        output[row][n.getnum(nodes[z])]+=1.0/temp.value();
        output[row][n.getnum(temp.get(temp.notposition(nodes[z])))]+=-1.0/temp.value();
      }
    }

    //taking into account currents through batteries

    row++;
  }
  rref(output);
  for(int i = 0;i<nodes.length;i++)
    println("V"+nodes[i]+ " = " + output[i][rows]+"V");
  return output;
}