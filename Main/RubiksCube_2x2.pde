import java.util.ArrayList;
import java.util.Arrays;
import javax.swing.JOptionPane;

public class RubiksCube {

  static final String w = "White";
  static final String y = "Yellow";
  static final String b = "Blue";
  static final String g = "Green";
  static final String r = "Red";
  static final String p = "Purple";

  static final String WBR = "White-Blue-Red Corner";
  static final String WBP = "White-Blue-Purple Corner";
  static final String WGR = "White-Green-Red Corner";
  static final String WGP = "White-Green-Purple Corner";
  static final String YBR = "Yellow-Blue-Red Corner";
  static final String YBP = "Yellow-Blue-Purple Corner";
  static final String YGR = "Yellow-Green-Red Corner";
  static final String YGP = "Yellow-Green-Purple Corner";

  static final char A = 'A';
  static final char B = 'B';
  static final char C = 'C';
  static final char D = 'D';
  static final char E = 'E';
  static final char F = 'F';
  static final char G = 'G';
  static final char H = 'H';

  static final int one = 1;
  static final int two = 2;
  static final int three = 3;
}

public class RubiksCube_2x2 {

  private Cube a, b, c, d, e, f, g, h;
  private Cube[] Cubes = { a, b, c, d, e, f, g, h };
  private Cube[] LayerU = { a, c, d, b };
  private Cube[] LayerD = { e, f, h, g };
  private Cube[] LayerL = { a, e, g, c };
  private Cube[] LayerR = { b, d, h, f };
  private Cube[] LayerF = { a, b, f, e };
  private Cube[] LayerB = { c, g, h, d };

  private static final String layerU_positions = "ACDB";
  private static final String layerD_positions = "EFHG";
  private static final String layerL_positions = "AEGC";
  private static final String layerR_positions = "BDHF";
  private static final String layerF_positions = "ABFE";
  private static final String layerB_positions = "CGHD";

  private ArrayList<String> listOfAlgorithms = new ArrayList<String>();
  private ArrayList<String> listOfAlgorithms_original = new ArrayList<String>();
  private ArrayList<String> listOfExplanations = new ArrayList<String>();
  private ArrayList<Integer> listOfSizes = new ArrayList<Integer>();

  public void implementCube_2x2(Cube[] cubes) {
    this.a = cubes[0];
    this.b = cubes[1];
    this.c = cubes[2];
    this.d = cubes[3];
    this.e = cubes[4];
    this.f = cubes[5];
    this.g = cubes[6];
    this.h = cubes[7];
    Cube[] CUBES = { a, b, c, d, e, f, g, h };
    Cubes = CUBES;
    Cube[] LAYER_U = { a, c, d, b };
    LayerU = LAYER_U;
    Cube[] LAYER_D = { e, f, h, g };
    LayerD = LAYER_D;
    Cube[] LAYER_L = { a, e, g, c };
    LayerL = LAYER_L;
    Cube[] LAYER_R = { b, d, h, f };
    LayerR = LAYER_R;
    Cube[] LAYER_F = { a, b, f, e };
    LayerF = LAYER_F;
    Cube[] LAYER_B = { c, g, h, d };
    LayerB = LAYER_B;
  }

  public RubiksCube_2x2(Cube[] cubes) {
    implementCube_2x2(cubes);
  }

  public ArrayList<String> algorithmList() {
    return this.listOfAlgorithms;
  }

  public void update () {
    this.update(cubes);
  }

  public void update (Cube[] cubes) {
    implementCube_2x2(cubes);
  }

  public Cube[] Cubes() {
    return this.Cubes;
  }

  public Cube[] LayerU() {
    return LayerU;
  }

  public void reImplementCube_2x2(Cube[] layer) {
    switch (layer[3].position()) {
    case 'B':
      this.a = layer[0];
      this.c = layer[1];
      this.d = layer[2];
      this.b = layer[3];
      break;
    case 'G':
      this.e = layer[0];
      this.f = layer[1];
      this.h = layer[2];
      this.g = layer[3];
      break;
    case 'C':
      this.a = layer[0];
      this.e = layer[1];
      this.g = layer[2];
      this.c = layer[3];
      break;
    case 'F':
      this.b = layer[0];
      this.d = layer[1];
      this.h = layer[2];
      this.f = layer[3];
      break;
    case 'E':
      this.a = layer[0];
      this.b = layer[1];
      this.f = layer[2];
      this.e = layer[3];
      break;
    case 'D':
      this.c = layer[0];
      this.g = layer[1];
      this.h = layer[2];
      this.d = layer[3];
      break;
    }
    Cube[] reImplementedArray = { a, b, c, d, e, f, g, h };
    this.implementCube_2x2(reImplementedArray);
  }

  public void U() {
    Cube[] temp = LayerU.clone();
    for (int i = 0; i < temp.length; i++) {
      LayerU[i] = temp[clockwise[i]];
      LayerU[i].changePositionTo(layerU_positions.charAt(i));
    }
    this.reImplementCube_2x2(LayerU);
    listOfAlgorithms.add(U_);
  }

  public void U(int n) {
    for (int i = 0; i < n; i++)
      this.U();
  }

  public void Ui() {
    Cube[] temp = LayerU.clone();
    for (int i = 0; i < temp.length; i++) {
      LayerU[i] = temp[anti_clockwise[i]];
      LayerU[i].changePositionTo(layerU_positions.charAt(i));
    }
    this.reImplementCube_2x2(LayerU);
    listOfAlgorithms.add(Ui_);
  }

  public void Ui(int n) {
    for (int i = 0; i < n; i++)
      this.Ui();
  }

  public Cube[] LayerD() {
    return LayerD;
  }

  public void D() {
    Cube[] temp = LayerD.clone();
    for (int i = 0; i < temp.length; i++) {
      LayerD[i] = temp[clockwise[i]];
      LayerD[i].changePositionTo(layerD_positions.charAt(i));
    }
    this.reImplementCube_2x2(LayerD);
    listOfAlgorithms.add(D_);
  }

  public void D(int n) {
    for (int i = 0; i < n; i++)
      this.D();
  }

  public void Di() {
    Cube[] temp = LayerD.clone();
    for (int i = 0; i < temp.length; i++) {
      LayerD[i] = temp[anti_clockwise[i]];
      LayerD[i].changePositionTo(layerD_positions.charAt(i));
    }
    this.reImplementCube_2x2(LayerD);
    listOfAlgorithms.add(Di_);
  }

  public void Di(int n) {
    for (int i = 0; i < n; i++)
      this.Di();
  }

  public Cube[] LayerL() {
    return LayerL;
  }

  public void L() {
    Cube[] temp = LayerL.clone();
    for (int i = 0; i < temp.length; i++) {
      LayerL[i] = temp[clockwise[i]];
      LayerL[i].changeOrientationTo(LayerL[i].conjugateOrientation(2));
      LayerL[i].changePositionTo(layerL_positions.charAt(i));
    }
    this.reImplementCube_2x2(LayerL);
    listOfAlgorithms.add(L_);
  }

  public void L(int n) {
    for (int i = 0; i < n; i++)
      this.L();
  }

  public void adjustAlgorithmListForInversion() {
    for (int i = 0; i < 3; i++)
      listOfAlgorithms.remove(listOfAlgorithms.size() - 1);
  }

  public void adjustAlgorithmListForRedundance(int index) {
    for (int i = 0; i < 3; i++)
      listOfAlgorithms.remove(index + 1);
  }

  public String optimizedAlgorithmList() {
    optimizeAlgorithmList();
    String optimizedAlgorithmList = "";
    for (int i = 0; i < listOfAlgorithms.size(); i++) {
      optimizedAlgorithmList += listOfAlgorithms.get(i);
      if (listOfAlgorithms.get(i).length() == 1)
        optimizedAlgorithmList += " ";
      if (i == listOfAlgorithms.size() - 1)
        optimizedAlgorithmList += " = ";
      else
        optimizedAlgorithmList += " + ";
      if ((i + 1) % 10 == 0)
        optimizedAlgorithmList += "\n";
    }
    optimizedAlgorithmList += "[" + listOfAlgorithms.size() + "]";
    return optimizedAlgorithmList;
  }

  public boolean algorithmListIsOptimized() {
    for (int i = 0; i < listOfAlgorithms.size() - 1; i++)
      if (listOfAlgorithms.get(i).equals(inverseOf(listOfAlgorithms.get(i + 1))))
        return false;
    for (int i = 0; i < listOfAlgorithms.size() - 2; i++)
      if (listOfAlgorithms.get(i).equals(listOfAlgorithms.get(i + 1))
        && listOfAlgorithms.get(i + 1).equals(listOfAlgorithms.get(i + 2)))
        return false;
    return true;
  }

