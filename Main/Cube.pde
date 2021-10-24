
public class Cube extends RubiksCube {

  private String name;
  private char position;
  private int orientation;

  public Cube() {
    name = "default";
    position = 'z';
    orientation = 0;
  }

  public Cube(String cubeName, char cubePosition, int cubeOrientation) {
    this.name = cubeName;
    this.position = cubePosition;
    this.orientation = cubeOrientation;
  }

  public Cube copy () {
    return new Cube(name, position, orientation);
  }

  public String name() {
    return this.name;
  }

  public void changeNameTo(String s) {
    this.name = s;
  }

  public char position() {
    return this.position;
  }

  public void changePositionTo(char c) {
    this.position = c;
  }

  public int orientation() {
    return this.orientation;
  }

  public void changeOrientationTo(int i) {
    this.orientation = i;
  }

  public String[] faces() {
    String f1 = "", f2 = "", f3 = "";
    switch (this.name()) {
    case WBR:
      f1 = w;
      f2 = b;
      f3 = r;
      break;
    case WBP:
      f1 = w;
      f2 = b;
      f3 = p;
      break;
    case WGR:
      f1 = w;
      f2 = g;
      f3 = r;
      break;
    case WGP:
      f1 = w;
      f2 = g;
      f3 = p;
      break;
    case YBR:
      f1 = y;
      f2 = b;
      f3 = r;
      break;
    case YBP:
      f1 = y;
      f2 = b;
      f3 = p;
      break;
    case YGR:
      f1 = y;
      f2 = g;
      f3 = r;
      break;
    case YGP:
      f1 = y;
      f2 = g;
      f3 = p;
      break;
    }
    String[] faces = { f1, f2, f3 };
    return faces;
  }

  public int[] faceNumbers() {
    int num1 = 0, num2 = 1, num3 = 2;
    if (this.orientationType() == 2) {
      num2 = 2;
      num3 = 1;
    }
    int[] faceNumbers = { num1, num2, num3 };
    return faceNumbers;
  }

  public int orientationType() {
    int orientationType = 1;
    switch (this.position()) {
    case A:
    case D:
    case F:
    case G:
      switch (this.name()) {
      case WBP:
      case WGR:
      case YBR:
      case YGP:
        orientationType = 2;
        break;
      }
      break;
    case B:
    case C:
    case E:
    case H:
      switch (this.name()) {
      case WBR:
      case WGP:
      case YBP:
      case YGR:
        orientationType = 2;
        break;
      }
      break;
    }
    return orientationType;
  }

  public String[] faceDesignations() {
    String u = "U", d = "D", r = "R", l = "L", b = "B", f = "F";
    String face1 = "", face2 = "", face3 = "";
    switch (this.position()) {
    case A:
      face1 = u;
      face2 = f;
      face3 = l;
      break;
    case B:
      face1 = u;
      face2 = f;
      face3 = r;
      break;
    case C:
      face1 = u;
      face2 = b;
      face3 = l;
      break;
    case D:
      face1 = u;
      face2 = b;
      face3 = r;
      break;
    case E:
      face1 = d;
      face2 = f;
      face3 = l;
      break;
    case F:
      face1 = d;
      face2 = f;
      face3 = r;
      break;
    case G:
      face1 = d;
      face2 = b;
      face3 = l;
      break;
    case H:
      face1 = d;
      face2 = b;
      face3 = r;
      break;
    }
    String[] faceDesignations = { face1, face2, face3 };
    return faceDesignations;
  }

  public String[] faceColors() {
    String face1 = "", face2 = "", face3 = "";
    String[] faces = this.faces();
    int[] faceNumbers = this.faceNumbers();
    if (this.orientationType() == 1) {
      switch (this.orientation()) {
      case 1:
        face1 = faces[faceNumbers[0]];
        face2 = faces[faceNumbers[1]];
        face3 = faces[faceNumbers[2]];
        break;
      case 2:
        face1 = faces[faceNumbers[1]];
        face2 = faces[faceNumbers[2]];
        face3 = faces[faceNumbers[0]];
        break;
      case 3:
        face1 = faces[faceNumbers[2]];
        face2 = faces[faceNumbers[0]];
        face3 = faces[faceNumbers[1]];
        break;
      }
    } else {
      switch (this.orientation()) {
      case 1:
        face1 = faces[faceNumbers[0]];
        face2 = faces[faceNumbers[1]];
        face3 = faces[faceNumbers[2]];
        break;
      case 2:
        face1 = faces[faceNumbers[2]];
        face2 = faces[faceNumbers[0]];
        face3 = faces[faceNumbers[1]];
        break;
      case 3:
        face1 = faces[faceNumbers[1]];
        face2 = faces[faceNumbers[2]];
        face3 = faces[faceNumbers[0]];
        break;
      }
    }
    String[] faceColors = { face1, face2, face3 };
    return faceColors;
  }

  public int conjugateOrientation(int n) {
    switch (colorID(this.faceColors()[n])) {
    case 1:
      if (this.orientation() == 2)
        return 3;
      else
        return 2;
    case 2:
      if (this.orientation() == 1)
        return 3;
      else
        return 1;
    case 3:
      if (this.orientation() == 1)
        return 2;
      else
        return 1;
    }
    return -1;
  }

  public int indexOf(String c) {
    int index = -1;
    for (int i = 0; i < this.faceColors().length; i++)
      if (this.faceColors()[i].equals(c))
        index = i;
    return index;
  }

  public boolean containsWhite() {
    if (this.name().equals(RubiksCube.WBR) || this.name().equals(RubiksCube.WGR)
      || this.name().equals(RubiksCube.WBP) || this.name().equals(RubiksCube.WGP))
      return true;
    return false;
  }

  public boolean containsYellow() {
    if (this.name().equals(RubiksCube.YBR) || this.name().equals(RubiksCube.YGR)
      || this.name().equals(RubiksCube.YBP) || this.name().equals(RubiksCube.YGP))
      return true;
    return false;
  }

  public boolean isDiagonalTo(Cube arg, char layer) {
    switch (layer) {
    case 'U':
      if ((this.position() == 'A' && arg.position() == 'D') || (this.position() == 'B' && arg.position() == 'C')
        || (this.position() == 'D' && arg.position() == 'A')
        || (this.position() == 'C' && arg.position() == 'B'))
        return true;
    }
    return false;
  }

  public boolean isInUlayer() {
    if (this.position() == 'A' || this.position() == 'C' || this.position() == 'D' || this.position() == 'B')
      return true;
    return false;
  }

  public boolean isInDlayer() {
    if (this.position() == 'E' || this.position() == 'F' || this.position() == 'H' || this.position() == 'G')
      return true;
    return false;
  }

  public boolean isInLlayer() {
    if (this.position() == 'A' || this.position() == 'E' || this.position() == 'G' || this.position() == 'C')
      return true;
    return false;
  }

  public boolean isInRlayer() {
    if (this.position() == 'B' || this.position() == 'D' || this.position() == 'H' || this.position() == 'F')
      return true;
    return false;
  }

  public boolean isInFlayer() {
    if (this.position() == 'A' || this.position() == 'B' || this.position() == 'F' || this.position() == 'E')
      return true;
    return false;
  }

  public boolean isInBlayer() {
    if (this.position() == 'C' || this.position() == 'G' || this.position() == 'H' || this.position() == 'D')
      return true;
    return false;
  }

  public String toString() {
    return this.name + " (" + this.position + this.orientation + ")";
  }
}
