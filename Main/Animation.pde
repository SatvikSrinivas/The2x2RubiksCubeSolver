
void RubiksCube_2x2_setup() {
  int i = 0;
  for (int y = -1; y <= 1; y+=2)
    for (int z = 1; z >= -1; z-=2)  
      for (int x = -1; x <= 1; x+=2) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cubies[i++] = new Cubie(matrix, x, y, z);
      }
}

void animationSetup() {
  RubiksCube_2x2_setup();
  instantiateMoves();

  if (solved) 
    moveSequence = sequence(input.algorithmList());

  if (random_Solve) 
    input.scramble(moves).solve(); 

  for (int a = 0; a < moveSequence.length; a++)  
    moveList.add(moveSequence[a]);

  implementMoves();

  if (moves.size() > 0) {
    currentMove = moves.get(counter);
    currentMove.start();
  } else
    currentMove = defaultMove;
}

void instantiateMoves() {
  F = new Move(0, 0, 1, 1);
  Fi = new Move(0, 0, 1, -1);
  B = new Move(0, 0, -1, -1);
  Bi = new Move(0, 0, -1, 1);
  D = new Move(0, 1, 0, 1);
  Di = new Move(0, 1, 0, -1);
  U = new Move(0, -1, 0, -1);
  Ui = new Move(0, -1, 0, 1);
  R = new Move(1, 0, 0, 1);
  Ri = new Move(1, 0, 0, -1);
  L = new Move(-1, 0, 0, -1);
  Li = new Move(-1, 0, 0, 1);
  defaultMove = new Move(-1, -1, -1, -1);
}

void implementMoves() {
  for (int moveIndex = 0; moveIndex < moveList.size(); moveIndex++) {
    if (moveList.get(moveIndex) == F) 
      moves.add(new Move(0, 0, 1, 1));
    else if (moveList.get(moveIndex) == Fi) 
      moves.add(new Move(0, 0, 1, -1));
    else if (moveList.get(moveIndex) == B) 
      moves.add(new Move(0, 0, -1, -1));
    else if (moveList.get(moveIndex) == Bi) 
      moves.add(new Move(0, 0, -1, 1));
    else if (moveList.get(moveIndex) == D) 
      moves.add(new Move(0, 1, 0, 1));
    else if (moveList.get(moveIndex) == Di) 
      moves.add(new Move(0, 1, 0, -1));
    else if (moveList.get(moveIndex) == U) 
      moves.add(new Move(0, -1, 0, -1));
    else if (moveList.get(moveIndex) == Ui) 
      moves.add(new Move(0, -1, 0, 1));
    else if (moveList.get(moveIndex) == R) 
      moves.add(new Move(1, 0, 0, 1));
    else if (moveList.get(moveIndex) == Ri) 
      moves.add(new Move(1, 0, 0, -1));
    else if (moveList.get(moveIndex) == L) 
      moves.add(new Move(-1, 0, 0, -1));
    else if (moveList.get(moveIndex) == Li) 
      moves.add(new Move(-1, 0, 0, 1));
  }
}

Move randomMove() {
  Move[] allMoves = {F, Fi, R, Ri, L, Li, B, Bi, U, Ui, D, Di};
  return allMoves[(int)(random(allMoves.length))];
}

void randomizeMoveList(int n) {
  instantiateMoves();
  Move lastMove = defaultMove;
  for (int i = 0; i < n; i++) {
    Move m = randomMove();
    if (m.equals(lastMove.inverse()) || m.equals(lastMove.complement()) || m.equals(lastMove.opplement()))
      i--;
    else {
      if (m == F) 
        moves.add(new Move(0, 0, 1, 1));
      else if (m == Fi) 
        moves.add(new Move(0, 0, 1, -1));
      else if (m == B) 
        moves.add(new Move(0, 0, -1, -1));
      else if (m == Bi) 
        moves.add(new Move(0, 0, -1, 1));
      else if (m == D) 
        moves.add(new Move(0, 1, 0, 1));
      else if (m == Di) 
        moves.add(new Move(0, 1, 0, -1));
      else if (m == U) 
        moves.add(new Move(0, -1, 0, -1));
      else if (m == Ui) 
        moves.add(new Move(0, -1, 0, 1));
      else if (m == R) 
        moves.add(new Move(1, 0, 0, 1));
      else if (m == Ri) 
        moves.add(new Move(1, 0, 0, -1));
      else if (m == L) 
        moves.add(new Move(-1, 0, 0, -1));
      else if (m == Li) 
        moves.add(new Move(-1, 0, 0, 1));
      lastMove = m;
    }
  }
}