  public void optimizeAlgorithmList() {
    if (listOfAlgorithms_original.size() == 0)
      for (int i = 0; i < listOfAlgorithms.size(); i++)
        listOfAlgorithms_original.add(listOfAlgorithms.get(i));
    while (algorithmListIsOptimized() == false) {
      for (int i = 0; i < listOfAlgorithms.size() - 1; i++)
        if (listOfAlgorithms.get(i).equals(inverseOf(listOfAlgorithms.get(i + 1)))) {
          listOfAlgorithms.remove(i + 1);
          listOfAlgorithms.remove(i--);
        }
      for (int i = 0; i < listOfAlgorithms.size() - 2; i++)
        if (listOfAlgorithms.get(i).equals(listOfAlgorithms.get(i + 1))
          && listOfAlgorithms.get(i + 1).equals(listOfAlgorithms.get(i + 2))) {
          listOfAlgorithms.add(i, inverseOf(listOfAlgorithms.get(i)));
          adjustAlgorithmListForRedundance(i);
        }
    }
    if (listOfAlgorithms.size() >= 2 && listOfAlgorithms.get(listOfAlgorithms.size() - 1)
      .equals(complementOf(listOfAlgorithms.get(listOfAlgorithms.size() - 2))))
      for (int i = 0; i < 2; i++)
        listOfAlgorithms.remove(listOfAlgorithms.size() - 1);
    if (listOfAlgorithms.size() >= 3 && listOfAlgorithms.get(listOfAlgorithms.size() - 3).equals(Di)
      && listOfAlgorithms.get(listOfAlgorithms.size() - 2).equals(U)
      && listOfAlgorithms.get(listOfAlgorithms.size() - 1).equals(U)) {
      listOfAlgorithms.remove(listOfAlgorithms.size() - 2);
      listOfAlgorithms.remove(listOfAlgorithms.size() - 2);
    }
  }

  public void Li() {
    this.L(3);
    adjustAlgorithmListForInversion();
    listOfAlgorithms.add(Li_);
  }

  public void Li(int n) {
    for (int i = 0; i < n; i++)
      this.Li();
  }

  public Cube[] LayerR() {
    return LayerR;
  }

  public void R() {
    Cube[] temp = LayerR.clone();
    for (int i = 0; i < temp.length; i++) {
      LayerR[i] = temp[clockwise[i]];
      LayerR[i].changeOrientationTo(LayerR[i].conjugateOrientation(2));
      LayerR[i].changePositionTo(layerR_positions.charAt(i));
    }
    this.reImplementCube_2x2(LayerR);
    listOfAlgorithms.add(R_);
  }

  public void R(int n) {
    for (int i = 0; i < n; i++)
      this.R();
  }

  public void Ri() {
    this.R(3);
    adjustAlgorithmListForInversion();
    listOfAlgorithms.add(Ri_);
  }

  public void Ri(int n) {
    for (int i = 0; i < n; i++)
      this.Ri();
  }

  public Cube[] LayerF() {
    return LayerF;
  }

  public void F() {
    Cube[] temp = LayerF.clone();
    for (int i = 0; i < temp.length; i++) {
      LayerF[i] = temp[clockwise[i]];
      LayerF[i].changeOrientationTo(LayerF[i].conjugateOrientation(1));
      LayerF[i].changePositionTo(layerF_positions.charAt(i));
    }
    this.reImplementCube_2x2(LayerF);
    listOfAlgorithms.add(F_);
  }

  public void F(int n) {
    for (int i = 0; i < n; i++)
      this.F();
  }

  public void Fi() {
    this.F(3);
    adjustAlgorithmListForInversion();
    listOfAlgorithms.add(Fi_);
  }

  public void Fi(int n) {
    for (int i = 0; i < n; i++)
      this.Fi();
  }

  public Cube[] LayerB() {
    return LayerB;
  }

  public void B() {
    Cube[] temp = LayerB.clone();
    for (int i = 0; i < temp.length; i++) {
      LayerB[i] = temp[clockwise[i]];
      LayerB[i].changeOrientationTo(LayerB[i].conjugateOrientation(1));
      LayerB[i].changePositionTo(layerB_positions.charAt(i));
    }
    this.reImplementCube_2x2(LayerB);
    listOfAlgorithms.add(B_);
  }

  public void B(int n) {
    for (int i = 0; i < n; i++)
      this.B();
  }

  public void Bi() {
    this.B(3);
    adjustAlgorithmListForInversion();
    listOfAlgorithms.add(Bi_);
  }

  public void Bi(int n) {
    for (int i = 0; i < n; i++)
      this.Bi();
  }

  public boolean faceU_isSolved() {
    for (int i = 0; i < LayerU.length - 1; i++)
      if (LayerU[i].faceColors()[0].equals(LayerU[i + 1].faceColors()[0]) == false)
        return false;
    return true;
  }

  public boolean faceD_isSolved() {
    for (int i = 0; i < LayerD.length - 1; i++)
      if (LayerD[i].faceColors()[0].equals(LayerD[i + 1].faceColors()[0]) == false)
        return false;
    return true;
  }

  public boolean faceR_isSolved() {
    for (int i = 0; i < LayerR.length - 1; i++)
      if (LayerR[i].faceColors()[2].equals(LayerR[i + 1].faceColors()[2]) == false)
        return false;
    return true;
  }

  public boolean faceL_isSolved() {
    for (int i = 0; i < LayerL.length - 1; i++)
      if (LayerL[i].faceColors()[2].equals(LayerL[i + 1].faceColors()[2]) == false)
        return false;
    return true;
  }

  public boolean faceF_isSolved() {
    for (int i = 0; i < LayerF.length - 1; i++)
      if (LayerF[i].faceColors()[1].equals(LayerF[i + 1].faceColors()[1]) == false)
        return false;
    return true;
  }

  public boolean faceB_isSolved() {
    for (int i = 0; i < LayerB.length - 1; i++)
      if (LayerB[i].faceColors()[1].equals(LayerB[i + 1].faceColors()[1]) == false)
        return false;
    return true;
  }

  public boolean isSolved() {
    if (this.faceU_isSolved() && this.faceD_isSolved() && this.faceL_isSolved() && this.faceR_isSolved()
      && this.faceF_isSolved() && this.faceB_isSolved())
      return true;
    return false;
  }

  public String toString() {
    return string(this.Cubes);
  }

  public void displayDescription() {
    System.out.println(this.Description());
  }

  public void display(Cube[] cubeArr) {
    System.out.println(Arrays.toString(cubeArr));
  }

  public String Description() {
    String string = "";
    for (int i = 0; i < 8; i++) {
      string += "Position " + cubePositionNames.substring(i, i + 1) + ": "
        + orientationInfo(this.Cubes()[i]) + "\n\n";
    }
    return string;
  }

  public void displayDescription(Cube[] layer) {
    System.out.println(this.Description(layer));
  }

  public String Description(Cube[] layer) {
    String string = "";
    for (int i = 0; i < layer.length; i++) {
      string += "Position " + layer[i].position() + ": " + orientationInfo(layer[i])
        + "\n\n";
    }
    return string;
  }

  public int numOfCubesWithWhiteOnUface() {
    int numOfCubesWithWhiteOnUface = 0;
    for (Cube x : this.whiteCubes())
      if (x.faceColors()[0].equals(RubiksCube.w) && x.isInUlayer())
        numOfCubesWithWhiteOnUface++;
    return numOfCubesWithWhiteOnUface;
  }

  public int numOfCubesWithWhiteOnDface() {
    int numOfCubesWithWhiteOnDface = 0;
    for (Cube x : this.whiteCubes())
      if (x.faceColors()[0].equals(RubiksCube.w) && x.isInDlayer())
        numOfCubesWithWhiteOnDface++;
    return numOfCubesWithWhiteOnDface;
  }

  public boolean first2WhiteCubesAreInCorrectPosition() {
    switch ("" + this.cubesWithWhiteOnUface()[0].position() + this.cubesWithWhiteOnUface()[1].position()) {
    case "AB":
    case "BA":
    case "CD":
    case "DC":
      if (this.cubesWithWhiteOnUface()[0].faceColors()[1].equals(this.cubesWithWhiteOnUface()[1].faceColors()[1]))
        return true;
      break;
    case "AC":
    case "CA":
    case "BD":
    case "DB":
      if (this.cubesWithWhiteOnUface()[0].faceColors()[2].equals(this.cubesWithWhiteOnUface()[1].faceColors()[2]))
        return true;
      break;
    case "AD":
    case "DA":
    case "BC":
    case "CB":
      if (this.cubesWithWhiteOnUface()[0].faceColors()[1]
        .equals(conjugateColorOf(this.cubesWithWhiteOnUface()[1].faceColors()[1])))
        return true;
      break;
    }
    return false;
  }

  public int orientationOfFirst2WhiteCubes() {
    switch ("" + this.cubesWithWhiteOnUface()[0].position() + this.cubesWithWhiteOnUface()[1].position()) {
    case "AB":
    case "BA":
    case "AC":
    case "CA":
    case "BD":
    case "DB":
    case "CD":
    case "DC":
      if (this.cubesWithWhiteOnUface()[0].faceColors()[2].equals(this.cubesWithWhiteOnUface()[1].faceColors()[2]))
        return 1;
      return 2;
    case "AD":
    case "DA":
    case "BC":
    case "CB":
      if (this.cubesWithWhiteOnUface()[0].faceColors()[1]
        .equals((this.cubesWithWhiteOnUface()[1].faceColors()[2])))
        return 3;
    }
    return 4;
  }

