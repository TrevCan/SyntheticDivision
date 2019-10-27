import javax.swing.JOptionPane;


public void setup() {
  size(500, 500);
  division();
}
public void draw() {
  /*
  String hi = JOptionPane.showInputDialog(null, "body", "title", JOptionPane.WARNING_MESSAGE);
  JOptionPane.showConfirmDialog(null, 

    "choose one", "choose one", JOptionPane.YES_NO_OPTION);
  Object[] options = { "OK", "CANCEL" };

  JOptionPane.showOptionDialog(null, "Click OK to continue", "Warning", 

    JOptionPane.DEFAULT_OPTION, JOptionPane.WARNING_MESSAGE, 

    null, options, options[0]);*/
}


public void division() {
  String title = "Synthetic division";

  int initialExponent = Integer.parseInt(JOptionPane.showInputDialog(null, "Please enter the initial exponent of your equation:", title, JOptionPane.WARNING_MESSAGE));

  String inputString[] = split(JOptionPane.showInputDialog(null,"Enter your equation's coefficients separated by commas (no spaces).",title, JOptionPane.WARNING_MESSAGE), ',');
  int[] dividendo = new int[inputString.length];
  for(int i=0;i<inputString.length;i++){
    dividendo[i] = Integer.parseInt(inputString[i]);
  }
  int divisor = Integer.parseInt(JOptionPane.showInputDialog(null,"Please enter the divisor.",title, JOptionPane.WARNING_MESSAGE));
  int[] firstLayerResult = new int[dividendo.length-1];
  int[] result = new int[dividendo.length];


  result[0] = dividendo[0];
  println(result[0]);
  for (int i = 1; i < dividendo.length; i++) {
    //println(dividendo[i]);
    firstLayerResult[i-1] = result[i-1]*divisor;
    result[i] = firstLayerResult[i-1]+dividendo[i];
  }
  println(firstLayerResult);
  println(result);
  JOptionPane.showMessageDialog(null, "The answer is:"+getAnswer(initialExponent,result,firstLayerResult)
  , "Your operation has been successfully calculated.", JOptionPane.WARNING_MESSAGE);
}

String getAnswer(int initialExponent, int[] values, int[]firstLayer){
  String result = "\n";
  for(int i = 0;i<values.length;i++){
    int exponent = initialExponent-1-i;
    String plus_Sign = i!=0?" + ":"";
    
    result+=(String)(plus_Sign+values[i]+"x^"+exponent);
  }
  result += "\n\nArranged:\n";
  for(int a: firstLayer){
    result += a + ", ";
  }
  result+="\n";
  for(int a: values){
    result+= a + ", ";
  }
  return result;
}
