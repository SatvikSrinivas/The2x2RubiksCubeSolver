
public static int colorID(String c) {
  if (c.equals(RubiksCube.w) || c.equals(RubiksCube.y))
    return 1;
  if (c.equals(RubiksCube.b) || c.equals(RubiksCube.g))
    return 2;
  if (c.equals(RubiksCube.r) || c.equals(RubiksCube.p))
    return 3;
  return -1;
}

static final String[] WBR_options = { RubiksCube.w, RubiksCube.b, RubiksCube.r };
static final String[] WBP_options = { RubiksCube.w, RubiksCube.b, RubiksCube.p };
static final String[] WGR_options = { RubiksCube.w, RubiksCube.g, RubiksCube.r };
static final String[] WGP_options = { RubiksCube.w, RubiksCube.g, RubiksCube.p };
static final String[] YBR_options = { RubiksCube.y, RubiksCube.b, RubiksCube.r };
static final String[] YBP_options = { RubiksCube.y, RubiksCube.b, RubiksCube.p };
static final String[] YGR_options = { RubiksCube.y, RubiksCube.g, RubiksCube.r };
static final String[] YGP_options = { RubiksCube.y, RubiksCube.g, RubiksCube.p };

public static int Orientation (String cubeName, String primaryFaceColor)
{
  String[] cubeColors = new String[3];
  switch (cubeName) {
  case RubiksCube.WBR:
    cubeColors = WBR_options;
    break;
  case RubiksCube.WBP:
    cubeColors = WBP_options;
    break;
  case RubiksCube.WGR:
    cubeColors = WGR_options;
    break;
  case RubiksCube.WGP:
    cubeColors = WGP_options;
    break;
  case RubiksCube.YBR:
    cubeColors = YBR_options;
    break;
  case RubiksCube.YBP:
    cubeColors = YBP_options;
    break;
  case RubiksCube.YGR:
    cubeColors = YGR_options;
    break;
  case RubiksCube.YGP:
    cubeColors = YGP_options;
    break;
  }

  int orientation = 0;

  if (primaryFaceColor.equals(cubeColors[0]))
  {
    orientation = 1;
  }
  if (primaryFaceColor.equals(cubeColors[1]))
  {
    orientation = 2;
  }
  if (primaryFaceColor.equals(cubeColors[2]))
  {
    orientation = 3;
  }

  return orientation;
}

static final int[] clockwise = { 3, 0, 1, 2 };
static final int[] anti_clockwise = { 1, 2, 3, 0 };

public static String conjugateColorOf(String c) {
  switch (c) {
  case RubiksCube.w:
    return RubiksCube.y;
  case RubiksCube.y:
    return RubiksCube.w;
  case RubiksCube.r:
    return RubiksCube.p;
  case RubiksCube.p:
    return RubiksCube.r;
  case RubiksCube.b:
    return RubiksCube.g;
  case RubiksCube.g:
    return RubiksCube.b;
  }
  return null;
}

public static final String U_ = "U";
public static final String Ui_ = "Ui";
public static final String D_ = "D";
public static final String Di_ = "Di";
public static final String R_ = "R";
public static final String Ri_ = "Ri";
public static final String L_ = "L";
public static final String Li_ = "Li";
public static final String F_ = "F";
public static final String Fi_ = "Fi";
public static final String B_ = "B";
public static final String Bi_ = "Bi";

public static String complementOf(String operation) {
  String complement = "";
  switch (operation) {
  case U_:
    complement = Di_;
    break;
  case Ui_:
    complement = D_;
    break;
  case R_:
    complement = Li_;
    break;
  case Ri_:
    complement = L_;
    break;
  case L_:
    complement = Ri_;
    break;
  case Li_:
    complement = R_;
    break;
  case B_:
    complement = Fi_;
    break;
  case Bi_:
    complement = F_;
    break;
  case F_:
    complement = Bi_;
    break;
  case Fi_:
    complement = B_;
    break;
  case D_:
    complement = Ui_;
    break;
  case Di_:
    complement = U_;
    break;
  }
  return complement;
}

public static String inverseOf(String operation) {
  String inverse = "";
  switch (operation) {
  case U_:
    inverse = Ui_;
    break;
  case Ui_:
    inverse = U_;
    break;
  case R_:
    inverse = Ri_;
    break;
  case Ri_:
    inverse = R_;
    break;
  case L_:
    inverse = Li_;
    break;
  case Li_:
    inverse = L_;
    break;
  case B_:
    inverse = Bi_;
    break;
  case Bi_:
    inverse = B_;
    break;
  case F_:
    inverse = Fi_;
    break;
  case Fi_:
    inverse = F_;
    break;
  case D_:
    inverse = Di_;
    break;
  case Di_:
    inverse = D_;
    break;
  }
  return inverse;
}

public static Cube[] toCubeArray(ArrayList<Cube> cubeArrayList) {
  Cube[] cubeArray = new Cube[cubeArrayList.size()];
  for (int i = 0; i < cubeArray.length; i++)
    cubeArray[i] = cubeArrayList.get(i);
  return cubeArray;
}

public static String string(String[] a) {
  String string = "";
  for (int i = 0; i < a.length; i++) {
    string += a[i] + "\n";
  }
  return string;
}

public static String string(int[] a) {
  String string = "";
  for (int i = 0; i < a.length; i++) {
    string += a[i] + "\n";
  }
  return string;
}

public static String string(Cube[] a) {
  String string = "";
  for (int i = 0; i < a.length; i++) {
    string += "" + a[i] + "\n";
  }
  return string;
}

final static String cubePositionNames = "ABCDEFGH";
final static String header = "2x2 Rubik's Cube Solver";
final static String CubeNamingScheme = "Cube Naming Scheme";

public static String orientationInfo(Cube cube) {
  String face1 = "", face2 = "", face3 = "", f1 = cube.faceDesignations()[0], f2 = cube.faceDesignations()[1], 
    f3 = cube.faceDesignations()[2];
  String[] faces = cube.faces();
  int[] faceNumbers = cube.faceNumbers();
  if (cube.orientationType() == 1) {
    switch (cube.orientation()) {
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
    switch (cube.orientation()) {
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
  return cube.name() + "\n" + f1 + ") " + face1 + "\n" + f2 + ") " + face2 + "\n" + f3 + ") " + face3;
}

public static Cube[] copyOf(Cube[] arr) {
  Cube[] copy = new Cube[arr.length];
  for (int i = 0; i < copy.length; i++)
    copy[i] = arr[i].copy();
  return copy;
}

public static ArrayList<Move> copyOf(ArrayList<Move> arr) {
  ArrayList<Move> copy = new ArrayList<Move>();
  for (int i = 0; i < arr.size(); i++)
    copy.add(arr.get(i));
  return copy;
}

public void highlight (int i) {
  cubies[i].highlight();
}

public void unhighlight (int i) {
  cubies[i].unhighlight();
}

public void highlight (int i, int j) {
  cubies[i].highlight(j);
}

public color toColor (String s) {
  switch (s) {
  case RubiksCube.w: 
    return white;
  case RubiksCube.y: 
    return yellow;
  case RubiksCube.b: 
    return blue;
  case RubiksCube.g: 
    return green;
  case RubiksCube.r: 
    return red;
  case RubiksCube.p: 
    return purple;
  }
  return black;
}