  public void algorithm_ProperlyPositionFirst2WhiteCubes() {
    if (this.numOfCubesWithWhiteOnUface() < 2)
      return;
    switch ("" + this.cubesWithWhiteOnUface()[0].position() + this.cubesWithWhiteOnUface()[1].position()) {
    case "AC":
      this.Ui();
      break;
    case "BC":
      this.U();
      break;
    case "BD":
      this.U();
      break;
    case "CD":
      this.U(2);
      break;
    }
    if (this.orientationOfFirst2WhiteCubes() == 1) {
      this.Ri();
      this.Ui(2);
      this.Di();
      this.Ri();
      this.D();
      this.R();
    } else if (this.orientationOfFirst2WhiteCubes() == 2) {
      this.Ri();
      this.U();
      this.R();
    } else if (this.orientationOfFirst2WhiteCubes() == 3) {
      this.L();
      this.U();
      this.Li();
    } else if (this.orientationOfFirst2WhiteCubes() == 4) {
      this.Fi();
      this.Ui();
      this.F();
    }
    listOfExplanations.add("Properly orient the two white cubes on the U face.");
    listOfSizes.add(listOfAlgorithms.size());
  }

  public void algorithm_OneCubeWithWhiteOnUface() {
    if (this.numOfCubesWithWhiteOnUface() != 1)
      return;
    int check = 0;
    while (check == 0) {
      check = 1;
      if (this.cubesWithWhiteOnUface()[0].isInLlayer() && this.cubesWithWhiteOnUface()[0].isInFlayer()) {
        if (this.cubesWithWhiteOnRlayer_excludingRface().length > 0)
          if (this.cubesWithWhiteOnRlayer_excludingRface()[0].faceColors()[0].equals(RubiksCube.w))
            this.R(2);
          else if (this.cubesWithWhiteOnRlayer_excludingRface()[0].isInFlayer())
            this.R();
          else
            this.Ri();
        else if (this.cubesWithWhiteOnBlayer_excludingBface().length > 0)
          if (this.cubesWithWhiteOnBlayer_excludingBface()[0].faceColors()[0].equals(RubiksCube.w))
            this.B(2);
          else if (this.cubesWithWhiteOnBlayer_excludingBface()[0].isInRlayer())
            this.B();
          else
            this.Bi();
        else {
          this.Ui();
          check = 0;
        }
      } else if (this.cubesWithWhiteOnUface()[0].isInRlayer() && this.cubesWithWhiteOnUface()[0].isInFlayer()) {
        if (this.cubesWithWhiteOnLlayer_excludingLface().length > 0)
          if (this.cubesWithWhiteOnLlayer_excludingLface()[0].faceColors()[0].equals(RubiksCube.w))
            this.L(2);
          else if (this.cubesWithWhiteOnLlayer_excludingLface()[0].isInBlayer())
            this.L();
          else {
            this.Li();
          } else if (this.cubesWithWhiteOnBlayer_excludingBface().length > 0)
          if (this.cubesWithWhiteOnBlayer_excludingBface()[0].faceColors()[0].equals(RubiksCube.w))
            this.B(2);
          else if (this.cubesWithWhiteOnBlayer_excludingBface()[0].isInRlayer())
            this.B();
          else
            this.Bi();
        else {
          this.Ui();
          check = 0;
        }
      } else if (this.cubesWithWhiteOnUface()[0].isInLlayer() && this.cubesWithWhiteOnUface()[0].isInBlayer()) {
        if (this.cubesWithWhiteOnRlayer_excludingRface().length > 0)
          if (this.cubesWithWhiteOnRlayer_excludingRface()[0].faceColors()[0].equals(RubiksCube.w))
            this.R(2);
          else if (this.cubesWithWhiteOnRlayer_excludingRface()[0].isInFlayer())
            this.R();
          else
            this.Ri();
        else if (this.cubesWithWhiteOnFlayer_excludingFface().length > 0)
          if (this.cubesWithWhiteOnFlayer_excludingFface()[0].faceColors()[0].equals(RubiksCube.w))
            this.F(2);
          else if (this.cubesWithWhiteOnFlayer_excludingFface()[0].isInLlayer())
            this.F();
          else
            this.Fi();
        else {
          this.Ui();
          check = 0;
        }
      } else if (this.cubesWithWhiteOnUface()[0].isInRlayer() && this.cubesWithWhiteOnUface()[0].isInBlayer()) {
        if (this.cubesWithWhiteOnLlayer_excludingLface().length > 0)
          if (this.cubesWithWhiteOnLlayer_excludingLface()[0].faceColors()[0].equals(RubiksCube.w))
            this.L(2);
          else if (this.cubesWithWhiteOnLlayer_excludingLface()[0].isInBlayer())
            this.L();
          else {
            this.Li();
          } else if (this.cubesWithWhiteOnFlayer_excludingFface().length > 0) {
          if (this.cubesWithWhiteOnFlayer_excludingFface()[0].faceColors()[0].equals(RubiksCube.w))
            this.F(2);
          else if (this.cubesWithWhiteOnFlayer_excludingFface()[0].isInLlayer()) {
            this.F();
          } else
            this.Fi();
        } else {
          this.Ui();
          check = 0;
        }
      }
    }
    listOfExplanations.add("Bring another white cube onto the U face.");
    listOfSizes.add(listOfAlgorithms.size());
  }

  public void algorithm_InsertCubeAtPosEintoPosA() {
    this.D();
    this.L();
    this.Di();
    this.Li();
  }

  public void algorithm_InsertCubeAtPosFintoPosB() {
    this.Di();
    this.Ri();
    this.D();
    this.R();
  }

  public boolean BlayerContainsWhite() {
    if (this.cubeC().containsWhite())
      return true;
    if (this.cubeD().containsWhite())
      return true;
    if (this.cubeG().containsWhite())
      return true;
    if (this.cubeH().containsWhite())
      return true;
    return false;
  }

  public boolean DlayerContainsWhite() {
    if (this.cubeE().containsWhite())
      return true;
    if (this.cubeF().containsWhite())
      return true;
    if (this.cubeG().containsWhite())
      return true;
    if (this.cubeH().containsWhite())
      return true;
    return false;
  }

  public void algorithm_TwoCubesWithWhiteOnUface_InCorrectPosition() { 
    if (this.numOfCubesWithWhiteOnUface() != 2)
      return;

    boolean linear = false;
    boolean diagonal = false;

    if (this.cubesWithWhiteOnUface()[0].isInLlayer() && this.cubesWithWhiteOnUface()[1].isInLlayer()) {
      this.Ui();
    } else if (this.cubesWithWhiteOnUface()[0].isInRlayer() && this.cubesWithWhiteOnUface()[1].isInRlayer()) {
      this.U();
    } else if (this.cubesWithWhiteOnUface()[0].isInBlayer() && this.cubesWithWhiteOnUface()[1].isInBlayer()) {
      this.U(2);
    }

    if (this.cubesWithWhiteOnUface()[0].isInFlayer() && this.cubesWithWhiteOnUface()[1].isInFlayer())       
      linear = true;
    else
      diagonal = true;

    if (linear) {
      if (this.BlayerContainsWhite() == false)
        this.D(2);
      if (this.cubesWithWhiteOnBlayer_excludingBface().length > 0) 
        if (this.cubesWithWhiteOnBlayer_excludingBface()[0].faceColors()[0].equals(RubiksCube.w)) 
          this.B(2);
        else if (this.cubesWithWhiteOnBlayer_excludingBface()[0].isInLlayer())
          this.Bi();
        else
          this.B();
      else {
        if (this.cubeC().containsWhite()) {
          this.Li();
          this.D();
          this.L();
        } else if (this.cubeD().containsWhite()) {
          this.R();
          this.Di();
          this.Ri();
        }  
        if (this.DlayerContainsWhite()) {
          if (this.cubeG().faceColors()[1].equals(RubiksCube.w)) {
            this.Di();
            this.Li();
            this.D();
            this.L();
          } else if (this.cubeH().faceColors()[1].equals(RubiksCube.w)) {
            this.D();
            this.R();
            this.Di();
            this.Ri();
          }
        }
      }
    }

    if (diagonal) {
      if (this.cubesWithWhiteOnDlayer_excludingDface().length == 0) {
        if (this.cubesWithWhiteOnDface().length == 0) {
          while ((this.cubeA().faceColors()[1].equals(RubiksCube.w) || 
            this.cubeB().faceColors()[1].equals(RubiksCube.w)) == false) 
            this.U();
          if (this.cubeA().faceColors()[1].equals(RubiksCube.w)) {
            this.L();
            this.Di();
            this.Li();
            while ((this.cubeB().faceColors()[1].equals(this.cubeE().faceColors()[0]) && 
              this.cubeC().faceColors()[2].equals(this.cubeE().faceColors()[2]) == false)) 
              this.U();
            this.algorithm_InsertCubeAtPosEintoPosA();
          } else if (this.cubeB().faceColors()[1].equals(RubiksCube.w)) {
            this.Ri();
            this.D();
            this.R();
            while ((this.cubeA().faceColors()[1].equals(this.cubeF().faceColors()[0]) && 
              this.cubeD().faceColors()[2].equals(this.cubeF().faceColors()[2]) == false)) 
              this.Ui();
            this.algorithm_InsertCubeAtPosFintoPosB();
          }
        } else {
          if (this.cubeA().faceColors()[0].equals(RubiksCube.w) == false)
            this.U();
          if (this.cubesWithWhiteOnDface().length > 0)
            if (this.cubesWithWhiteOnDface()[0].position() == 'E')
              this.Di();
            else if (this.cubesWithWhiteOnDface()[0].position() == 'F') 
              this.Di(2);
            else if (this.cubesWithWhiteOnDface()[0].position() == 'H')
              this.D();
          if (this.cubeG().faceColors()[0].equals(RubiksCube.w)) {
            this.Ri();
            this.Di();
            this.R();
          }
          while ((this.cubeB().containsWhite() && this.cubeB().faceColors()[1].equals(this.cubeF().faceColors()[0])) 
            && this.cubeB().faceColors()[2].equals(this.cubeF().faceColors()[2]) == false)
            this.Ui();
          this.algorithm_InsertCubeAtPosFintoPosB();
        }
      } else if (this.cubesWithWhiteOnDlayer_excludingDface().length > 0) {
        while ((this.cubesWithWhiteOnDlayer_excludingDface()[0].faceColors()[1].equals(RubiksCube.w) && 
          this.cubesWithWhiteOnDlayer_excludingDface()[0].isInFlayer()) == false)
          this.D();
        if (this.cubeE().faceColors()[1].equals(RubiksCube.w)) {
          while ((this.cubeA().containsWhite() == false && this.cubeB().faceColors()[1].equals(this.cubeE().faceColors()[0]) 
            && this.cubeC().faceColors()[2].equals(this.cubeE().faceColors()[2])) == false)
            this.U();
          this.algorithm_InsertCubeAtPosEintoPosA();
        } else if (this.cubeF().faceColors()[1].equals(RubiksCube.w)) {
          while ((this.cubeB().containsWhite() == false && this.cubeA().faceColors()[1].equals(this.cubeF().faceColors()[0])
            && this.cubeD().faceColors()[2].equals(this.cubeF().faceColors()[2])) == false)
            this.Ui();
          this.algorithm_InsertCubeAtPosFintoPosB();
        }
      }
    }
    listOfExplanations.add("Bring another white cube onto the U face.");
    listOfSizes.add(listOfAlgorithms.size());
  }

