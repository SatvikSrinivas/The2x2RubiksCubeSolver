
float keyMultiplier = 10;
boolean nextDebugMove = false;

void keyPressed () {
  if (welcome && keyPressed) {
    setWelcomeFalse = true;
    welcomeIncrement *= 5;
    return;
  }

  if (!allowKeyPressed)
    return;

  switch (key) {
  case 'p':
  case 'P':
    println(inputCubeUserButton.pressed);
    multiplier = 5;
    running = true;
    break;
  case 'k':
  case 'K':
    userCubeFlipped = true;
    break;
  case ' ':
    showFaceNames = !showFaceNames;
    break;
  case 'q':
  case 'Q':
    resetCam();
    break;
  case 'c':
  case 'C':
    Controls.pressed = !Controls.pressed;
    break;
  case 'i':
  case 'I':
    if (executing)
      return;
    inputCube();
    inputCubeUserButton.pressed = inputCube;
    inputCube_mousePressed = true;
    break;
  case '1': 
    scramble();
    break;
  case '2':
    solve();
    break;
  }

  if (executing || turning())
    return;

  if (debug) {
    switch (keyCode) {
    case LEFT: 
      if (debugCount > -1)
        debugReverse = true;
      nextDebugMove = true;
      break;
    case RIGHT: 
      if (debugCount < debugSolveAlgorithm.size() - 1)
        debugCount++;
      debugReverse = false;
      nextDebugMove = true;
      break;
    }
    if (debugCount == -1)
      return;
    if (nextDebugMove)
      debugMove();
    nextDebugMove = false;
  } else {
    switch (keyCode) {
    case UP: 
      Up();
      break;
    case DOWN: 
      Down();
      break;
    case LEFT: 
      Left();
      break;
    case RIGHT: 
      Right();
      break;
    }
  }

  switch(key) {
  case 'y':
  case 'Y':
    flipCubeView_User = true; 
    break;
  case'b': 
    B.start();
    break;
  case'B': 
    Bi.start();
    break;
  case'f': 
    F.start();
    f.pressed = true;
    break;
  case'F': 
    Fi.start();
    break;
  case'u': 
    U.start();
    break;
  case'U': 
    Ui.start();
    break;
  case'd': 
    D.start();
    break;
  case'D': 
    Di.start();
    break;
  case'l': 
    L.start();
    break;
  case'L': 
    Li.start();
    break;
  case'r': 
    R.start();
    break;
  case'R': 
    Ri.start();
    break;
  }
}

boolean turning() {
  if (executing)
    return true;
  Move[] allMoves = {F, U, R, L, D, B, Fi, Ui, Ri, Li, Di, Bi};
  for (Move m : allMoves)
    if (m.animating)
      return true;
  return false;
}

void Up () {
  if (turning())
    return;
  multiplier = keyMultiplier;
  Li.start();
  R.start();
  resetMultiplier();
}

void Down () {
  if (turning())
    return;
  multiplier = keyMultiplier;
  L.start();
  Ri.start();
  resetMultiplier();
}

void Left () {
  if (turning())
    return;
  multiplier = keyMultiplier;
  U.start();
  Di.start();
  resetMultiplier();
}

void Right () {
  if (turning())
    return;
  multiplier = keyMultiplier;
  Ui.start();
  D.start();
  resetMultiplier();
}

void R () {
  input.R();
  for (int i = 0; i < cubies.length; i++)
    if (cubies[i].x == 1)
    {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI);
      matrix.translate(cubies[i].y, cubies[i].z);
      cubies[i].update(round(cubies[i].x), round(matrix.m02), round(matrix.m12));
      cubies[i].updateColorsR();
    }
}

void Ri () {
  input.Ri();
  for (int i = 0; i < cubies.length; i++)
    if (cubies[i].x == 1)
    {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(-HALF_PI);
      matrix.translate(cubies[i].y, cubies[i].z);
      cubies[i].update(round(cubies[i].x), round(matrix.m02), round(matrix.m12));
      cubies[i].updateColorsRi();
    }
}

void L () {
  input.L();
  for (int i = 0; i < cubies.length; i++)
    if (cubies[i].x == -1)
    {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(-HALF_PI);
      matrix.translate(cubies[i].y, cubies[i].z);
      cubies[i].update(round(cubies[i].x), round(matrix.m02), round(matrix.m12));
      cubies[i].updateColorsL();
    }
}

void Li () {
  input.Li();
  for (int i = 0; i < cubies.length; i++)
    if (cubies[i].x == -1)
    {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI);
      matrix.translate(cubies[i].y, cubies[i].z);
      cubies[i].update(round(cubies[i].x), round(matrix.m02), round(matrix.m12));
      cubies[i].updateColorsLi();
    }
}

void D () {
  input.D();
  for (int i = 0; i < cubies.length; i++)
    if (cubies[i].y == 1)
    {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(-HALF_PI);
      matrix.translate(cubies[i].x, cubies[i].z);
      cubies[i].update(round(matrix.m02), round(cubies[i].y), round(matrix.m12));
      cubies[i].updateColorsD();
    }
}

void Di () {
  input.Di();
  for (int i = 0; i < cubies.length; i++)
    if (cubies[i].y == 1)
    {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI);
      matrix.translate(cubies[i].x, cubies[i].z);
      cubies[i].update(round(matrix.m02), round(cubies[i].y), round(matrix.m12));
      cubies[i].updateColorsDi();
    }
}

void U () {
  input.U();
  for (int i = 0; i < cubies.length; i++)
    if (cubies[i].y == -1)
    {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI);
      matrix.translate(cubies[i].x, cubies[i].z);
      cubies[i].update(round(matrix.m02), round(cubies[i].y), round(matrix.m12));
      cubies[i].updateColorsU();
    }
}

void Ui () {
  input.Ui();
  for (int i = 0; i < cubies.length; i++)
    if (cubies[i].y == -1)
    {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(-HALF_PI);
      matrix.translate(cubies[i].x, cubies[i].z);
      cubies[i].update(round(matrix.m02), round(cubies[i].y), round(matrix.m12));
      cubies[i].updateColorsUi();
    }
}

void B () {
  input.B();
  for (int i = 0; i < cubies.length; i++)
    if (cubies[i].z == -1)
    {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(-HALF_PI);
      matrix.translate(cubies[i].x, cubies[i].y);
      cubies[i].update(round(matrix.m02), round(matrix.m12), round(cubies[i].z));
      cubies[i].updateColorsB();
    }
}

void Bi () {
  input.Bi();
  for (int i = 0; i < cubies.length; i++)
    if (cubies[i].z == -1)
    {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI);
      matrix.translate(cubies[i].x, cubies[i].y);
      cubies[i].update(round(matrix.m02), round(matrix.m12), round(cubies[i].z));
      cubies[i].updateColorsBi();
    }
}

void F () {
  input.F();
  for (int i = 0; i < cubies.length; i++)
    if (cubies[i].z == 1)
    {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(HALF_PI);
      matrix.translate(cubies[i].x, cubies[i].y);
      cubies[i].update(round(matrix.m02), round(matrix.m12), round(cubies[i].z));
      cubies[i].updateColorsF();
    }
}

void Fi () {
  input.Fi();
  for (int i = 0; i < cubies.length; i++)
    if (cubies[i].z == 1)
    {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(-HALF_PI);
      matrix.translate(cubies[i].x, cubies[i].y);
      cubies[i].update(round(matrix.m02), round(matrix.m12), round(cubies[i].z));
      cubies[i].updateColorsFi();
    }
}
