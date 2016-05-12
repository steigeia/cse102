import java.util.Arrays;
class nodes {
  int [] node;
  int num = 0;
  public nodes() {
    node = new int[10];
    node[0]=0;
    num++;
  }
  public void add(int i) {
    if (!contains(i)) {
      if (num==node.length) {
        newsize();
      }
      node[num++]=i;
    }
  }

  private void newsize() {
    node = Arrays.copyOf(node, node.length*2);
  }

  public boolean contains(int n) {
    for (int i = 0; i<num; i++) {
      if (n == node[i])
        return true;
    }
    return false;
  }

  public int getnum(int n) {
    for (int i = 0; i<num; i++) {
      if (n == node[i])
        return i;
    }
    return -1;
  }

  public int num() {
    return num;
  }

  public int[] toArray() {
    return Arrays.copyOf(node, num);
  }
}