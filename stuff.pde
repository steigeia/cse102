class stuff {
  char type;
  int[] location = new int[2];
  double value;

  public stuff(String tempType, String tempLocationZero, String tempLocationOne, String tempValue) {
    type = tempType.charAt(0);
    location[0] = Integer.parseInt(tempLocationZero);
    location[1] = Integer.parseInt(tempLocationOne);
    value = Double.parseDouble(tempValue);
  }

  public boolean isBattery() {
    if (type == 'b') {
      return true;
    } else return false;
  }

  public boolean contains(int i) {
    if (location[0] == i || location[1] == i) {
      return true;
    } else return false;
  }

  public int position(int i) {
    if (location[0] == i) {
      return 0;
    } else if (location[1] == i) {
      return 1;
    } else return -1;
  }

  public int get(int i) {
    return location[i];
  }

  
  public int notposition(int i){
    if (location[0] == i) {
      return 1;
    } else if (location[1] == i) {
      return 0;
    } else return -1;    
  }

  public double value() {
    return value;
  }

  public char gettype() {
    return type;
  }
}