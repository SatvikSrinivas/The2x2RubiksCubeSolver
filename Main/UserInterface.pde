
void solve () {
  if (solve || inputCubeUserButton.pressed)
    return;
  if (input.isSolved()) {
    showSolveAlert = true;
    return;
  }
  Controls.pressed = false;
  multiplier = 5;
  if (scramble) 
    solveWhileScrambling();
  else {
    executing = true;
    keepCounter = false;
    solve = true;
    input.solve();
    input.optimizeAlgorithmList();
    solveAlgorithm = input.listOfAlgorithms;
    animationSetup();
    running = true;
  }
}

boolean showSolveWhileScramblingMessage = false;

void solveWhileScrambling() {
  showSolveWhileScramblingMessage = true;
}

boolean showScrambleWhileSolvingMessage = false;

void scrambleWhileSolving() {
  showScrambleWhileSolvingMessage = true;
}

void scramble() {
  if (scramble || scrambling || inputCubeUserButton.pressed)
    return;
  multiplier = 5;
  if (solve)
    scrambleWhileSolving();
  else {
    scrambling = true;
    moves = new ArrayList<Move>();
    input.resetLists();
    showCounter = false;
    scramble = true;
    executing = true;
    randomizeMoveList((int)(((20 * Math.random()) + 10)));
    scrambleAlgorithm = moves;
    animationSetup();
    running = true;
    keepCounter = false;
  }
}

boolean alertShowing() {
  if (showSolveAlert || showSolveWhileScramblingMessage || showScrambleWhileSolvingMessage)
    return true;
  return false;
}

float bannerX, bannerY, bannerWidth, bannerHeight;

void title() {
  if (rotating || alertShowing())
    showTitle = false;
  else
    showTitle = true;
  textSize(titleTextSize);
  fill(255);
  float titleX = (displayWidth - textWidth(title)) / 2, titleY = 0.15 * displayHeight;
  bannerX = titleX;
  bannerY = titleY;
  bannerWidth = textWidth(title);
  bannerHeight = textHeight(title);
  if (showTitle)
    text(title, titleX, titleY);
}

float counterDiameter = 0, counterCenterX;

void counter() {
  if (running && moves.size() > 0) {
    float x = 0.842 * displayWidth, y = 0.5 * displayHeight, d = 0.117 * displayWidth;
    counterDiameter = d;   
    counterCenterX = x;
    fill(black);
    circle(x, y, d);
    String moveNum = "" + (counter + 1);
    setCounterTextSize();
    fill(white);
    text (moveNum, x - textWidth(moveNum) / 2.0, y + textHeight(maxCount) / 2.0);
  }
}

void setCounterTextSize() {
  textSize(counterTextSize);
}

void counter(int counter) {
  if (keepTimer < keepTime) {
    float x = 0.842 * displayWidth, y = 0.5 * displayHeight, d = 0.117 * displayWidth;
    counterDiameter = d;    
    fill(black);
    circle(x, y, d);
    String moveNum = "" + (counter + 1);
    setCounterTextSize();
    fill(white);
    text (moveNum, x - textWidth(moveNum) / 2.0, y + textHeight(maxCount) / 2.0);
  }
}

final String maxMove = "ZZ";
float moveBoxSideLength = 0;

void showMove() {
  if (showMove && keepTimer < keepTime) {
    if (currentMove != null && currentMove.toString() != null) {
      float x = displayWidth - (counterCenterX + (counterDiameter / 2.0)), s = 0.0937 * displayWidth, y = 0.5 * (displayHeight - s);
      moveBoxSideLength = s;
      fill(black);
      square(x, y, s);
      fill(white);
      setMoveTextSize();
      String moveToShow = currentMove.toString();
      text (moveToShow, x + (s - textWidth(moveToShow)) / 2.0, y + 1.35 * (s - textHeight(moveToShow)));
    }
  }
}

void setMoveTextSize() {
  setCounterTextSize();
}

boolean inputCube_Unpressed = true, inputCube_mousePressed = false;

void inputCube() {
  inputCube_mousePressed = true;
  if (inputCube_Unpressed) {
    inputCube_Unpressed = false;
    inputCube = !inputCube;
    if (inputCube == true)
      defaultState();
    else
      solvedState();
    input = new RubiksCube_2x2(cubes);
    animationSetup();
  }
}

void displayCounter() {
  if (showCounter) {
    counter();
    showMove();
  }
  if (keepCounter) {
    counter(counterKeep);
    keepTimer++;
  } else
    keepTimer = 0;
}

void waitThen() {
  if (waitThenSolve)
    waitThenSolve();
  if (waitThenScramble)
    waitThenScramble();
}