  public void algorithm_InsertCubeAtPosEintoPosB() {
    this.Ri();
    this.D(2);
    this.R();
    this.algorithm_InsertCubeAtPosFintoPosB();
  }

  public void algorithm_InsertCubeAtPosFintoPosA() {
    this.L();
    this.Di(2);
    this.Li();
    this.algorithm_InsertCubeAtPosEintoPosA();
  }

  public void algorithm_InsertCubeAtPosGintoPosB() {
    this.Ri();
    this.Di();
    this.R();
    this.algorithm_InsertCubeAtPosFintoPosB();
  }

  public void algorithm_InsertCubeAtPosHintoPosA() {
    this.L();
    this.D();
    this.Li();
    this.algorithm_InsertCubeAtPosEintoPosA();
  }

  public char positionOf(String cubeName) {
    char position = 'z';
    for (Cube x : this.Cubes)
      if (x.name().equals(cubeName))
        position = x.position();
    return position;
  }

  public char vacantPositionInULayer() {
    char pos = 0;
    if (this.numOfCubesWithWhiteOnUface() != 3)
      return pos;
    for (Cube x : this.LayerU())
      if (x.faceColors()[0].equals(RubiksCube.w) == false)
        pos = x.position();
    return pos;
  }

  public void algorithm_ThreeCubesWithWhiteOnUface_InCorrectPosition() {
    if (this.numOfCubesWithWhiteOnUface() != 3)
      return;
    if (this.cubesWithWhiteOnDlayer_excludingDface().length > 0) {
      if (this.cubesWithWhiteOnDlayer_excludingDface()[0].isInBlayer()
        && this.cubesWithWhiteOnDlayer_excludingDface()[0].faceColors()[1].equals(RubiksCube.w))
        this.D(2);
      else if (this.cubesWithWhiteOnDlayer_excludingDface()[0].isInLlayer()
        && this.cubesWithWhiteOnDlayer_excludingDface()[0].faceColors()[2].equals(RubiksCube.w)) {
        this.D();
      } else if (this.cubesWithWhiteOnDlayer_excludingDface()[0].isInRlayer()
        && this.cubesWithWhiteOnDlayer_excludingDface()[0].faceColors()[2].equals(RubiksCube.w))
        this.Di();
      char pos = this.cubesWithWhiteOnDlayer_excludingDface()[0].position();
      if (pos == 'E') {
        switch (this.vacantPositionInULayer()) {
        case 'B':
          this.U();
          break;
        case 'C':
          this.Ui();
          break;
        case 'D':
          this.U(2);
          break;
        }
        this.algorithm_InsertCubeAtPosEintoPosA();
      } else if (pos == 'F') {
        switch (this.vacantPositionInULayer()) {
        case 'A':
          this.Ui();
          break;
        case 'C':
          this.Ui(2);
          break;
        case 'D':
          this.U();
          break;
        }
        this.algorithm_InsertCubeAtPosFintoPosB();
      }
    } else if (this.cubesWithWhiteOnDface().length > 0) {
      switch (this.vacantPositionInULayer()) {
      case 'C':
        this.Ui();
        break;
      case 'D':
        this.U();
        break;
      }
      char pos = this.vacantPositionInULayer();
      if (pos == 'A')
        switch (this.cubesWithWhiteOnDface()[0].position()) {
        case 'E':
          this.D();
          this.algorithm_InsertCubeAtPosFintoPosA();
          break;
        case 'F':
          this.algorithm_InsertCubeAtPosFintoPosA();
          break;
        case 'G':
          this.Di();
          this.algorithm_InsertCubeAtPosHintoPosA();
          break;
        case 'H':
          this.algorithm_InsertCubeAtPosHintoPosA();
          break;
        } else if (pos == 'B')
        switch (this.cubesWithWhiteOnDface()[0].position()) {
        case 'E':
          this.algorithm_InsertCubeAtPosEintoPosB();
          break;
        case 'F':
          this.Di();
          this.algorithm_InsertCubeAtPosEintoPosB();
          break;
        case 'G':
          this.algorithm_InsertCubeAtPosGintoPosB();
          break;
        case 'H':
          this.D();
          this.algorithm_InsertCubeAtPosGintoPosB();
          break;
        }
    } else if (this.cubesWithWhiteOnUlayer_excludingUface().length > 0) {
      switch (this.cube(this.vacantPositionInULayer()).indexOf(RubiksCube.w)) {
      case 1:
        if (this.cube(this.vacantPositionInULayer()).isInBlayer())
          this.U(2);
        break;
      case 2:
        if (this.cube(this.vacantPositionInULayer()).isInLlayer())
          this.Ui();
        else
          this.U();
        break;
      }
      if (this.vacantPositionInULayer() == 'A') {
        this.L();
        this.Di();
        this.Li();
        this.algorithm_InsertCubeAtPosEintoPosA();
      } else if (this.vacantPositionInULayer() == 'B') {
        this.Ri();
        this.D();
        this.R();
        this.algorithm_InsertCubeAtPosFintoPosB();
      }
    }
  }

  public Cube cube(char pos) {
    int position = -1;
    switch (pos) {
    case 'A':
      position = 0;
      break;
    case 'B':
      position = 1;
      break;
    case 'C':
      position = 2;
      break;
    case 'D':
      position = 3;
      break;
    case 'E':
      position = 4;
      break;
    case 'F':
      position = 5;
      break;
    case 'G':
      position = 6;
      break;
    case 'H':
      position = 7;
      break;
    }
    return this.Cubes()[position];
  }

  public Cube cubeA() {
    return this.Cubes()[0];
  }

  public Cube cubeB() {
    return this.Cubes()[1];
  }

  public Cube cubeC() {
    return this.Cubes()[2];
  }

  public Cube cubeD() {
    return this.Cubes()[3];
  }

  public Cube cubeE() {
    return this.Cubes()[4];
  }

  public Cube cubeF() {
    return this.Cubes()[5];
  }

  public Cube cubeG() {
    return this.Cubes()[6];
  }

  public Cube cubeH() {
    return this.Cubes()[7];
  }

  public boolean first3WhiteCubesAreInCorrectPosition() {
    if (cubesAreInCorrectPosition(this.cubeA(), this.cubeB(), 0, 1, RubiksCube.w)
      && cubesAreInCorrectPosition(this.cubeB(), this.cubeC(), 1, 2, RubiksCube.w))
      return true;
    if (cubesAreInCorrectPosition(this.cubeC(), this.cubeD(), 0, 1, RubiksCube.w)
      && cubesAreInCorrectPosition(this.cubeB(), this.cubeC(), 1, 2, RubiksCube.w))
      return true;
    if (cubesAreInCorrectPosition(this.cubeC(), this.cubeD(), 0, 1, RubiksCube.w)
      && cubesAreInCorrectPosition(this.cubeD(), this.cubeA(), 1, 2, RubiksCube.w)) {
      return true;
    }
    if (cubesAreInCorrectPosition(this.cubeA(), this.cubeB(), 0, 1, RubiksCube.w)
      && cubesAreInCorrectPosition(this.cubeA(), this.cubeD(), 1, 2, RubiksCube.w))
      return true;
    return false;
  }

