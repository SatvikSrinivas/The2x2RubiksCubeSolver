import peasy.*;

void setup() {
  textSizeSetup();
  fullScreen(P3D);
  buttonSetup();
  cubeDrawSetup();
  camSetup();
  instantiateMoves();
  
  //defaultState();
  solvedState();
  //scrambledState();
  //scrambledState(new Move[] {});

  input = new RubiksCube_2x2(cubes);

  animationSetup();
  debugSetup();
  cubeOptionSetup();
  backupCubeSetup();
}

void draw() {   
  welcomeDraw();
  initialDraw();
  startDraw();
  //showDebugCount();
}

void initialDraw() {
  background(backgroundColor); 
  orientCam();
  animationDraw();
  cam.beginHUD();
  title();
  if (!setWelcomeFalse) 
    welcomeMessageDraw();
  cam.endHUD();
}

void startDraw() {
  if (!setWelcomeFalse)
    return;
  checkRotation();
  cam.beginHUD(); //begin2D
  //debug();
  displayCounter();
  buttonDraw();
  cam.endHUD(); //end2D

  showFaceNames();
  solveAlert();
  waitThen();
  resetDraw();
  checkResetMultiplier();
  checkAutoDebug();
}
