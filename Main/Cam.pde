
void camSetup() {
  double screenWidth = displayWidth, screenHeight = displayHeight, screenRatio = screenWidth / screenHeight;
  double distance = -140.625 * (screenRatio - 1.6) + 425;
  cam = new PeasyCam(this, distance);
  cam.setMinimumDistance(distance);
  cam.setMaximumDistance(distance);
  cam.setResetOnDoubleClick(false);  
  deactivateCam();
}

void activateCam() {
  camActive = true;
  cam.setActive(camActive);
}

void deactivateCam() {
  camActive = false;
  cam.setActive(camActive);
}

void orientCam() {
  rotateX((float)-Math.PI/5.5);
  rotateY((float)Math.PI/4);
  flipCubeView();
}

boolean flipCubeView = false;
float flipSpeed = 8.5, flipInterval = (float)(Math.PI / 1000), flipCubeAngleX = 0, flipCubeAngleY = 0;
int flipCubeLastQuestionWaitTime = 0;

void flipCubeView_LastQuestion () {
  if (flipCubeView && flipCubeAngleX < Math.PI && flipCubeAngleY < Math.PI/2) {
    flipCubeAngleX += 2 * flipSpeed * flipInterval;
    flipCubeAngleY += flipSpeed * flipInterval;
  }
  if (flipCubeAngleX >= Math.PI && flipCubeAngleY >= Math.PI/2) {
    flipCubeLastQuestionWaitTime++;
    if (flipCubeLastQuestionWaitTime > 40) {
      flipCubeAngleX = 0;
      flipCubeAngleY = 0;
      flipCubeView = false;
      flipCubeLastQuestionWaitTime = 0;
    }
    if (flipCubeLastQuestionWaitTime == 0 && userCubeFlipped) {
      userCubeFlipped_Animation = true;
      flipReset();
      cubes = input.Cubes();
      input.update();
      flipCubeView = false;
    }
  }
}

boolean flipCubeView_User = false;

void flipCubeView () {
  if (flipCubeView_User && flipCubeAngleX < Math.PI && flipCubeAngleY < Math.PI/2) {
    flipCubeAngleX += 2 * flipSpeed * flipInterval;
    flipCubeAngleY += flipSpeed * flipInterval;
    if (flipCubeAngleX >= Math.PI && flipCubeAngleY >= Math.PI/2) {
      flipReset();
      flipCubeAngleX = 0;
      flipCubeAngleY = 0;
      flipCubeView_User = false;
    }
  }
  rotateX(flipCubeAngleX);
  rotateY(flipCubeAngleY);
  flipCubeView_LastQuestion();
}

void resetCam() {
  if (goingHome)
    return;
  cam.reset(300);
  atHome = true;
}

void checkFreezeCube() {
  if (mousePressed) {
    mouseClickedX = mouseX;
    mouseClickedY = mouseY;
  }
  if (mouseInsideButton() && !Home.insideButton())
    freezeCam();
  else
    unfreezeCam();
}

void checkFreezeCam() {
  if (freezeCam && frozenState != null)
    cam.setState(frozenState);
}

void freezeCam() {
  freezeCam = true;
  frozenState = cam.getState();
}

void unfreezeCam() {
  freezeCam = false;
  frozenState = null;
}

int mouseX_rotation = -1, mouseY_rotation = -1, mouseClickedX = -1, mouseClickedY = -1, 
  mouseX_firstClick = -1, mouseY_firstClick = -1;
boolean firstClick = true, mouseHeld = false;

boolean mouseInsideButton() {
  if (mousePressed) {
    if (mouseHeld == false) {
      mouseClickedX = mouseX;
      mouseClickedY = mouseY;
    }
    mouseHeld = true;
  } else
    mouseHeld = false;
  for (UserButton uB : allButtons)
    if (!rotating && uB.insideButton() && uB.active == true && uB.suspend == false)
      return true;
  return false;
}

int mouseHeld_MarginForError = 1;

boolean mouseHeld_Moved () {
  return abs(mouseX_firstClick - mouseX) > mouseHeld_MarginForError || abs(mouseY_firstClick  - mouseY) > mouseHeld_MarginForError;
}

void checkRotation() {
  if (mousePressed) {
    mouseHoldCount++;  
    mouseX_rotation = mouseX;
    mouseY_rotation = mouseY;
    if (firstClick) { 
      mouseX_firstClick = mouseX;
      mouseY_firstClick = mouseY;
      firstClick = false;
    }
    if (mouseHoldCount > mouseHoldThreshold) 
      rotating = true;
    if (mouseHeld_Moved()) {
      rotating = true;
      atHome = false;
    }
  } else if (!mousePressed) {
    rotating = false;
    firstClick = true;
  }
}