  public void algorithm_ProperlyPositionFirst3WhiteCubes() {
    if (this.numOfCubesWithWhiteOnUface() < 3)
      return;
    if (this.cubeA().faceColors()[0].equals(RubiksCube.w) == false)
      this.U(2);
    else if (this.cubeB().faceColors()[0].equals(RubiksCube.w) == false)
      this.Ui();
    else if (this.cubeC().faceColors()[0].equals(RubiksCube.w) == false)
      this.U();
    if (cubesAreInCorrectPosition(this.cubeA(), this.cubeB(), 0, 1, RubiksCube.w)) {
      this.B();
      this.R();
      this.Di();
      this.Ri();
    } else if (cubesAreInCorrectPosition(this.cubeA(), this.cubeC(), 0, 2, RubiksCube.w)) {
      this.Ri();
      this.Bi();
      this.D();
      this.B();
    } else if (cubesAreInCorrectPosition(this.cubeB(), this.cubeC(), 1, 2, RubiksCube.w)) {
      this.L();
      this.D();
      this.Li();
      this.U(2);
      this.L();
      this.Di();
      this.Li();
    }
    listOfExplanations.add("Properly position the 3rd white cube.");
    listOfSizes.add(listOfAlgorithms.size());
  }

  public boolean cubesAreInCorrectPosition(Cube one, Cube two, int i, int j, String c) {
    switch (c) {
    case RubiksCube.w:
      if (one.containsWhite() == false || two.containsWhite() == false)
        return false;
      break;
    case RubiksCube.y:
      if (one.containsYellow() == false || two.containsYellow() == false)
        return false;
      break;
    }
    switch ("" + one.position() + two.position()) {
    case "AD":
    case "DA":
    case "BC":
    case "CB":
    case "AF":
    case "FA":
    case "BE":
    case "EB":
    case "AG":
    case "GA":
    case "CE":
    case "EC":
    case "CH":
    case "HC":
    case "DG":
    case "GD":
    case "BH":
    case "HB":
    case "DF":
    case "FD":
    case "EH":
    case "HE":
    case "FG":
    case "GF":
      return this.cubesAreInCorrectPosition_diagonal(one, two, i, j);
    }
    return this.cubesAreInCorrectPosition_linear(one, two, i, j);
  }

  public boolean cubesAreInCorrectPosition_linear(Cube one, Cube two, int i, int j) {
    if (one.faceColors()[i].equals(two.faceColors()[i]) && one.faceColors()[j].equals(two.faceColors()[j]))
      return true;
    return false;
  }

  public boolean cubesAreInCorrectPosition_diagonal(Cube one, Cube two, int i, int j) {
    if (one.faceColors()[i].equals(conjugateColorOf(two.faceColors()[i]))
      && one.faceColors()[j].equals(conjugateColorOf(two.faceColors()[j])))
      return true;
    return false;
  }

  public String positionsOfNonApparentWhiteCubesInCorrectLinearPosition() {
    String positionsOfNonApparentWhiteCubesInCorrectLinearPosition = "";
    if (cubesAreInCorrectPosition(this.cubeA(), this.cubeE(), 1, 2, RubiksCube.w))
      positionsOfNonApparentWhiteCubesInCorrectLinearPosition = "AE";
    else if (cubesAreInCorrectPosition(this.cubeB(), this.cubeF(), 1, 2, RubiksCube.w))
      positionsOfNonApparentWhiteCubesInCorrectLinearPosition = "BF";
    else if (cubesAreInCorrectPosition(this.cubeE(), this.cubeF(), 0, 1, RubiksCube.w))
      positionsOfNonApparentWhiteCubesInCorrectLinearPosition = "EF";
    else if (cubesAreInCorrectPosition(this.cubeE(), this.cubeG(), 0, 2, RubiksCube.w))
      positionsOfNonApparentWhiteCubesInCorrectLinearPosition = "EG";
    else if (cubesAreInCorrectPosition(this.cubeC(), this.cubeG(), 1, 2, RubiksCube.w))
      positionsOfNonApparentWhiteCubesInCorrectLinearPosition = "CG";
    else if (cubesAreInCorrectPosition(this.cubeG(), this.cubeH(), 0, 1, RubiksCube.w)) {
      positionsOfNonApparentWhiteCubesInCorrectLinearPosition = "GH";
    } else if (cubesAreInCorrectPosition(this.cubeD(), this.cubeH(), 1, 2, RubiksCube.w))
      positionsOfNonApparentWhiteCubesInCorrectLinearPosition = "DH";
    else if (cubesAreInCorrectPosition(this.cubeF(), this.cubeH(), 0, 2, RubiksCube.w))
      positionsOfNonApparentWhiteCubesInCorrectLinearPosition = "FH";
    else if (cubesAreInCorrectPosition(this.cubeA(), this.cubeB(), 0, 1, RubiksCube.w)
      && this.cubeA().faceColors()[1].equals(RubiksCube.w))
      positionsOfNonApparentWhiteCubesInCorrectLinearPosition = "AB";
    else if (cubesAreInCorrectPosition(this.cubeA(), this.cubeC(), 0, 2, RubiksCube.w)
      && this.cubeA().faceColors()[2].equals(RubiksCube.w))
      positionsOfNonApparentWhiteCubesInCorrectLinearPosition = "AC";
    else if (cubesAreInCorrectPosition(this.cubeB(), this.cubeD(), 0, 2, RubiksCube.w)
      && this.cubeB().faceColors()[2].equals(RubiksCube.w))
      positionsOfNonApparentWhiteCubesInCorrectLinearPosition = "BD";
    else if (cubesAreInCorrectPosition(this.cubeC(), this.cubeD(), 0, 1, RubiksCube.w)
      && this.cubeC().faceColors()[1].equals(RubiksCube.w))
      positionsOfNonApparentWhiteCubesInCorrectLinearPosition = "CD";
    return positionsOfNonApparentWhiteCubesInCorrectLinearPosition;
  }

  public void addExplanation(String explanation) {
    listOfExplanations.add(explanation);
    listOfSizes.add(listOfAlgorithms.size());
  }

  public void searchFor2NonApparentWhiteCubesInCorrectLinearPosition_executeAlgorithmIfFound() {
    if (this.numOfCubesWithWhiteOnUface() > 2)
      return;
    if (this.numOfCubesWithWhiteOnUface() == 1) {
      switch (this.cubesWithWhiteOnUface()[0].position()) {
      case 'A':
        switch (this.positionsOfNonApparentWhiteCubesInCorrectLinearPosition()) {
        case "BD":
          this.R();
          this.B();
          if (this.cubeA().faceColors()[1].equals(this.cubeD().faceColors()[2])) {
            this.Fi();
            this.Ri();
            this.D();
            this.R();
          }
          break;
        case "BF":
          if (this.cubeA().faceColors()[2].equals(this.cubeF().faceColors()[1])) {
            this.R(2);
            this.B();
          } else if (this.cubeA().faceColors()[2].equals(this.cubeB().faceColors()[0])) {
            this.Ri();
            this.U();
            this.R(2);
          } else if (this.cubeA().faceColors()[1].equals(this.cubeF().faceColors()[1])) {
            if (this.cubesWithWhiteOnBlayer_excludingBface().length > 0) {
              int previousAlgorithmListSize = listOfAlgorithms.size();
              if (this.cubeD().faceColors()[2].equals(RubiksCube.w))
                this.B();
              else if (this.cubeH().faceColors()[0].equals(RubiksCube.w))
                this.B(2);
              else if (this.cubeG().faceColors()[2].equals(RubiksCube.w))
                this.Bi();
              if (listOfAlgorithms.size() > previousAlgorithmListSize)
                this.addExplanation(
                  "Bring another white cube onto the U face and pair it with the existing white cube.");
            }
            this.R();
          } else if (this.cubeA().faceColors()[1].equals(this.cubeB().faceColors()[0])) {
            this.Ri();
            this.U();
            this.R();
            this.Fi();
          }
          break;
        case "CD":
          this.Bi();
          this.Ri();
          if (this.cubeA().faceColors()[2].equals(this.cubeD().faceColors()[1])) {
            this.L();
            this.B();
            this.Di();
            this.Bi();
          }
          break;
        case "CG":
          break;
        case "DH":
          break;
        case "EF":
          break;
        case "EG":
          break;
        case "FH":
          break;
        case "GH":
          break;
        }
        break;
      case 'B':
        break;
      case 'C':
        break;
      case 'D':
        break;
      }
      switch (this.positionsOfNonApparentWhiteCubesInCorrectLinearPosition()) {
      }
    } else if (this.numOfCubesWithWhiteOnUface() == 2) {
    }

    if (cubesAreInCorrectPosition(this.cubeA(), this.cubeE(), 1, 2, RubiksCube.w))
      if (this.cubeA().faceColors()[2].equals(RubiksCube.w))
        this.F();
      else
        this.Li();
    else if (cubesAreInCorrectPosition(this.cubeB(), this.cubeF(), 1, 2, RubiksCube.w))
      if (this.cubeB().faceColors()[2].equals(RubiksCube.w))
        this.Fi();
      else
        this.R();
    else if (cubesAreInCorrectPosition(this.cubeE(), this.cubeF(), 0, 1, RubiksCube.w))
      if (this.cubeE().faceColors()[0].equals(RubiksCube.w))
        this.F(2);
      else {
        this.Fi();
        this.R();
      } else if (cubesAreInCorrectPosition(this.cubeE(), this.cubeG(), 0, 2, RubiksCube.w))
      if (this.cubeE().faceColors()[0].equals(RubiksCube.w))
        this.L(2);
      else {
        this.Li();
        this.F();
      } else if (cubesAreInCorrectPosition(this.cubeC(), this.cubeG(), 1, 2, RubiksCube.w))
      if (this.cubeC().faceColors()[1].equals(RubiksCube.w))
        this.L();
      else
        this.Bi();
    else if (cubesAreInCorrectPosition(this.cubeG(), this.cubeH(), 0, 1, RubiksCube.w)) {
      if (this.cubeG().faceColors()[0].equals(RubiksCube.w))
        this.B(2);
      else {
        this.Bi();
        this.L();
      }
    } else if (cubesAreInCorrectPosition(this.cubeD(), this.cubeH(), 1, 2, RubiksCube.w))
      if (this.cubeD().faceColors()[1].equals(RubiksCube.w))
        this.Ri();
      else
        this.B();
    else if (cubesAreInCorrectPosition(this.cubeF(), this.cubeH(), 0, 2, RubiksCube.w))
      if (this.cubeF().faceColors()[0].equals(RubiksCube.w))
        this.R(2);
      else {
        this.R();
        this.Fi();
      } else if (cubesAreInCorrectPosition(this.cubeA(), this.cubeB(), 0, 1, RubiksCube.w)
      && this.cubeA().faceColors()[1].equals(RubiksCube.w)) {
      this.F();
      this.R();
    } else if (cubesAreInCorrectPosition(this.cubeA(), this.cubeC(), 0, 2, RubiksCube.w)
      && this.cubeA().faceColors()[2].equals(RubiksCube.w)) {
      this.L();
      this.F();
    } else if (cubesAreInCorrectPosition(this.cubeB(), this.cubeD(), 0, 2, RubiksCube.w)
      && this.cubeB().faceColors()[2].equals(RubiksCube.w)) {
      this.Ri();
      this.Fi();
    } else if (cubesAreInCorrectPosition(this.cubeC(), this.cubeD(), 0, 1, RubiksCube.w)
      && this.cubeC().faceColors()[1].equals(RubiksCube.w)) {
      this.F();
      this.R();
    }
  }

