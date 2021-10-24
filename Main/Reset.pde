
void resetMultiplier () {
  resetMultiplier = true;
}

void checkResetMultiplier() {
  if (resetMultiplier)
    stall++;
  if (stall > 7) {
    stall = 0;
    multiplier = 1;
    resetMultiplier = false;
  }
}

void inputCubeUserButtonReset() {
  if (inputCube_mousePressed && !mousePressed) {
    inputCube_Unpressed = true;
    inputCube_mousePressed = false;
  }
  if (inputCubeUserButton.pressed == false)
    resetInputCube();
}

void solveCubeUserButtonReset() {
  if (input.isSolved())
    solveUserButton.pressed = false;
}

void goingHomeReset() {
  if (goingHome) {
    goingHomeResetCount++;
    if (goingHomeResetCount == 35) {
      goingHome = false;
      goingHomeResetCount = 0;
    }
  }
}

void middleButtonReset() {
  if (!mousePressed) 
    firstClick_Middle = true;
}

void cursorReset() {
  if (mouseInsideButton()) {
    noCursor();
    cubeDraw(mouseX, mouseY, 22.5);
  } else
    cursor();
}

void activateControlButtons() {
  cancel.activate();
  left.activate();
  up.activate();
  right.activate();
  down.activate();
  middle.activate();
  f.activate();
  fi.activate();
  r.activate();
  ri.activate();
  u.activate();
  ui.activate();
  l.activate();
  li.activate();
  d.activate();
  di.activate();
  b.activate();
  bi.activate();
}

void deactivateControlButtons() {
  cancel.deactivate();
  left.deactivate();
  up.deactivate();
  right.deactivate();
  down.deactivate();
  middle.deactivate();
  f.deactivate();
  fi.deactivate();
  r.deactivate();
  ri.deactivate();
  u.deactivate();
  ui.deactivate();
  l.deactivate();
  li.deactivate();
  d.deactivate();
  di.deactivate();
  b.deactivate();
  bi.deactivate();
}

void activateOptionButtons_Position () {
  pieceOption1.activate();
  pieceOption2.activate();
  pieceOption3.activate();
  pieceOption4.activate();
  pieceOption5.activate();
  pieceOption6.activate();
  pieceOption7.activate();
  pieceOption8.activate();
}

void deactivateOptionButtons_Position () {
  pieceOption1.deactivate();
  pieceOption2.deactivate();
  pieceOption3.deactivate();
  pieceOption4.deactivate();
  pieceOption5.deactivate();
  pieceOption6.deactivate();
  pieceOption7.deactivate();
  pieceOption8.deactivate();
}

void activateOptionButtons_Orientation () {
  colorOption1.activate();
  colorOption2.activate();
  colorOption3.activate();
}

void deactivateOptionButtons_Orientation () {
  colorOption1.deactivate();
  colorOption2.deactivate();
  colorOption3.deactivate();
}

void activateOptionButtons() {
  activateOptionButtons_Position();
  activateOptionButtons_Orientation();
}

void deactivateOptionButtons() {
  deactivateOptionButtons_Position();
  deactivateOptionButtons_Orientation();
}

boolean mousePressedActive = true;
int mouseActiveCounter = 0;

void resetActiveButtons() {
  if (atHome)
    Home.deactivate();
  else
    Home.activate();
  if (Controls.pressed)
    activateControlButtons();
  else
    deactivateControlButtons();
  if (inputCubeUserButton.pressed) {
    if (promptUser_Position) {
      activateOptionButtons_Position();
      deactivateOptionButtons_Orientation();
    } else {
      deactivateOptionButtons_Position();
      activateOptionButtons_Orientation();
    }
  } else {
    deactivateOptionButtons_Position();
    deactivateOptionButtons_Orientation();
    userCubeFlipped = false; 
    userCubeFlipped_Animation = false;
  }
  if (!mousePressedActive)
    if (mouseActiveCounter < 10)
      mouseActiveCounter++;
    else {
      mouseActiveCounter = 0;
      mousePressedActive = true;
    }
}

boolean resetRunning = false;
int runningResetCount = 0;

void resetRunning() {
  if (resetRunning)
    runningResetCount++;
  if (runningResetCount > 50) {
    running = false;
    runningResetCount = 0;
    resetRunning = false;
  }
}

void resetInputCube() {
  cubeOptions = new ArrayList<Cube>();
  inputCubeUserButton.pressed = false;
  cubeOptionSetup();
  positionCounter = 0;
  inputCube = false;
  promptUser_Position = true;
  selectedCube = new Cube();
  selectedColor = "";
}

boolean resetScrambling = false;
int scrambleResetCount = 0;

void resetScrambling() {
  if (resetScrambling)
    scrambleResetCount++;
  if (scrambleResetCount > 50) {
    scrambleUserButton.pressed = false;
    scrambling = false;
    scrambleResetCount = 0;
    resetScrambling = false;
  }
}

void movesReset_Running() {
  if (moves.size() > 0) {
    running = true;
    multiplier = 5;
  }
}

void runningReset_InputCube() {
  if (inputCubeUserButton.pressed) {
    running = false;
    moves = new ArrayList<Move>();
  }
}

void movesReset() {
  if (!running) 
    moves = new ArrayList<Move>();
}

void scrambleUserButtonReset() {
  if (!scrambling)
    scrambleUserButton.pressed = false;
}


boolean resetKeyPressed = false;
int resetKeyPressedCount = 0;

void allowKeyPressedReset() {
  if (resetKeyPressed)
    resetKeyPressedCount++;
  if (resetKeyPressedCount > 50) {
    allowKeyPressed = true;
    resetKeyPressedCount = 0;
    resetKeyPressed = false;
  }
}

void resetDraw() {
  inputCubeUserButtonReset();
  goingHomeReset();
  solveCubeUserButtonReset();
  middleButtonReset();
  cursorReset();
  resetActiveButtons();
  resetRunning();
  resetScrambling();
  movesReset_Running();
  runningReset_InputCube();
  movesReset();
  scrambleUserButtonReset();
  allowKeyPressedReset();
}