void randomizeMoveList_Solve(int n) {
  randomizeMoveList(n);
  random_Solve = true;
}

Move[] sequence (ArrayList<String> algorithmList) {
  Move[] sequence = new Move[algorithmList.size()];
  for (int i = 0; i < sequence.length; i++)
    switch (algorithmList.get(i)) {
    case F_: 
      sequence[i] = F;
      break;
    case Fi_: 
      sequence[i] = Fi; 
      break;
    case U_: 
      sequence[i] = U;
      break;
    case Ui_: 
      sequence[i] = Ui;
      break;
    case R_: 
      sequence[i] = R;
      break;
    case Ri_: 
      sequence[i] = Ri;
      break;
    case L_: 
      sequence[i] = L;
      break;
    case Li_: 
      sequence[i] = Li;
      break;
    case D_: 
      sequence[i] = D;
      break;
    case Di_: 
      sequence[i] = Di;
      break;
    case B_: 
      sequence[i] = B;
      break;
    case Bi_: 
      sequence[i] = Bi;
      break;
    }
  return sequence;
}

void defaultState() {
  Cube c = new Cube();
  for (int i = 0; i < cubes.length; i++)
    cubes[i] = c;
}

void solvedState () {
  cubes[0] = new Cube(RubiksCube.WBR, RubiksCube.A, 1);
  cubes[1] = new Cube(RubiksCube.WBP, RubiksCube.B, 1);
  cubes[2] = new Cube(RubiksCube.WGR, RubiksCube.C, 1);
  cubes[3] = new Cube(RubiksCube.WGP, RubiksCube.D, 1);
  cubes[4] = new Cube(RubiksCube.YBR, RubiksCube.E, 1);
  cubes[5] = new Cube(RubiksCube.YBP, RubiksCube.F, 1);
  cubes[6] = new Cube(RubiksCube.YGR, RubiksCube.G, 1);
  cubes[7] = new Cube(RubiksCube.YGP, RubiksCube.H, 1);
}

void scrambledState(Move[] moveArray) {
  solvedState();
  RubiksCube_2x2 r = new RubiksCube_2x2(cubes);
  for (Move m : moveArray) {
    scrambleAlgorithm.add(m);
    if (m == F) 
      r.F();
    else if (m == Fi) 
      r.Fi();
    else if (m == B) 
      r.B();
    else if (m == Bi) 
      r.Bi();
    else if (m == D) 
      r.D();
    else if (m == Di) 
      r.Di();
    else if (m == U) 
      r.U();
    else if (m == Ui) 
      r.Ui();
    else if (m == R) 
      r.R();
    else if (m == Ri) 
      r.Ri();
    else if (m == L) 
      r.L();
    else if (m == Li) 
      r.Li();
  }
  cubes = copyOf(r.Cubes);
}

void scrambledState () {
  instantiateMoves();
  Move[] moveArray = {F, Fi, R, Ri, L, Li, B, Bi, U, Ui, D, Di};
  solvedState();
  RubiksCube_2x2 r = new RubiksCube_2x2(cubes);
  for (int i = 0; i < (int)(((20 * Math.random()) + 10)); i++) {
    Move m = moveArray[(int)(random(moveArray.length))];
    scrambleAlgorithm.add(m);
    if (m == F) 
      r.F();
    else if (m == Fi) 
      r.Fi();
    else if (m == B) 
      r.B();
    else if (m == Bi) 
      r.Bi();
    else if (m == D) 
      r.D();
    else if (m == Di) 
      r.Di();
    else if (m == U) 
      r.U();
    else if (m == Ui) 
      r.Ui();
    else if (m == R) 
      r.R();
    else if (m == Ri) 
      r.Ri();
    else if (m == L) 
      r.L();
    else if (m == Li) 
      r.Li();
  }
  cubes = copyOf(r.Cubes);
}