  public void searchFor2NonApparentWhiteCubesInCorrectPosition_executeAlgorithmIfFound() {
    for (int i = 0; i < 2; i++) {
      if (this.numOfCubesWithWhiteOnUface() > 2)
        return;
      if (cubesAreInCorrectPosition(this.cubeA(), this.cubeE(), 1, 2, RubiksCube.w))
        if (this.cubeA().faceColors()[2].equals(RubiksCube.w))
          this.F();
        else
          this.Li();
      else if (cubesAreInCorrectPosition(this.cubeB(), this.cubeF(), 1, 2, RubiksCube.w))
        if (this.cubeB().faceColors()[2].equals(RubiksCube.w))
          this.Fi();
        else
          this.R();
      else if (cubesAreInCorrectPosition(this.cubeE(), this.cubeF(), 0, 1, RubiksCube.w))
        if (this.cubeE().faceColors()[0].equals(RubiksCube.w))
          this.F(2);
        else {
          this.Fi();
          this.R();
        } else if (cubesAreInCorrectPosition(this.cubeE(), this.cubeG(), 0, 2, RubiksCube.w))
        if (this.cubeE().faceColors()[0].equals(RubiksCube.w))
          this.L(2);
        else {
          this.Li();
          this.F();
        } else if (cubesAreInCorrectPosition(this.cubeC(), this.cubeG(), 1, 2, RubiksCube.w))
        if (this.cubeC().faceColors()[1].equals(RubiksCube.w))
          this.L();
        else
          this.Bi();
      else if (cubesAreInCorrectPosition(this.cubeG(), this.cubeH(), 0, 1, RubiksCube.w)) {
        if (this.cubeG().faceColors()[0].equals(RubiksCube.w))
          this.B(2);
        else {
          this.Bi();
          this.L();
        }
      } else if (cubesAreInCorrectPosition(this.cubeD(), this.cubeH(), 1, 2, RubiksCube.w))
        if (this.cubeD().faceColors()[1].equals(RubiksCube.w))
          this.Ri();
        else
          this.B();
      else if (cubesAreInCorrectPosition(this.cubeF(), this.cubeH(), 0, 2, RubiksCube.w))
        if (this.cubeF().faceColors()[0].equals(RubiksCube.w))
          this.R(2);
        else {
          this.R();
          this.Fi();
        } else if (cubesAreInCorrectPosition(this.cubeA(), this.cubeF(), 0, 2, RubiksCube.w)
        || cubesAreInCorrectPosition(this.cubeB(), this.cubeE(), 0, 2, RubiksCube.w)) {
        this.Li();
        this.R();
      } else if (cubesAreInCorrectPosition(this.cubeA(), this.cubeG(), 0, 1, RubiksCube.w)
        || cubesAreInCorrectPosition(this.cubeC(), this.cubeE(), 0, 1, RubiksCube.w)) {
        this.F();
        this.Bi();
      } else if (cubesAreInCorrectPosition(this.cubeC(), this.cubeH(), 0, 2, RubiksCube.w)
        || cubesAreInCorrectPosition(this.cubeD(), this.cubeG(), 0, 2, RubiksCube.w)) {
        this.L();
        this.Ri();
      } else if (cubesAreInCorrectPosition(this.cubeB(), this.cubeH(), 0, 1, RubiksCube.w)
        || cubesAreInCorrectPosition(this.cubeD(), this.cubeF(), 0, 1, RubiksCube.w)) {
        this.Fi();
        this.B();
      } else if (cubesAreInCorrectPosition(this.cubeE(), this.cubeH(), 1, 2, RubiksCube.w)
        || cubesAreInCorrectPosition(this.cubeF(), this.cubeG(), 1, 2, RubiksCube.w)) {
        this.R(2);
        this.L(2);
      } else if (cubesAreInCorrectPosition(this.cubeA(), this.cubeB(), 0, 1, RubiksCube.w)
        && this.cubeA().faceColors()[1].equals(RubiksCube.w)) {
        this.F();
        this.R();
      } else if (cubesAreInCorrectPosition(this.cubeA(), this.cubeC(), 0, 2, RubiksCube.w)
        && this.cubeA().faceColors()[2].equals(RubiksCube.w)) {
        this.L();
        this.F();
      } else if (cubesAreInCorrectPosition(this.cubeB(), this.cubeD(), 0, 2, RubiksCube.w)
        && this.cubeB().faceColors()[2].equals(RubiksCube.w)) {
        this.Ri();
        this.Fi();
      } else if (cubesAreInCorrectPosition(this.cubeC(), this.cubeD(), 0, 1, RubiksCube.w)
        && this.cubeC().faceColors()[1].equals(RubiksCube.w)) {
        this.F();
        this.R();
      }
      if (this.layerU_isSolved()) {
        listOfSizes.add(listOfAlgorithms.size() - 1);
        listOfExplanations.add("Pair the first two white cubes on the U face.");
        listOfSizes.add(listOfAlgorithms.size());
        listOfExplanations.add("Bring the properly oriented pair of white cubes to the U face.");
      } else if (listOfSizes.size() == 0 && listOfAlgorithms.size() > 0) {
        if (i == 0)
          listOfExplanations.add("Bring the properly oriented pair of white cubes to the U face.");
        else
          listOfExplanations.add("Bring the other properly oriented pair of white cubes to the U face.");
        listOfSizes.add(listOfAlgorithms.size());
      } else if (listOfSizes.size() > 0 && listOfAlgorithms.size() > listOfSizes.get(listOfSizes.size() - 1)) {
        if (i == 0)
          listOfExplanations.add("Bring the properly oriented pair of white cubes to the U face.");
        else
          listOfExplanations.add("Bring the other properly oriented pair of white cubes to the U face.");
        listOfSizes.add(listOfAlgorithms.size());
      }
    }
  }

  public void algorithm_NoCubesWithWhiteOnUface() {
    if (this.numOfCubesWithWhiteOnUface() != 0)
      return;
    if (this.cubesWithWhiteOnDlayer_excludingDface().length > 0) {
      switch (this.cubesWithWhiteOnDlayer_excludingDface()[0].position()) {
      case 'E':
        if (this.cubesWithWhiteOnDlayer_excludingDface()[0].faceColors()[1].equals(RubiksCube.w))
          this.Li();
        else
          this.F();
        break;
      case 'F':
        if (this.cubesWithWhiteOnDlayer_excludingDface()[0].faceColors()[1].equals(RubiksCube.w))
          this.R();
        else
          this.Fi();
        break;
      case 'G':
        if (this.cubesWithWhiteOnDlayer_excludingDface()[0].faceColors()[1].equals(RubiksCube.w))
          this.L();
        else
          this.Bi();
        break;
      case 'H':
        if (this.cubesWithWhiteOnDlayer_excludingDface()[0].faceColors()[1].equals(RubiksCube.w))
          this.Ri();
        else
          this.B();
        break;
      }
    } else if (this.cubesWithWhiteOnUlayer_excludingUface().length > 0) {
      switch (this.cubesWithWhiteOnUlayer_excludingUface()[0].position()) {
      case 'A':
        if (this.cubesWithWhiteOnUlayer_excludingUface()[0].faceColors()[1].equals(RubiksCube.w))
          this.Li();
        else
          this.F();
        break;
      case 'B':
        if (this.cubesWithWhiteOnUlayer_excludingUface()[0].faceColors()[1].equals(RubiksCube.w))
          this.R();
        else
          this.Fi();
        break;
      case 'C':
        if (this.cubesWithWhiteOnUlayer_excludingUface()[0].faceColors()[1].equals(RubiksCube.w))
          this.L();
        else
          this.Bi();
        break;
      case 'D':
        if (this.cubesWithWhiteOnUlayer_excludingUface()[0].faceColors()[1].equals(RubiksCube.w))
          this.Ri();
        else
          this.B();
        break;
      }
    } else if (this.cubesWithWhiteOnDlayer_excludingDface().length == 0
      && this.cubesWithWhiteOnUlayer_excludingUface().length == 0) {
      this.R(2);
      this.L(2);
    }
    if (this.numOfCubesWithWhiteOnUface() == 1)
      listOfExplanations.add("Bring a white cube on to the U face.");
    else if (this.numOfCubesWithWhiteOnUface() == 2)
      listOfExplanations.add("Bring two white cubes on to the U face.");
    listOfSizes.add(listOfAlgorithms.size());
  }

