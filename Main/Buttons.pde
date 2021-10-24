
ArrayList <UserButton> allButtons = new ArrayList<UserButton>();

final String square = "sqaure", circle = "circle", rect = "rect", option = "option";

final String homeName = "Home";
UserButton Home = new UserButton(homeName);

final String controlsName = "Controls";
UserButton Controls = new UserButton(controlsName);

final String scrambleName = "Scramble";
UserButton scrambleUserButton = new UserButton(scrambleName);

final String solveName = "Solve";
UserButton solveUserButton = new UserButton(solveName);

final String inputCubeName = "Input Your Own Cube";
UserButton inputCubeUserButton = new UserButton(inputCubeName);

UserButton[] UserButtons = {Home, Controls, scrambleUserButton, solveUserButton, inputCubeUserButton};

final String leftName = "left";
UserButton left = new UserButton(leftName);
final String upName = "up";
UserButton up = new UserButton(upName);
final String rightName = "right";
UserButton right = new UserButton(rightName);
final String downName = "down";
UserButton down = new UserButton(downName);
final String middleName = "middle";
UserButton middle = new UserButton(middleName);
final String cancelName = "cancel";
UserButton cancel = new UserButton(cancelName);

final String fName = "F";
UserButton f = new UserButton(fName);
final String fiName = "Fi";
UserButton fi = new UserButton(fiName);
final String rName = "R";
UserButton r = new UserButton(rName);
final String riName = "Ri";
UserButton ri = new UserButton(riName);
final String uName = "U";
UserButton u = new UserButton(uName);
final String uiName = "Ui";
UserButton ui = new UserButton(uiName);
final String lName = "L";
UserButton l = new UserButton(lName);
final String liName = "Li";
UserButton li = new UserButton(liName);
final String dName = "D";
UserButton d = new UserButton(dName);
final String diName = "Di";
UserButton di = new UserButton(diName);
final String bName = "B";
UserButton b = new UserButton(bName);
final String biName = "Bi";
UserButton bi = new UserButton(biName);

UserButton[] controlButtons = {left, right, up, down, middle, cancel, f, fi, r, ri, u, ui, l, li, d, di, b, bi};

final String pieceOption1Name = "pieceOption1";
UserButton pieceOption1 = new UserButton(pieceOption1Name);
final String pieceOption2Name = "pieceOption2";
UserButton pieceOption2 = new UserButton(pieceOption2Name);
final String pieceOption3Name = "pieceOption3";
UserButton pieceOption3 = new UserButton(pieceOption3Name);
final String pieceOption4Name = "pieceOption4";
UserButton pieceOption4 = new UserButton(pieceOption4Name);
final String pieceOption5Name = "pieceOption5";
UserButton pieceOption5 = new UserButton(pieceOption5Name);
final String pieceOption6Name = "pieceOption6";
UserButton pieceOption6 = new UserButton(pieceOption6Name);
final String pieceOption7Name = "pieceOption7";
UserButton pieceOption7 = new UserButton(pieceOption7Name);
final String pieceOption8Name = "pieceOption8";
UserButton pieceOption8 = new UserButton(pieceOption8Name);

final String colorOption1Name = "colorOption1";
UserButton colorOption1 = new UserButton(colorOption1Name);
final String colorOption2Name = "colorOption2";
UserButton colorOption2 = new UserButton(colorOption2Name);
final String colorOption3Name = "colorOption3";
UserButton colorOption3 = new UserButton(colorOption3Name);

UserButton[] optionButtons = {pieceOption1, pieceOption2, pieceOption3, pieceOption4, pieceOption5, pieceOption6, pieceOption7, pieceOption8, colorOption1, colorOption2, colorOption3};

final String doneButtonName = "Click Here When Done";
UserButton doneButton = new UserButton(doneButtonName);

void buttonSetup() {
  scrambleUserButton.setup();
  solveUserButton.setup();
  inputCubeUserButton.setup();
  Controls.setup();
  Home.setup();
  cancel.setup();
  left.setup();
  up.setup();
  right.setup();
  down.setup();
  middle.setup();
  f.setup();
  fi.setup();
  r.setup();
  ri.setup();
  u.setup();
  ui.setup();
  l.setup();
  li.setup();
  d.setup();
  di.setup();
  b.setup();
  bi.setup();
  pieceOption1.setup();
  pieceOption2.setup();
  pieceOption3.setup();
  pieceOption4.setup();
  pieceOption5.setup();
  pieceOption6.setup();
  pieceOption7.setup();
  pieceOption8.setup();
  colorOption1.setup();
  colorOption2.setup();
  colorOption3.setup();
  doneButton.setup();
  allButtonSetup();
}

void allButtonSetup() {
  for (UserButton uB : UserButtons)
    allButtons.add(uB);
  for (UserButton uB : controlButtons)
    allButtons.add(uB);
  for (UserButton uB : optionButtons)
    allButtons.add(uB);
}

void controlButtonsDraw() {
  for (UserButton uB : controlButtons)
    uB.draw();
}

color controlsBgColor = color (252, 228, 8);
float controlsText_X = 0, controlsText_Y = 0, controlsX = 0, controlsY = 0, controlsWidth = 0, controlsHeight = 0;

