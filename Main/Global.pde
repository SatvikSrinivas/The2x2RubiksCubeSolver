
final int dim = 2;
Cubie[] cubies = new Cubie[(int)(Math.pow(dim, 3))];

PeasyCam cam;

Move currentMove;
Move F, U, R, L, D, B, Fi, Ui, Ri, Li, Di, Bi, defaultMove;

boolean running = false, print = true, solved = false, random_Solve = false, tryMe = false, solve = false, 
  keepCounter = false, scramble = false, goingUp = true, showCounter = false, showTitle = true, showMove = true, 
  showSolveAlert = false, showInputAlert = false, inputCube = false, executing = false, 
  highlightInputCubeButton = false, freezeCam = false, rotating = false, atHome = true, 
  waitThenSolve = false, waitThenScramble = false, goingHome = false, resetMultiplier = false, 
  showFaceNames = false, firstClick_Middle = true, camActive = false, scrambling = false, solving = false, allowKeyPressed = true;

ArrayList<Move> moves = new ArrayList<Move>();
ArrayList<Move> moveList = new ArrayList<Move>();
ArrayList<Move> scrambleAlgorithm = new ArrayList<Move>();
ArrayList<String> solveAlgorithm = new ArrayList<String>();
ArrayList<String> debugSolveAlgorithm = new ArrayList<String>();
Move[] moveSequence = {};
int counter = 0, printNum = 0, solveLength = -1;

Cube[] cubes = new Cube[8];
Cube[] initialCubes = new Cube[8];
RubiksCube_2x2 input;

float multiplier = 1;

int bgColor = 155, titleColor = 255, initialBgColor = bgColor, increment = 5, 
  width = 200, height = 50, stopWatch = 0, randomCheck = -1, counterKeep = -1, 
  counterX, counterY, solveAlert = 0, keepTimer = 0, keepTime = 300, inputAlert = 0, 
  highlightInputCube = 0, highlightInputWait = 0, highlightInputSleep = 0, highlightInputCubeCount = 0, 
  goingHomeResetCount = 0, stall = 0;

final color baseColor = color(23), white = color(255), yellow = color(255, 251, 41), blue = color (0, 40, 255), 
  green = color(1, 145, 15), red = color (255, 0, 0), purple = color(94, 0, 219), black = color(0), 
  backgroundColor = color (bgColor, 59, 30), skyBlue = color (135, 206, 235), cyan = color (0, 255, 255), 
  orange = color (242, 98, 35), pink = color(255, 0, 255), highlightColor = cyan, baseButtonColor = color (155, 15, 230);

final float origDisplayWidth = 1366, origDisplayHeight = 768;

CameraState frozenState = null;