  public Cube[] cubesWithWhiteOnUlayer_excludingUface() {
    ArrayList<Cube> cubesWithWhiteOnUlayer_excludingUface = new ArrayList<Cube>();
    for (Cube x : this.whiteCubes())
      if (x.isInUlayer() && x.faceColors()[0].equals(RubiksCube.w) == false)
        cubesWithWhiteOnUlayer_excludingUface.add(x);
    return toCubeArray(cubesWithWhiteOnUlayer_excludingUface);
  }

  public Cube[] cubesWithWhiteOnDlayer_excludingDface() {
    ArrayList<Cube> cubesWithWhiteOnDlayer_excludingDface = new ArrayList<Cube>();
    for (Cube x : this.whiteCubes())
      if (x.isInDlayer() && x.faceColors()[0].equals(RubiksCube.w) == false)
        cubesWithWhiteOnDlayer_excludingDface.add(x);
    return toCubeArray(cubesWithWhiteOnDlayer_excludingDface);
  }

  public Cube[] cubesWithWhiteOnRlayer_excludingRface() {
    ArrayList<Cube> cubesWithWhiteOnRlayer_excludingRface = new ArrayList<Cube>();
    for (Cube x : this.whiteCubes())
      if (x.isInRlayer() && x.faceColors()[2].equals(RubiksCube.w) == false)
        cubesWithWhiteOnRlayer_excludingRface.add(x);
    return toCubeArray(cubesWithWhiteOnRlayer_excludingRface);
  }

  public Cube[] cubesWithWhiteOnLlayer_excludingLface() {
    ArrayList<Cube> cubesWithWhiteOnLlayer_excludingLface = new ArrayList<Cube>();
    for (Cube x : this.whiteCubes())
      if (x.isInLlayer() && x.faceColors()[2].equals(RubiksCube.w) == false)
        cubesWithWhiteOnLlayer_excludingLface.add(x);
    return toCubeArray(cubesWithWhiteOnLlayer_excludingLface);
  }

  public Cube[] cubesWithWhiteOnFlayer_excludingFface() {
    ArrayList<Cube> cubesWithWhiteOnFlayer_excludingFface = new ArrayList<Cube>();
    for (Cube x : this.whiteCubes())
      if (x.isInFlayer() && x.faceColors()[1].equals(RubiksCube.w) == false)
        cubesWithWhiteOnFlayer_excludingFface.add(x);
    return toCubeArray(cubesWithWhiteOnFlayer_excludingFface);
  }

  public Cube[] cubesWithWhiteOnBlayer_excludingBface() {
    ArrayList<Cube> cubesWithWhiteOnBlayer_excludingBface = new ArrayList<Cube>();
    for (Cube x : this.whiteCubes())
      if (x.isInBlayer() && x.faceColors()[1].equals(RubiksCube.w) == false)
        cubesWithWhiteOnBlayer_excludingBface.add(x);
    return toCubeArray(cubesWithWhiteOnBlayer_excludingBface);
  }

  public Cube[] cubesWithWhiteOnUface() {
    Cube[] cubesWithWhiteOnUface = new Cube[this.numOfCubesWithWhiteOnUface()];
    int cubesWithWhiteOnUface_Index = 0;
    for (int i = 0; i < this.whiteCubes().length; i++)
      if (this.whiteCubes()[i].faceColors()[0].equals(RubiksCube.w) && this.whiteCubes()[i].isInUlayer())
        cubesWithWhiteOnUface[cubesWithWhiteOnUface_Index++] = this.whiteCubes()[i];
    return cubesWithWhiteOnUface;
  }

  public Cube[] cubesWithWhiteOnDface() {
    Cube[] cubesWithWhiteOnDface = new Cube[this.numOfCubesWithWhiteOnDface()];
    int cubesWithWhiteOnDface_Index = 0;
    for (int i = 0; i < this.whiteCubes().length; i++)
      if (this.whiteCubes()[i].faceColors()[0].equals(RubiksCube.w) && this.whiteCubes()[i].isInDlayer())
        cubesWithWhiteOnDface[cubesWithWhiteOnDface_Index++] = this.whiteCubes()[i];
    return cubesWithWhiteOnDface;
  }

  public Cube[] whiteCubes() {
    Cube[] whiteCubes = new Cube[4];
    int whiteCubes_Index = 0;
    for (int i = 0; i < this.Cubes().length; i++)
      if (this.Cubes()[i].containsWhite())
        whiteCubes[whiteCubes_Index++] = this.Cubes()[i];
    return whiteCubes;
  }

  public Cube[] yellowCubes() {
    Cube[] yellowCubes = new Cube[4];
    int yellowCubesIndex = 0;
    for (int i = 0; i < this.Cubes().length; i++)
      if (this.Cubes()[i].containsYellow())
        yellowCubes[yellowCubesIndex++] = this.Cubes()[i];
    return yellowCubes;
  }

  public int numOfCubesWithYellowOnDface() {
    int numOfCubesWithYellowOnDface = 0;
    for (Cube x : this.yellowCubes())
      if (x.faceColors()[0].equals(RubiksCube.y) && x.isInDlayer())
        numOfCubesWithYellowOnDface++;
    return numOfCubesWithYellowOnDface;
  }

  public Cube[] cubesWithYellowOnDface() {
    Cube[] cubesWithYellowOnDface = new Cube[this.numOfCubesWithYellowOnDface()];
    int cubesWithYellowOnDface_Index = 0;
    for (int i = 0; i < this.yellowCubes().length; i++)
      if (this.yellowCubes()[i].faceColors()[0].equals(RubiksCube.y) && this.yellowCubes()[i].isInDlayer())
        cubesWithYellowOnDface[cubesWithYellowOnDface_Index++] = this.yellowCubes()[i];
    return cubesWithYellowOnDface;
  }

  public void algorithm_YellowFace_Left_Unconventional() {
    this.L();
    this.D();
    this.Li();
    this.D();
    this.L();
    this.D(2);
    this.Li();
  }

  public void algorithm_YellowFace_Right_Unconventional() {
    this.Ri();
    this.Di();
    this.R();
    this.Di();
    this.Ri();
    this.Di(2);
    this.R();
  }

  public void algorithm_OneCubeWithYellowOnDface() {
    if (this.numOfCubesWithYellowOnDface() != 1)
      return;
    switch (this.cubesWithYellowOnDface()[0].position()) {
    case 'E':
      if (this.cubeF().faceColors()[1].equals(RubiksCube.y))
        this.algorithm_YellowFace_Right_Unconventional();
      else {
        this.D();
        this.algorithm_YellowFace_Left_Unconventional();
      }
      break;
    case 'F':
      if (this.cubeE().faceColors()[1].equals(RubiksCube.y))
        this.algorithm_YellowFace_Left_Unconventional();
      else {
        this.Di();
        this.algorithm_YellowFace_Right_Unconventional();
      }
      break;
    case 'G':
      if (this.cubeH().faceColors()[1].equals(RubiksCube.y)) {
        this.D(2);
        this.algorithm_YellowFace_Left_Unconventional();
      } else {
        this.D();
        this.algorithm_YellowFace_Right_Unconventional();
      }
      break;
    case 'H':
      if (this.cubeG().faceColors()[1].equals(RubiksCube.y)) {
        this.D(2);
        this.algorithm_YellowFace_Right_Unconventional();
      } else {
        this.Di();
        this.algorithm_YellowFace_Left_Unconventional();
      }
      break;
    }
  }

  public void algorithm_YellowFace_Unconventional() {
    if (this.faceD_isSolved())
      return;
    if (this.numOfCubesWithYellowOnDface() == 0)
      this.algorithm_YellowFace_Left_Unconventional();
    while (this.numOfCubesWithYellowOnDface() == 2) {
      switch ("" + this.cubesWithYellowOnDface()[0].position() + this.cubesWithYellowOnDface()[1].position()) {
      case "EF":
      case "FE":
        this.D(2);
        break;
      case "EG":
      case "GE":
        this.Di();
        break;
      case "FH":
      case "HF":
        this.D();
        break;
      }
      this.algorithm_YellowFace_Left_Unconventional();
      if (this.numOfCubesWithYellowOnDface() == 0)
        this.algorithm_YellowFace_Left_Unconventional();
    }
    if (this.numOfCubesWithYellowOnDface() == 1)
      this.algorithm_OneCubeWithYellowOnDface();
  }