void controlsPressed() {
  if (inputCubeUserButton.pressed || executing) {
    Controls.pressed = false;
    return;
  }
  fill(controlsBgColor);
  rect(controlsX, controlsY, controlsWidth, controlsHeight);
  fill(black);
  textSize(controlsTextSize);
  text(controlsText, controlsText_X, controlsText_Y);
  fill(blue);
  text(controlsText, controlsText_X + 1, controlsText_Y - 1);
  stroke(blue);
  float shift = 0.01435 * controlsHeight;
  strokeWeight(2.34);
  line(controlsText_X, controlsText_Y + shift, controlsText_X + textWidth(controlsText), controlsText_Y + shift);
  controlButtonsDraw();
}

void buttonDraw() {
  if (rotating)
    return;
  for (UserButton uB : UserButtons)
    uB.draw();
  if (Controls.pressed)
    controlsPressed();
  if (inputCubeUserButton.pressed) 
    inputCubePressed();
  doneButton.draw();
}

void showMessage(String s) {
  fill(black);
  rect(bannerX, bannerY - bannerHeight, bannerWidth, bannerHeight);
  fill (white);
  textSize(1.25 * alertTextSize);
  text(s, bannerX + (bannerWidth - textWidth(s)) / 2.0, bannerY - (bannerHeight - textHeight(s)) / 2.0);
}

void showOptions_Pieces() {
  cam.beginHUD(); 
  pieceOption1.draw();
  pieceOption2.draw();
  pieceOption3.draw();
  pieceOption4.draw();
  pieceOption5.draw();
  pieceOption6.draw();
  pieceOption7.draw();
  pieceOption8.draw();
  cam.endHUD();
}

void showOptions_Colors() {
  cam.beginHUD(); 
  colorOption1.draw();
  colorOption2.draw();
  colorOption3.draw();
  cam.endHUD();
}

int positionCounter = 0, faceIndex = 0;

void promptUser_PositionInfo () {
  if (positionCounter == 7) {
    selectedCube = cubeOptions.remove(0);
    promptUser_Position = !promptUser_Position;
    return;
  }
  if (positionCounter == 4 && !userCubeFlipped) {
    flipCubeView = true;
    promptUser_FlipCube();
  } else {
    showMessage("Which Piece Is In The Highlighted Position?");
    switch (positionCounter) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 5:
    case 6:
    case 7:
      highlight(positionCounter % 4);
      break;
    case 4:
      highlight(7);
      break;
    }
    showOptions_Pieces();
  }
}

boolean userCubeFlipped = false, userCubeFlipped_Animation = false;

void flipReset() {   
  Ri();
  Ri();
  L();
  L();
  U();
  Di();
}

void promptUser_FlipCube() {
  deactivateOptionButtons();
  showMessage("Please Flip Your Rubik's Cube As Shown Below.");
}

void promptUser_OrientationInfo() {
  if (positionCounter == 4) {
    flipCubeView = true;
    promptUser_FlipCube();
  } else
    unhighlight(positionCounter % 4);
  if (userCubeFlipped_Animation || positionCounter < 4) {
    flipCubeView = false;
    activateOptionButtons_Orientation();
    showMessage("Which Color Is On The Highlighted Face?");
    if (positionCounter != 4)
      highlight(positionCounter % 4, faceIndex);
    showOptions_Colors();
  }
}

boolean promptUser_Position = true;
Cube selectedCube = new Cube();
String selectedColor = "";

void inputCubePressed() {
  if (inputCubeUserButton.pressed)
    if (promptUser_Position)
      promptUser_PositionInfo();
    else
      promptUser_OrientationInfo();
}

Cube[] backupCubes = new Cube[8];

void backupCubeSetup() {
  for (int i = 0; i < 8; i++)
    backupCubes[i] = new Cube();
}

void updateInputCube() {
  int orientation = -1;
  switch (selectedColor) {
  case RubiksCube.w:
  case RubiksCube.y:
    orientation = 1;
    break;
  case RubiksCube.b:
  case RubiksCube.g:
    orientation = 2;
    break;
  case RubiksCube.r:
  case RubiksCube.p:
    orientation = 3;
    break;
  } 
  cubes[positionCounter % 4] = new Cube (selectedCube.name, char (positionCounter % 4 + 65), orientation);
  input.update();
  animationSetup();
  if (positionCounter < 7)
    positionCounter++;
  else {  
    resetInputCube();
    moves = new ArrayList<Move>();
  }
}

float showOptions_PiecesWidthFloat = 0, showOptions_PiecesX_Float = 0, showOptions_PiecesY_Float = 0;

int suspendCount = 0;

void cubeOptionRemove(int i) {
  selectedCube = cubeOptions.remove(i);
  switch(suspendCount) {
  case 0:
    pieceOption8.suspend();
    break;
  case 1:
    pieceOption7.suspend();
    break;
  case 2:
    pieceOption6.suspend();
    break;
  case 3:
    pieceOption5.suspend();
    break;
  case 4:
    pieceOption4.suspend();
    break;
  case 5:
    pieceOption3.suspend();
    break;
  case 6:
    pieceOption2.suspend();
    break;
  case 7:
    pieceOption1.suspend();
    break;
  }
  suspendCount++;
}