void reset () {
  cubes[0] = new Cube(RubiksCube.WBR, RubiksCube.A, 1);
  cubes[1] = new Cube(RubiksCube.WBP, RubiksCube.B, 1);
  cubes[2] = new Cube(RubiksCube.WGR, RubiksCube.C, 1);
  cubes[3] = new Cube(RubiksCube.WGP, RubiksCube.D, 1);
  cubes[4] = new Cube(RubiksCube.YBR, RubiksCube.E, 1);
  cubes[5] = new Cube(RubiksCube.YBP, RubiksCube.F, 1);
  cubes[6] = new Cube(RubiksCube.YGR, RubiksCube.G, 1);
  cubes[7] = new Cube(RubiksCube.YGP, RubiksCube.H, 1);
  input.update(cubes);
}

void animationRotation(int i) {
  if (abs(cubies[i].z) == 1 && cubies[i].z == currentMove.z)
    rotateZ(currentMove.angle);
  else if (abs(cubies[i].y) == 1 && cubies[i].y == currentMove.y)
    rotateY(currentMove.angle);
  else if (abs(cubies[i].x) == 1 && cubies[i].x == currentMove.x)
    rotateX(currentMove.angle);
  if (F.animating) {
    if (F.z == cubies[i].z) {
      rotateZ(F.angle);
    } else if (F.y == cubies[i].y) {
      rotateY(F.angle);
    } else if (F.x == cubies[i].x) {
      rotateX(F.angle);
    }
  } else if (Fi.animating) {
    if (Fi.z == cubies[i].z) {
      rotateZ(Fi.angle);
    } else if (Fi.y == cubies[i].y) {
      rotateY(Fi.angle);
    } else if (Fi.x == cubies[i].x) {
      rotateX(Fi.angle);
    }
  } else if (U.animating) {
    if (U.z == cubies[i].z) {
      rotateZ(U.angle);
    } else if (U.y == cubies[i].y) {
      rotateY(U.angle);
    } else if (U.x == cubies[i].x) {
      rotateX(U.angle);
    }
  } else if (Ui.animating) {
    if (Ui.z == cubies[i].z) {
      rotateZ(Ui.angle);
    } else if (Ui.y == cubies[i].y) {
      rotateY(Ui.angle);
    } else if (Ui.x == cubies[i].x) {
      rotateX(Ui.angle);
    }
  } else if (R.animating) {
    if (R.z == cubies[i].z) {
      rotateZ(R.angle);
    } else if (R.y == cubies[i].y) {
      rotateY(R.angle);
    } else if (R.x == cubies[i].x) {
      rotateX(R.angle);
    }
  } else if (Ri.animating) {
    if (Ri.z == cubies[i].z) {
      rotateZ(Ri.angle);
    } else if (Ri.y == cubies[i].y) {
      rotateY(Ri.angle);
    } else if (Ri.x == cubies[i].x) {
      rotateX(Ri.angle);
    }
  } else if (L.animating) {
    if (L.z == cubies[i].z) {
      rotateZ(L.angle);
    } else if (L.y == cubies[i].y) {
      rotateY(L.angle);
    } else if (L.x == cubies[i].x) {
      rotateX(L.angle);
    }
  } else if (Li.animating) {
    if (Li.z == cubies[i].z) {
      rotateZ(Li.angle);
    } else if (Li.y == cubies[i].y) {
      rotateY(Li.angle);
    } else if (Li.x == cubies[i].x) {
      rotateX(Li.angle);
    }
  } else if (D.animating) {
    if (D.z == cubies[i].z) {
      rotateZ(D.angle);
    } else if (D.y == cubies[i].y) {
      rotateY(D.angle);
    } else if (D.x == cubies[i].x) {
      rotateX(D.angle);
    }
  } else if (Di.animating) {
    if (Di.z == cubies[i].z) {
      rotateZ(Di.angle);
    } else if (Di.y == cubies[i].y) {
      rotateY(Di.angle);
    } else if (Di.x == cubies[i].x) {
      rotateX(Di.angle);
    }
  } else if (B.animating) {
    if (B.z == cubies[i].z) {
      rotateZ(B.angle);
    } else if (B.y == cubies[i].y) {
      rotateY(B.angle);
    } else if (B.x == cubies[i].x) {
      rotateX(B.angle);
    }
  } else if (Bi.animating) {
    if (Bi.z == cubies[i].z) {
      rotateZ(Bi.angle);
    } else if (Bi.y == cubies[i].y) {
      rotateY(Bi.angle);
    } else if (Bi.x == cubies[i].x) {
      rotateX(Bi.angle);
    }
  }
}