  public void algorithm_finalStep_Unconventional() {
    this.Li();
    this.F();
    this.Li();
    this.B(2);
    this.L();
    this.Fi();
    this.Li();
    this.B(2);
    this.L(2);
    this.Di();
  }

  public boolean layerD_isSolved() {
    if (cubesAreInCorrectPosition(this.cubeE(), this.cubeF(), 0, 1, RubiksCube.y)
      && cubesAreInCorrectPosition(this.cubeG(), this.cubeH(), 0, 1, RubiksCube.y)
      && cubesAreInCorrectPosition(this.cubeE(), this.cubeG(), 0, 2, RubiksCube.y)
      && cubesAreInCorrectPosition(this.cubeF(), this.cubeH(), 0, 2, RubiksCube.y))
      return true;
    return false;
  }

  public boolean layerU_isSolved() {
    if (cubesAreInCorrectPosition(this.cubeA(), this.cubeB(), 0, 1, RubiksCube.w)
      && cubesAreInCorrectPosition(this.cubeC(), this.cubeD(), 0, 1, RubiksCube.w)
      && cubesAreInCorrectPosition(this.cubeA(), this.cubeC(), 0, 2, RubiksCube.w)
      && cubesAreInCorrectPosition(this.cubeB(), this.cubeD(), 0, 2, RubiksCube.w))
      return true;
    return false;
  }

  public void verifyThatCubeIsSolved_ifNotExecuteAlgorithm() {
    if (this.isSolved() == false && this.layerU_isSolved() && this.layerD_isSolved() == false) {
      this.D(2);
      this.algorithm_finalStep_Unconventional();
    }
    while (this.isSolved() == false && this.layerD_isSolved() && this.layerU_isSolved())
      this.U();
  }

  public void algorithm_finalStep_YellowLayer_Unconventional() {
    if (this.faceD_isSolved() == false || this.layerD_isSolved() == true)
      return;
    if (cubesAreInCorrectPosition(this.cubeE(), this.cubeF(), 0, 1, RubiksCube.y))
      this.D(2);
    else if (cubesAreInCorrectPosition(this.cubeE(), this.cubeG(), 0, 2, RubiksCube.y))
      this.Di();
    else if (cubesAreInCorrectPosition(this.cubeF(), this.cubeH(), 0, 2, RubiksCube.y))
      this.D();
    this.algorithm_finalStep_Unconventional();
  }

  public void solveCube() {
    this.algorithm_WhiteLayer();
    this.algorithm_YellowLayer();
    this.verifyThatCubeIsSolved_ifNotExecuteAlgorithm();
    solved = true;
  }

  void resetLists() {
    listOfAlgorithms = new ArrayList<String>();
    listOfAlgorithms_original = new ArrayList<String>();
    listOfExplanations = new ArrayList<String>();
    listOfSizes = new ArrayList<Integer>();
  }

  public void solve() {
    showCounter = true;
    resetLists();
    initialCubes = copyOf(this.Cubes);
    this.solveCube();
    solved = true;
    this.update(initialCubes);
    moveSequence = sequence(this.algorithmList());
  }

  public void algorithm_YellowLayer() {
    this.algorithm_YellowFace_Unconventional();
    this.algorithm_finalStep_YellowLayer_Unconventional();
  }

  public void algorithm_WhiteLayer() {
    if (this.numOfCubesWithWhiteOnUface() == 0) {
      this.searchFor2NonApparentWhiteCubesInCorrectPosition_executeAlgorithmIfFound();
      this.algorithm_NoCubesWithWhiteOnUface();
    }
    if (this.numOfCubesWithWhiteOnUface() == 1) {
      this.searchFor2NonApparentWhiteCubesInCorrectLinearPosition_executeAlgorithmIfFound();
      this.algorithm_OneCubeWithWhiteOnUface();
    }
    if (this.first2WhiteCubesAreInCorrectPosition() == false)
      this.algorithm_ProperlyPositionFirst2WhiteCubes();
    if (this.numOfCubesWithWhiteOnUface() == 2) {
      this.searchFor2NonApparentWhiteCubesInCorrectLinearPosition_executeAlgorithmIfFound();
      this.algorithm_TwoCubesWithWhiteOnUface_InCorrectPosition();
    }
    if (this.first3WhiteCubesAreInCorrectPosition() == false) {
      this.algorithm_ProperlyPositionFirst3WhiteCubes();
    }
    if (this.numOfCubesWithWhiteOnUface() == 3)
      this.algorithm_ThreeCubesWithWhiteOnUface_InCorrectPosition();
  }

  public void displayAlgorithmList() {
    System.out.println(Arrays.toString(listOfAlgorithms.toArray()));
  }

  public void displayOptimizedAlgorithmList() {
    optimizeAlgorithmList();
    this.displayAlgorithmList();
  }

  public void displayAlgorithmList_Formatted() {
    for (int i = 0; i < listOfAlgorithms.size(); i++) {
      System.out.print(listOfAlgorithms.get(i));
      if (listOfAlgorithms.get(i).length() == 1)
        System.out.print(" ");
      if (i == listOfAlgorithms.size() - 1)
        System.out.print(" = ");
      else
        System.out.print(" + ");
      if ((i + 1) % 8 == 0)
        System.out.println("\n");
    }
    System.out.println("[" + listOfAlgorithms.size() + "]");
  }

  public void displayOptimizedAlgorithmList_Formatted() {
    optimizeAlgorithmList();
    this.displayAlgorithmList_Formatted();
  }

  public void displayOriginalAlgorithmList_Formatted() {
    optimizeAlgorithmList();
    for (int i = 0; i < listOfAlgorithms_original.size(); i++) {
      System.out.print(listOfAlgorithms_original.get(i));
      if (listOfAlgorithms_original.get(i).length() == 1)
        System.out.print(" ");
      if (i == listOfAlgorithms_original.size() - 1)
        System.out.print(" = ");
      else
        System.out.print(" + ");
      if ((i + 1) % 8 == 0)
        System.out.println("\n");
    }
    System.out.println("[" + listOfAlgorithms_original.size() + "]");
  }

  public void displayExplanations() {
    int index = 0;
    for (int i = 0; i < listOfExplanations.size(); i++) {
      System.out.print("#" + (i + 1) + ") ");
      System.out.println(listOfExplanations.get(i));
      System.out.print(" -> ");
      String[] algorithm = new String[listOfSizes.get(i) - index];
      for (int j = index; j < algorithm.length + index; j++)
        algorithm[j - index] = listOfAlgorithms_original.get(j);
      System.out.println(Arrays.toString(algorithm) + "\n");
      index += algorithm.length;
    }
    System.out.println(" -- The cube is now solved! -- ");
  }

  public RubiksCube_2x2 new_RubiksCube_2x2 (Move[] scrambleAlgorithm) {
    RubiksCube_2x2 scramble = new RubiksCube_2x2(cubes);
    for (Move m : scrambleAlgorithm)
      if (m.equals(F))
        scramble.F();
      else if (m.equals(Fi))
        scramble.Fi();
      else if (m.equals(L))
        scramble.L();
      else if (m.equals(Li))
        scramble.Li();
      else if (m.equals(D))
        scramble.D();
      else if (m.equals(Di))
        scramble.Di();
      else if (m.equals(R))
        scramble.R();
      else if (m.equals(Ri))
        scramble.Ri();
      else if (m.equals(B))
        scramble.B();
      else if (m.equals(Bi))
        scramble.Bi();
      else if (m.equals(U))
        scramble.U();
      else if (m.equals(Ui))
        scramble.Ui();
    return scramble;
  }

  public RubiksCube_2x2 scramble (ArrayList<Move> scrambleAlgorithm) {
    Cube[] cubes = new Cube[8];
    cubes[0] = new Cube(RubiksCube.WBR, RubiksCube.A, 1);
    cubes[1] = new Cube(RubiksCube.WBP, RubiksCube.B, 1);
    cubes[2] = new Cube(RubiksCube.WGR, RubiksCube.C, 1);
    cubes[3] = new Cube(RubiksCube.WGP, RubiksCube.D, 1);
    cubes[4] = new Cube(RubiksCube.YBR, RubiksCube.E, 1);
    cubes[5] = new Cube(RubiksCube.YBP, RubiksCube.F, 1);
    cubes[6] = new Cube(RubiksCube.YGR, RubiksCube.G, 1);
    cubes[7] = new Cube(RubiksCube.YGP, RubiksCube.H, 1);
    RubiksCube_2x2 scramble = new RubiksCube_2x2(cubes);
    for (Move m : scrambleAlgorithm)
      if (m.equals(F))
        scramble.F();
      else if (m.equals(Fi))
        scramble.Fi();
      else if (m.equals(L))
        scramble.L();
      else if (m.equals(Li))
        scramble.Li();
      else if (m.equals(D))
        scramble.D();
      else if (m.equals(Di))
        scramble.Di();
      else if (m.equals(R))
        scramble.R();
      else if (m.equals(Ri))
        scramble.Ri();
      else if (m.equals(B))
        scramble.B();
      else if (m.equals(Bi))
        scramble.Bi();
      else if (m.equals(U))
        scramble.U();
      else if (m.equals(Ui))
        scramble.Ui();
    return scramble;
  }
}
