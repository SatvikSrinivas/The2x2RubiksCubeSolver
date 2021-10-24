
boolean debug = false, debugReverse = false, autoDebug = true;
int debugCount = -1, debugInt = 0;
Move debugMove;
float textWidth = 0, highlightX, highlightY, debugTextSize = 20;

void debugShow (String s) {
  cam.beginHUD();
  fill(white);
  text(s, 200, 920);
  cam.endHUD();
}

void showDebugCount() {
  cam.beginHUD();
  fill(white);
  text(""+debugCount, 100, 140);
  cam.endHUD();
}

void debugSetup() {
  input.solve();
  input.optimizeAlgorithmList();
  solveAlgorithm = input.listOfAlgorithms;
  for (String s : solveAlgorithm)
    debugSolveAlgorithm.add(s);
}

float algorithmX, algorihtmY, algorithmWidth, algorithmHeight;

void debug() {
  if (showDebugFlag)
    displayDebugFlag();
  algorithmX = 0.05 * displayWidth; 
  algorihtmY = 0.825 * displayHeight; 
  algorithmWidth = 0.85 * displayWidth; 
  algorithmHeight = 0.2 * displayHeight;
  debug = true;
  textSize(debugTextSize);
  debug_Fast();
  autoDebug();  
  showSolveInfo();
  //debug_Slow();
}

int numOfSuccessfulSolves = 0;
boolean autoSolve = true;

int startNextSolveCount = 0;
boolean startNextSolve = true;

final int autoDebugWaitTime = 100;
double totalMoves = 0;

void autoDebug() {
  if (startNextSolve)
    startNextSolveCount++;
  if (!autoDebug || executing || startNextSolveCount < autoDebugWaitTime)
    return;
  if (autoSolve) {
    if (!autoDebug_verifySolve)
      solve();
  } else 
  scramble();
}

void showSolveInfo() {
  if (numOfSuccessfulSolves == 0)
    return;
  float x = displayWidth - (counterCenterX + (counterDiameter / 2.0)), s = 0.0937 * displayWidth, y = 0.4 * (displayHeight - s);
  cam.beginHUD();
  text ("Successful Solves: "+numOfSuccessfulSolves, x, y);
  double avg = totalMoves / numOfSuccessfulSolves;
  text ("Average Solve Length: " + (avg), x, y + textHeight(""));
  cam.endHUD();
}

void debug_Fast() {
  multiplier = Float.MAX_VALUE;
  text("Scramble Algorithm: "+scrambleAlgorithm, algorithmX, algorihtmY, algorithmWidth, algorithmHeight);
}

void debug_Slow() {
  highlightX = algorithmX;
  highlightY = algorihtmY;
  highlightMove();
  fill(white);
  text("Solve Algorithm: "+debugSolveAlgorithm+ " == (" + debugSolveAlgorithm.size()+ ")", algorithmX, algorihtmY, algorithmWidth, algorithmHeight);
  if (debugCount == -1)
    return;
  debugCounter();
  debugShowMove();
}

void highlightMove() {
  if (debugCount == -1)
    return;
  textSize(debugTextSize);
  textWidth = textWidth("Solve Algorithm:  ");
  for (int i = 0; i < debugCount; i++)
    textWidth += textWidth(debugSolveAlgorithm.get(i) + ", ");
  noStroke();
  fill(black);
  rect(highlightX + textWidth, highlightY, 1.10 * textWidth("   "), textHeight(""));
}

void debugMove() {
  if (debugCount < 0 || debugCount > debugSolveAlgorithm.size() - 1)
    return;
  Move m = defaultMove;
  switch(debugSolveAlgorithm.get(debugCount)) {
  case F_ :
    m = F;
    break;
  case Fi_ :
    m = Fi;
    break;
  case L_ :
    m = L;
    break;
  case Li_ :
    m = Li;
    break;
  case R_ :
    m = R;
    break;
  case Ri_ :
    m = Ri;
    break;
  case B_ :
    m = B;
    break;
  case Bi_ :
    m = Bi;
    break;
  case D_ :
    m = D;
    break;
  case Di_ :
    m = Di;
    break;
  case U_ :
    m = U;
    break;
  case Ui_ :
    m = Ui;
    break;
  }
  if (debugReverse) {
    m.inverse().start();
    debugCount--;
    m = m.inverse();
  } else {
    if (input.isSolved())
      return;
    m.start();
  }
  debugMove = m;
}

void debugCounter() {
  float x = 0.842 * displayWidth, y = 0.5 * displayHeight, d = 0.117 * displayWidth;
  counterDiameter = d;   
  counterCenterX = x;
  fill(black);
  circle(x, y, d);
  String moveNum = "" + (debugCount + 1);
  setCounterTextSize();
  fill(white);
  text (moveNum, x - textWidth(moveNum) / 2.0, y + textHeight(maxCount) / 2.0);
}

void debugShowMove() {
  float x = displayWidth - (counterCenterX + (counterDiameter / 2.0)), s = 0.0937 * displayWidth, y = 0.5 * (displayHeight - s);
  moveBoxSideLength = s;
  fill(black);
  square(x, y, s);
  fill(white);
  setMoveTextSize();
  String moveToShow = debugMove.toString();
  text (moveToShow, x + (s - textWidth(moveToShow)) / 2.0, y + 1.35 * (s - textHeight(moveToShow)));
}

boolean showDebugFlag = false;

void showDebugFlag() {
  showDebugFlag = true;
}

void hideDebugFlag() {
  showDebugFlag = false;
}

color emerald = color(0, 255, 128);

void displayDebugFlag() {
  fill(emerald);
  circle(0.1 * displayWidth, 0.2 * displayHeight, .075 * displayWidth);
}

boolean autoDebug_verifySolve = false;
int autoDebugCount = 0;

void autoDebug_verifySolve() {
  autoDebug_verifySolve = true;
}

void checkAutoDebug() {
  if (autoDebug_verifySolve)
    autoDebugCount++;
  else
    return;
  if (autoDebugCount > autoDebugWaitTime) {
    if (input.isSolved()) {
      autoSolve = false;
      numOfSuccessfulSolves++;
    } else
      autoDebug = false;
    autoDebug_verifySolve = false;
    autoDebugCount = 0;
    totalMoves += solveLength;
  }
}