void keyBoardRotation() {
  if (F.animating)
    F.update();
  else if (Fi.animating)
    Fi.update();
  else if (U.animating)
    U.update();
  else if (Ui.animating)
    Ui.update();
  else if (R.animating)
    R.update();
  else if (Ri.animating)
    Ri.update();
  else if (L.animating)
    L.update();
  else if (Li.animating)
    Li.update();
  else if (D.animating)
    D.update();
  else if (Di.animating)
    Di.update();
  else if (B.animating)
    B.update();
  else if (Bi.animating)
    Bi.update();
}

void executeMoveList () { 
  if (running) {
    debugCount++;
    currentMove.update();
    if (currentMove.finished) {
      if (counter < moves.size()-1) {
        counter++;
        currentMove = moves.get(counter);
        currentMove.start();
      }
    }
  }
  if (counter == moves.size() - 1) {
    moves = new ArrayList<Move>();
    solve = false;
    if (solved) {
      keepCounter = true;
      counterKeep = counter;
      executing = false;
      allowKeyPressed = false;
      resetMultiplier();
      if (showScrambleWhileSolvingMessage) {
        showScrambleWhileSolvingMessage = false;
        waitThenScramble = true;
        solveUserButton.pressed = true;
      } 
      if (autoDebug) {
        solveLength = counter + 1;
        autoDebug_verifySolve();
      }
    }
    if (scramble) {
      scramble = false;
      resetScrambling = true;
      keepCounter = false;
      executing = false;
      allowKeyPressed = false;
      resetMultiplier();
      if (showSolveWhileScramblingMessage) {
        showSolveWhileScramblingMessage = false;
        waitThenSolve = true;
        scrambleUserButton.pressed = true;
      } 
      if (autoDebug) {
        autoSolve = true;
        autoDebug_verifySolve = false;
        startNextSolveCount = 0;
      }
    }
    counter = 0;
    resetRunning = true;
    resetKeyPressed = true;
  }
}

int waitThenSolveCounter = 0;
void waitThenSolve() {
  if (waitThenSolveCounter > 50) {
    solve();
    waitThenSolve = false;
    waitThenSolveCounter = 0;
  } else
    waitThenSolveCounter++;
}

int waitThenScrambleCounter = 0;
void waitThenScramble() {
  if (waitThenScrambleCounter > 50) {
    scramble();
    waitThenScramble = false;
    waitThenScrambleCounter = 0;
  } else
    waitThenScrambleCounter++;
}

void solveAlert() {
  if (rotating)
    return;

  if (counter == 0 && solved && solve)
    showSolveAlert = true;
  if (scramble) {
    showSolveAlert = false;
    showTitle = true;
  }
  if (input.isSolved() == false)    
    showSolveAlert = false;

  if (showSolveAlert) {
    solve = false;
    showTitle = false;
    cam.beginHUD();
    fill(black);
    if (solveAlert < 200) {
      rect(bannerX, bannerY - bannerHeight, bannerWidth, bannerHeight);
      fill (red);
      textSize(alertTextSize);
      text(solveAlertMessage, bannerX + (bannerWidth - textWidth(solveAlertMessage)) / 2.0, bannerY - (bannerHeight - textHeight(solveAlertMessage)) / 2.0);
      solveAlert++;
    } else {
      solveAlert = 0;
      showTitle = true;
      showSolveAlert = false;
      solveUserButton.pressed = false;
    }
    cam.endHUD();
  }

  if (showSolveWhileScramblingMessage)
    showSolveWhileScramblingMessage();
  if (showScrambleWhileSolvingMessage)
    showScrambleWhileSolvingMessage();
}

final String solveWhileScramblingMessage = "The Cube Will Solve After It's Done Scrambling";

void showSolveWhileScramblingMessage() {
  cam.beginHUD();
  fill(black);
  rect(bannerX, bannerY - bannerHeight, bannerWidth, bannerHeight);
  fill (red);
  textSize(alertTextSize);
  text(solveWhileScramblingMessage, bannerX + (bannerWidth - textWidth(solveWhileScramblingMessage)) / 2.0, bannerY - (bannerHeight - textHeight(solveWhileScramblingMessage)) / 2.0);     
  cam.endHUD();
}

final String scrambleWhileSolvingMessage = "The Cube Will Scramble After It's Done Solving";

void showScrambleWhileSolvingMessage() {
  cam.beginHUD();
  fill(black);
  rect(bannerX, bannerY - bannerHeight, bannerWidth, bannerHeight);
  fill (red);
  textSize(alertTextSize);
  text(scrambleWhileSolvingMessage, bannerX + (bannerWidth - textWidth(scrambleWhileSolvingMessage)) / 2.0, bannerY - (bannerHeight - textHeight(scrambleWhileSolvingMessage)) / 2.0);     
  cam.endHUD();
}

void animationDraw() {
  scale(36);
  keyBoardRotation();
  fill(215);
  for (int i = 0; i < cubies.length; i++) {
    push();
    if (currentMove != null)
      animationRotation(i);
    cubies[i].show();
    pop();
  }
  executeMoveList();
}

void cubeDraw(float x, float y, float len) {
  cam.beginHUD();
  stroke(black);
  strokeWeight(4);
  fill (white);
  quad(x, y, x - 0.5 * len, y - 0.2725 * len, x, y - 0.4735 * len, x + 0.5 * len, y - 0.2725 * len);
  fill(blue);
  quad(x, y, x, y + 0.615 * len, x + 0.45 * len, y + 0.3 * len, x + 0.5 * len, y - 0.2725 * len);
  fill(red);
  quad(x, y, x, y + 0.615 * len, x - 0.45 * len, y + 0.3 * len, x - 0.5 * len, y - 0.2725 * len);
  cam.endHUD();
}

float cubeDrawLen = 105;

void cubeDrawSetup() {
  float m = (105.0 - 80.0) / (164.52 - 113.76);
  cubeDrawLen = m * (pieceOption1.buttonLength - 164.52) + 105;
}

void cubeDraw(float x, float y) {
  cubeDraw(x, y, cubeDrawLen);
}

void cubeDraw(float x, float y, color c1, color c2, color c3) {
  cubeDraw(x, y, cubeDrawLen, c1, c2, c3);
}

ArrayList<Cube> cubeOptions = new ArrayList<Cube>();

void cubeOptionSetup () {
  Cube[] cubes = new Cube[8];
  cubes[0] = new Cube(RubiksCube.WBR, 'A', 1);
  cubes[1] = new Cube(RubiksCube.WBP, 'A', 1);
  cubes[2] = new Cube(RubiksCube.WGR, 'A', 1);
  cubes[3] = new Cube(RubiksCube.WGP, 'A', 1);
  cubes[4] = new Cube(RubiksCube.YBR, 'A', 1);
  cubes[5] = new Cube(RubiksCube.YBP, 'A', 1);
  cubes[6] = new Cube(RubiksCube.YGR, 'A', 1);
  cubes[7] = new Cube(RubiksCube.YGP, 'A', 1);
  for (Cube c : cubes)
    cubeOptions.add(c);
}

void cubeDraw(float x, float y, float len, color c1, color c2, color c3) {
  cam.beginHUD();
  stroke(black);
  strokeWeight(4);
  fill (c1);
  quad(x, y, x - 0.5 * len, y - 0.2725 * len, x, y - 0.4735 * len, x + 0.5 * len, y - 0.2725 * len);
  fill(c2);
  quad(x, y, x, y + 0.615 * len, x + 0.45 * len, y + 0.3 * len, x + 0.5 * len, y - 0.2725 * len);
  fill(c3);
  quad(x, y, x, y + 0.615 * len, x - 0.45 * len, y + 0.3 * len, x - 0.5 * len, y - 0.2725 * len);
  cam.endHUD();
}

boolean welcome = true, setWelcomeFalse = false;
float welcomeAngle = 0, welcomeIncrement = 0.025;

void welcomeDraw() {
  if (!welcome)
    return;
  welcomeAngle += welcomeIncrement;
  rotateY((float)welcomeAngle);
  if (welcomeAngle >= 2 * Math.PI) {
    welcomeAngle = 0;
    if (setWelcomeFalse) {
      welcome = false;
      activateCam();
    }
  }
}

void welcomeMessageDraw() {
  textSize (0.65 * titleTextSize);
  float x = (displayWidth - textWidth(welcomeText)) / 2.0, y = 0.925 * displayHeight, m = 1.10;
  fill (black);
  rect (x - ((m - 1) / 2.0) * textWidth(welcomeText), y - 0.825 * textHeight(welcomeText), m * textWidth(welcomeText), m * textHeight(welcomeText));
  fill (white);
  text(welcomeText, x, y);
}
