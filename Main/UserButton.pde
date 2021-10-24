
public class UserButton {

  String name = "", type = "";
  float buttonX, buttonY, buttonWidth, buttonHeight, buttonRadius, buttonLength;
  color defaultButtonColor = color (155, 15, 230), buttonColor = color (155, 15, 230), 
    alternateButtonColor = color (242, 98, 35), originalButtonColor, alternateButtonColor2 = color(39, 180, 102), 
    alternateButtonColor3 = color(21, 118, 187), alternateButtonColor4 = color(16, 160, 197);
  boolean pressed = false, active = false, suspend = false;

  public UserButton(String name) {
    this.name = name;
  }

  public String toString() {
    return this.name;
  }

  public void activate() {
    this.active = true;
  }

  public void deactivate() {
    this.active = false;
  }

  public void suspend() {
    this.suspend = true;
  }

  public void unsuspend () {
    this.suspend = false;
  }

  public void setup() {
    textSize(primaryButtonTextSize);
    switch(name) {
    case scrambleName :
      type = rect;
      buttonX = .0075 * displayWidth;
      buttonY = buttonX;
      buttonWidth = 1.20 * textWidth(scrambleName);
      buttonHeight = 1.20 * textHeight(scrambleName);
      break;
    case solveName :
      type = rect;
      buttonWidth = 0.9 * scrambleUserButton.buttonWidth;
      buttonHeight = 1.05 * textHeight(solveName);
      buttonX = .9925 * displayWidth - buttonWidth;
      buttonY = .0075 * displayWidth;
      break;
    case inputCubeName :
      type = rect;
      buttonWidth = 1.20 * textWidth(inputCubeName);
      buttonHeight = 1.20 * textHeight(inputCubeName);
      buttonX = .0075 * displayWidth;
      buttonY = displayHeight - (buttonHeight + buttonX);
      break;
    case controlsName :
      type = rect;
      buttonWidth = 0.9 * scrambleUserButton.buttonWidth;
      buttonHeight = 1.05 * textHeight(controlsName);
      buttonX = .9925 * displayWidth - buttonWidth;
      buttonY = displayHeight - (buttonHeight + .0075 * displayWidth);
      controlsX = 0.688 * displayWidth;
      controlsY = 0.234 * displayHeight;
      controlsWidth = 0.278 * displayWidth;
      controlsHeight = 0.656 * displayHeight;
      controlsText_X = 0.698 * displayWidth;
      controlsText_Y = 0.862 * displayHeight;
      break;
    case homeName: 
      type = square;
      buttonX = 0.478 * displayWidth;
      buttonY = 0.881 * displayHeight;
      buttonLength = .044 * displayWidth;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      break;
    case cancelName:
      type = square;
      buttonLength = .0146 * displayWidth;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = controlsX + controlsWidth - buttonWidth;
      buttonY = controlsY;
      cancelLineX = buttonX;
      cancelLineY = buttonY;
      break;
    case leftName:
      type = square;
      buttonLength = .175 * controlsWidth;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = controlsX + (controlsWidth - 3.0 * buttonLength) / 4.0;
      buttonY = controlsY + buttonLength + 0.1 * controlsHeight;
      break;
    case rightName:
      type = square; 
      buttonLength = left.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = controlsX + 2.0 * buttonLength + 3.0 * (controlsWidth - 3.0 * buttonLength) / 4.0;
      buttonY = left.buttonY;
      break;
    case upName:
      type = square;
      buttonLength = left.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = controlsX + buttonLength + 2.0 * (controlsWidth - 3.0 * buttonLength) / 4.0;
      buttonY = controlsY + 0.05 * controlsHeight;
      break;
    case downName:
      type = square; 
      buttonLength = left.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = up.buttonX;
      buttonY = controlsY + 2.0 * buttonLength + 0.15 * controlsHeight;
      break;
    case middleName:
      type = square; 
      buttonLength = left.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = up.buttonX;
      buttonY = (down.buttonY + up.buttonY + up.buttonHeight - buttonHeight) / 2.0;
      break;
    case fName:
      type = rect; 
      buttonLength = 0.225 * (controlsText_Y - (down.buttonY + down.buttonLength));
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = controlsX + (controlsWidth - 6.0 * buttonLength) / 7.0;
      buttonY = down.buttonY + down.buttonLength + 0.5 * (controlsText_Y - (down.buttonY + down.buttonLength)) 
        - 1.25 * buttonLength;
      break;
    case fiName:
      type = rect; 
      buttonLength = f.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = f.buttonX;
      buttonY = f.buttonY + 1.25 * f.buttonLength;
      break;
    case rName:
      type = rect; 
      buttonLength = f.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = controlsX + buttonLength + 2.0 * (f.buttonX - controlsX);
      buttonY = f.buttonY;
      break;
    case riName:
      type = rect; 
      buttonLength = f.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = r.buttonX;
      buttonY = fi.buttonY;
      break;
    case uName:
      type = rect; 
      buttonLength = f.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = controlsX + 2.0 * buttonLength + 3.0 * (f.buttonX - controlsX);
      buttonY = f.buttonY;
      break;
    case uiName:
      type = rect; 
      buttonLength = f.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = u.buttonX;
      buttonY = fi.buttonY;
      break;
    case lName:
      type = rect; 
      buttonLength = f.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = controlsX + 3.0 * buttonLength + 4.0 * (f.buttonX - controlsX);
      buttonY = f.buttonY;
      break;
    case liName:
      type = rect; 
      buttonLength = f.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = l.buttonX;
      buttonY = fi.buttonY;
      break;
    case dName:
      type = rect; 
      buttonLength = f.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = controlsX + 4.0 * buttonLength + 5.0 * (f.buttonX - controlsX);
      buttonY = f.buttonY;
      break;
    case diName:
      type = rect; 
      buttonLength = f.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = d.buttonX;
      buttonY = fi.buttonY;
      break;
    case bName:
      type = rect; 
      buttonLength = f.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = controlsX + 5.0 * buttonLength + 6.0 * (f.buttonX - controlsX);
      buttonY = f.buttonY;
      break;
    case biName:
      type = rect; 
      buttonLength = f.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = b.buttonX;
      buttonY = fi.buttonY;
      break;
    case pieceOption1Name:
      type = option;
      float f = 0.40, showOptions_PiecesSpace = f * inputCubeUserButton.buttonWidth, 
        showOptions_PiecesWidth = (inputCubeUserButton.buttonWidth - showOptions_PiecesSpace) / 2.0, 
        showOptions_PiecesX = inputCubeUserButton.buttonX, showOptions_PiecesY = (displayHeight - 4.2 * showOptions_PiecesWidth) / 2.0;
      buttonLength = showOptions_PiecesWidth;
      showOptions_PiecesWidthFloat = buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = showOptions_PiecesX;
      showOptions_PiecesX_Float = showOptions_PiecesX;
      buttonY = showOptions_PiecesY;
      showOptions_PiecesY_Float = showOptions_PiecesY;
      break;
    case pieceOption2Name:
      type = option;
      buttonLength = showOptions_PiecesWidthFloat;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = showOptions_PiecesX_Float + buttonLength;
      buttonY = showOptions_PiecesY_Float;
      break;
    case pieceOption3Name:
      type = option;
      buttonLength = showOptions_PiecesWidthFloat;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = showOptions_PiecesX_Float;
      buttonY = showOptions_PiecesY_Float + buttonLength;
      break;
    case pieceOption4Name:
      type = option;
      buttonLength = showOptions_PiecesWidthFloat;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = showOptions_PiecesX_Float + buttonLength;
      buttonY = showOptions_PiecesY_Float + buttonLength;
      break;
    case pieceOption5Name:
      type = option;
      buttonLength = showOptions_PiecesWidthFloat;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = showOptions_PiecesX_Float;
      buttonY = showOptions_PiecesY_Float + 2 * buttonLength;
      break;
    case pieceOption6Name:
      type = option;
      buttonLength = showOptions_PiecesWidthFloat;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = showOptions_PiecesX_Float + buttonLength;
      buttonY = showOptions_PiecesY_Float + 2 * buttonLength;
      break;
    case pieceOption7Name:
      type = option;
      buttonLength = showOptions_PiecesWidthFloat;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = showOptions_PiecesX_Float;
      buttonY = showOptions_PiecesY_Float + 3 * buttonLength;
      break;
    case pieceOption8Name:
      type = option;
      buttonLength = showOptions_PiecesWidthFloat;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = showOptions_PiecesX_Float + buttonLength;
      buttonY = showOptions_PiecesY_Float + 3 * buttonLength;
      break;
    case colorOption1Name:
      type = option;
      float g = 0.30, showOptions_ColorsSpace = g * inputCubeUserButton.buttonWidth, 
        showOptions_ColorsWidth = (inputCubeUserButton.buttonWidth - showOptions_ColorsSpace) / 2.0, 
        showOptions_ColorsX = inputCubeUserButton.buttonX, showOptions_ColorsY = (displayHeight - 3 * showOptions_ColorsWidth) / 2.0;
      buttonLength = showOptions_ColorsWidth;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = showOptions_ColorsX;
      buttonY = showOptions_ColorsY;
      break;
    case colorOption2Name:
      type = option;
      buttonLength = colorOption1.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = colorOption1.buttonX;
      buttonY = colorOption1.buttonY + buttonLength;
      break;
    case colorOption3Name:
      type = option;
      buttonLength = colorOption1.buttonLength;
      buttonWidth = buttonLength;
      buttonHeight = buttonLength;
      buttonX = colorOption1.buttonX;
      buttonY = colorOption1.buttonY + 2 * buttonLength;
      break;
    case doneButtonName:
      type = rect;
      setTextSize(doneButtonName);
      buttonX = 0.475 * (displayWidth - textWidth(doneButtonName));
      buttonY = 0.17 * displayHeight;
      buttonWidth = 1.20 * textWidth(doneButtonName);
      buttonHeight = 1.20 * textHeight(doneButtonName);
      break;
    }
  }

  public void draw() {
    if (this.name.equals(doneButtonName) && !flipCubeView)
      return;
    cam.beginHUD();
    if (insideButton())
      this.updateButtonColor();
    else if (!pressed)
      this.resetButtonColor();
    this.drawButton();
    mouseClicked();
    cam.endHUD();
  }

  void mouseClicked() {
    if (mouseHoldCount > mouseHoldThreshold || mouseButton == RIGHT)
      return;
    if (mousePressed && mousePressedActive) {
      if (insideButton()) {
        if (name.equals(inputCubeName) && executing)
          return;
        pressed = true;
        switch(name) {
        case scrambleName :
          scramble();
          break;
        case solveName :
          solve();
          break;
        case homeName :  
          resetCam();
          goingHome = true;
          break;
        case inputCubeName :
          if (executing)
            return;
          inputCube();
          pressed = inputCube;
          inputCube_mousePressed = true;
          break;
        case cancelName :
          Controls.pressed = false;
          break;
        case leftName : 
          Left();
          pressed = false;
        case upName : 
          Up();
          pressed = false;
          break;
        case rightName : 
          Right();
          pressed = false;
        case downName : 
          Down();
          pressed = false;
          break;
        case middleName : 
          if (!firstClick_Middle)
            return;
          showFaceNames = !showFaceNames;
          firstClick_Middle = false;
          break;
        case fName:
          pressed = false;
          if (executing || turning())
            return;
          F.start();
          break;
        case fiName:
          pressed = false;
          if (executing || turning())
            return;
          Fi.start();
          break;
        case rName:
          pressed = false;
          if (executing || turning())
            return;
          R.start();
          break;
        case riName:
          pressed = false;
          if (executing || turning())
            return;
          Ri.start();
          break;
        case uName:
          pressed = false;
          if (executing || turning())
            return;
          U.start();
          break;
        case uiName:
          pressed = false;
          if (executing || turning())
            return;
          Ui.start();
          break;
        case lName:
          pressed = false;
          if (executing || turning())
            return;
          L.start();
          break;
        case liName:
          pressed = false;
          if (executing || turning())
            return;
          Li.start();
          break;
        case dName:
          pressed = false;
          if (executing || turning())
            return;
          D.start();
          break;
        case diName:
          pressed = false;
          if (executing || turning())
            return;
          Di.start();
          break;
        case bName:
          pressed = false;
          if (executing || turning())
            return;
          B.start();
          break;
        case biName:
          pressed = false;
          if (executing || turning())
            return;
          Bi.start();
          break;
        case pieceOption1Name:
          if (promptUser_Position == false || cubeOptions.size() < 1)
            return;
          pressed = false;
          cubeOptionRemove(0);
          promptUser_Position = !promptUser_Position;
          mousePressedActive = false;
          if (cubeOptions.size() == 3) {
            unhighlight(7);
            highlight(7, 0);
          }
          break;
        case pieceOption2Name:
          if (promptUser_Position == false || cubeOptions.size() < 2)
            return;
          pressed = false;
          cubeOptionRemove(1);
          promptUser_Position = !promptUser_Position;
          mousePressedActive = false;
          if (cubeOptions.size() == 3) {
            unhighlight(7);
            highlight(7, 0);
          }
          break;
        case pieceOption3Name:
          if (promptUser_Position == false || cubeOptions.size() < 3)
            return;
          pressed = false;
          cubeOptionRemove(2);
          promptUser_Position = !promptUser_Position;
          mousePressedActive = false;
          if (cubeOptions.size() == 3) {
            unhighlight(7);
            highlight(7, 0);
          }
          break;
        case pieceOption4Name:
          if (promptUser_Position == false || cubeOptions.size() < 4)
            return;
          pressed = false;
          cubeOptionRemove(3);
          promptUser_Position = !promptUser_Position;
          mousePressedActive = false;
          if (cubeOptions.size() == 3) {
            unhighlight(7);
            highlight(7, 0);
          }
          break;
        case pieceOption5Name:
          if (promptUser_Position == false || cubeOptions.size() < 5)
            return;
          pressed = false;
          cubeOptionRemove(4);
          promptUser_Position = !promptUser_Position;
          mousePressedActive = false;
          break;
        case pieceOption6Name:
          if (promptUser_Position == false || cubeOptions.size() < 6)
            return;
          pressed = false;
          cubeOptionRemove(5);
          promptUser_Position = !promptUser_Position;
          mousePressedActive = false;
          break;
        case pieceOption7Name:
          pressed = false;
          if (promptUser_Position == false || cubeOptions.size() < 7)
            return;
          cubeOptionRemove(6);
          promptUser_Position = !promptUser_Position;
          mousePressedActive = false;
          break;
        case pieceOption8Name:
          if (promptUser_Position == false || cubeOptions.size() < 8)
            return;
          pressed = false;
          cubeOptionRemove(7);
          promptUser_Position = !promptUser_Position;
          mousePressedActive = false;
          break;
        case colorOption1Name: 
          selectedColor = selectedCube.faceColors()[0];
          pressed = false;
          promptUser_Position = !promptUser_Position;
          mousePressedActive = false;
          updateInputCube();
          break;
        case colorOption2Name: 
          selectedColor = selectedCube.faceColors()[1];
          pressed = false;
          promptUser_Position = !promptUser_Position;
          mousePressedActive = false;
          updateInputCube();
          break;
        case colorOption3Name: 
          selectedColor = selectedCube.faceColors()[2];
          pressed = false;
          promptUser_Position = !promptUser_Position;
          mousePressedActive = false;
          updateInputCube();
          break;
        case doneButtonName:
          userCubeFlipped = true;
          pressed = false;
          break;
        }
      }
    }
  }

  public void drawButton() {
    stroke(0);
    strokeWeight(3);
    fill(buttonColor);
    switch (type) {
    case rect: 
      rect(buttonX, buttonY, buttonWidth, buttonHeight);
      fill(255);
      setTextSize(name);
      text(name, buttonX + (buttonWidth - textWidth(name)) / 2.0, buttonY + (buttonHeight - textHeight(name)) / 2.0, buttonWidth, buttonHeight);
      break;
    case square:
      if (name.equals(homeName) && atHome) // if the cube is atHome then the homeButton will not appear
        return;
      switch (name) {
      case homeName:
      case leftName:
      case rightName:
      case upName:
      case downName:
      case middleName:
        noFill();
        noStroke();
        break;
      }
      square(buttonX, buttonY, buttonLength);
      break;
    case option:
      int check = -1;
      switch (name) {
      case pieceOption1Name: 
        check = 1;
        break;
      case pieceOption2Name:
        check = 2;
        break;
      case pieceOption3Name:
        check = 3;
        break;
      case pieceOption4Name:
        check = 4;
        break;
      case pieceOption5Name:
        check = 5;
        break;
      case pieceOption6Name:
        check = 6;
        break;
      case pieceOption7Name:
        check = 7;
        break;
      case pieceOption8Name:
        check = 8;
        break;
      }
      if (cubeOptions.size() < check) 
        break;
      noFill();
      if (changeColor())
        fill(black, 155);
      square(buttonX, buttonY, buttonLength);
      break;
    }
    drawIcon();
    active = true;
  }

  void drawIcon() {
    switch(this.name) {
    case homeName:
      if (!atHome)
        drawHomeIcon();
    case cancelName:
      drawCancelIcon();
      break;
    case leftName:
      drawLeftButtonIcon();
      break;
    case upName:
      drawUpButtonIcon();
      break;
    case rightName:
      drawRightButtonIcon();
      break;
    case downName:
      drawDownButtonIcon();
      break;
    case middleName:
      drawMiddleButtonIcon();
      break;
    case pieceOption1Name:
      if (cubeOptions.size() >= 1)
        cubeDraw(buttonX + buttonLength / 2.0, buttonY + buttonLength / 2.0, toColor(cubeOptions.get(0).faceColors()[0]), toColor(cubeOptions.get(0).faceColors()[1]), toColor(cubeOptions.get(0).faceColors()[2]));
      break;
    case pieceOption2Name:
      if (cubeOptions.size() >= 2)
        cubeDraw(buttonX + buttonLength / 2.0, buttonY + buttonLength / 2.0, toColor(cubeOptions.get(1).faceColors()[0]), toColor(cubeOptions.get(1).faceColors()[1]), toColor(cubeOptions.get(1).faceColors()[2]));
      break;
    case pieceOption3Name:
      if (cubeOptions.size() >= 3)
        cubeDraw(buttonX + buttonLength / 2.0, buttonY + buttonLength / 2.0, toColor(cubeOptions.get(2).faceColors()[0]), toColor(cubeOptions.get(2).faceColors()[1]), toColor(cubeOptions.get(2).faceColors()[2]));
      break;
    case pieceOption4Name:
      if (cubeOptions.size() >= 4)
        cubeDraw(buttonX + buttonLength / 2.0, buttonY + buttonLength / 2.0, toColor(cubeOptions.get(3).faceColors()[0]), toColor(cubeOptions.get(3).faceColors()[1]), toColor(cubeOptions.get(3).faceColors()[2]));
      break;
    case pieceOption5Name:
      if (cubeOptions.size() >= 5)
        cubeDraw(buttonX + buttonLength / 2.0, buttonY + buttonLength / 2.0, toColor(cubeOptions.get(4).faceColors()[0]), toColor(cubeOptions.get(4).faceColors()[1]), toColor(cubeOptions.get(4).faceColors()[2]));
      break;
    case pieceOption6Name:
      if (cubeOptions.size() >= 6)
        cubeDraw(buttonX + buttonLength / 2.0, buttonY + buttonLength / 2.0, toColor(cubeOptions.get(5).faceColors()[0]), toColor(cubeOptions.get(5).faceColors()[1]), toColor(cubeOptions.get(5).faceColors()[2]));
      break;
    case pieceOption7Name:
      if (cubeOptions.size() >= 7)
        cubeDraw(buttonX + buttonLength / 2.0, buttonY + buttonLength / 2.0, toColor(cubeOptions.get(6).faceColors()[0]), toColor(cubeOptions.get(6).faceColors()[1]), toColor(cubeOptions.get(6).faceColors()[2]));
      break;
    case pieceOption8Name:
      if (cubeOptions.size() == 8)
        cubeDraw(buttonX + buttonLength / 2.0, buttonY + buttonLength / 2.0, toColor(cubeOptions.get(7).faceColors()[0]), toColor(cubeOptions.get(7).faceColors()[1]), toColor(cubeOptions.get(7).faceColors()[2]));
      break;
    case colorOption1Name:
      fill(toColor(selectedCube.faceColors()[0]));
      float f = 0.8;
      square(buttonX + buttonLength * ((1.0 - f) / 2.0), buttonY + buttonLength * ((1.0 - f) / 2.0), f * buttonLength);
      break;
    case colorOption2Name:
      fill(toColor(selectedCube.faceColors()[1]));
      float g = 0.8;
      square(buttonX + buttonLength * ((1.0 - g) / 2.0), buttonY + buttonLength * ((1.0 - g) / 2.0), g * buttonLength);
      break;
    case colorOption3Name:
      fill(toColor(selectedCube.faceColors()[2]));
      float h = 0.8;
      square(buttonX + buttonLength * ((1.0 - h) / 2.0), buttonY + buttonLength * ((1.0 - h) / 2.0), h * buttonLength);
      break;
    }
  }

  boolean changeColor () {
    return this.insideButton() || this.pressed;
  }

  public void updateButtonColor() {
    buttonColor = black;
  }

  public void resetButtonColor() {
    if (this.type.equals(square))
      buttonColor = originalButtonColor;
    else
      buttonColor = defaultButtonColor;
  }

  boolean insideButton() {
    float x = buttonX, y = buttonY;
    if (this.type.equals(circle)) {
      x -= (0.5 * buttonWidth);
      y -= (0.5 * buttonHeight);
    }
    if (mouseX >= x && mouseX <= x + buttonWidth && mouseY >= y && mouseY <= y + buttonHeight)
      return true;
    return false;
  }

  boolean insideButton(float x, float y) {
    if (x >= buttonX && x <= buttonX + buttonWidth && y >= buttonY && y <= buttonY + buttonHeight)
      return true;
    return false;
  }

  // User Button Class END //
}

int mouseHoldCount = 0, mouseHoldThreshold = 30;

void mouseReleased() {
  mouseHoldCount = 0;
}

float cancelLineX = 0, cancelLineY = 0;

void drawCancelIcon() {
  if (Controls.pressed == false)
    return;
  stroke(white);
  if (cancel.insideButton())
    strokeWeight(3.62);
  else
    strokeWeight(2.22);
  line(cancelLineX, cancelLineY, cancelLineX + cancel.buttonLength, cancelLineY + cancel.buttonLength);
  line(cancelLineX, cancelLineY + cancel.buttonLength, cancelLineX + cancel.buttonLength, cancelLineY);
  strokeWeight(3.4);
  stroke(black);
  fill(red);
  square(cancel.buttonX, cancel.buttonY, cancel.buttonWidth);
}

void drawHomeIcon() {
  fill(Home.alternateButtonColor);
  stroke(black);
  if (Home.insideButton()) 
    fill(Home.alternateButtonColor2);
  float squareLength = 0.59 * Home.buttonLength, squareX = Home.buttonX + (Home.buttonLength - squareLength) / 2.0, 
    squareY = Home.buttonY + Home.buttonLength - squareLength;
  square(squareX, squareY, squareLength); 
  float aX = Home.buttonX + Home.buttonLength / 2.0, 
    aY = Home.buttonY, bX = squareX, bY = squareY, cX = squareX + squareLength, cY = squareY;
  triangle(aX, aY, bX, bY, cX, cY);
  float rectWidth = 0.4 * squareLength, rectX = squareX + (squareLength - rectWidth) / 2.0, 
    rectHeight = 0.55 * squareLength, rectY = squareY + 0.65 * (squareLength - rectHeight);
  rect(rectX, rectY, rectWidth, rectHeight);
}

int timeCountLeft = 0;
boolean leftIconGrow = false;

void drawLeftButtonIcon () {
  strokeWeight(3.62);
  fill(orange);
  stroke(black);
  float aX = left.buttonX, aY = left.buttonY + left.buttonLength / 2.0, 
    bX = left.buttonX + left.buttonLength, bY = left.buttonY, 
    cX = bX, cY = left.buttonY + left.buttonLength, shiftLength = 0;
  if (left.changeColor()) {
    float shiftAngle = (float) Math.atan(45/22);
    if (timeCountLeft % 40 == 0)
      leftIconGrow = !leftIconGrow;
    if (leftIconGrow == true)
      shiftLength = 31.5;
    else
      shiftLength = 27.5;
    float horizShift = shiftLength * (float) Math.sin(shiftAngle/2), vertShift = shiftLength * (float) Math.cos(shiftAngle/2);
    triangle(aX + shiftLength, aY, bX - horizShift, bY + vertShift, cX - horizShift, cY - vertShift);
    if (timeCountLeft == 10000000)
      timeCountLeft = 0;
    else
      timeCountLeft++;
  } 
  triangle(aX, aY, bX, bY, cX, cY);
}

int timeCountUp = 0;
boolean upIconGrow = false;

void drawUpButtonIcon () {
  strokeWeight(3.62);
  fill(orange);
  stroke(black);
  float aX = up.buttonX, aY = up.buttonY + up.buttonLength, 
    bX = up.buttonX + up.buttonLength / 2.0, bY = up.buttonY, 
    cX = up.buttonX + up.buttonLength, cY = up.buttonY + up.buttonLength, shiftLength = 0;
  if (up.changeColor()) {
    if (timeCountUp % 40 == 0)
      upIconGrow = !upIconGrow;
    if (upIconGrow == true)
      shiftLength = 31.5;
    else
      shiftLength = 27.5;
    float shiftAngle = (float) Math.atan(2);
    float horizShift = shiftLength * (float) Math.cos(shiftAngle / 2.0), vertShift = shiftLength * (float) Math.sin(shiftAngle / 2.0);
    triangle(aX + horizShift, aY - vertShift, bX, bY + shiftLength, cX - horizShift, cY - vertShift);
    if (timeCountLeft == 10000000)
      timeCountUp = 0;
    else
      timeCountUp++;
  } 
  triangle(aX, aY, bX, bY, cX, cY);
}

int timeCountRight = 0;
boolean rightIconGrow = false;

void drawRightButtonIcon () {
  strokeWeight(3.62);
  fill(orange);
  stroke(black);
  float aX = right.buttonX, aY = right.buttonY, 
    bX = right.buttonX, bY = right.buttonY + right.buttonLength, 
    cX = right.buttonX + right.buttonLength, cY = right.buttonY + right.buttonLength / 2.0, shiftLength = 0;
  if (right.changeColor()) {
    float shiftAngle = (float) Math.atan(45/22);
    if (timeCountRight % 40 == 0)
      rightIconGrow = !rightIconGrow;
    if (rightIconGrow == true)
      shiftLength = 31.5;
    else
      shiftLength = 27.5;
    float horizShift = shiftLength * (float) Math.sin(shiftAngle/2), vertShift = shiftLength * (float) Math.cos(shiftAngle/2);
    triangle(aX + horizShift, aY + vertShift, bX + horizShift, bY - vertShift, cX - shiftLength, cY);
    if (timeCountLeft == 10000000)
      timeCountRight = 0;
    else
      timeCountRight++;
  } 
  triangle(aX, aY, bX, bY, cX, cY);
}

int timeCountDown = 0;
boolean downIconGrow = false;

void drawDownButtonIcon () {
  strokeWeight(3.62);
  fill(orange);
  stroke(black);
  float aX = down.buttonX, aY = down.buttonY, 
    bX = down.buttonX + down.buttonLength / 2.0, bY = down.buttonY + down.buttonLength, 
    cX = down.buttonX + down.buttonLength, cY = down.buttonY, shiftLength = 0;
  if (down.changeColor()) {
    if (timeCountDown % 40 == 0)
      downIconGrow = !downIconGrow;
    if (downIconGrow == true)
      shiftLength = 31.5;
    else
      shiftLength = 27.5;
    float shiftAngle = (float) Math.atan(2);
    float horizShift = shiftLength * (float) Math.cos(shiftAngle / 2.0), vertShift = shiftLength * (float) Math.sin(shiftAngle / 2.0);
    triangle(aX + horizShift, aY + vertShift, bX, bY - shiftLength, cX - horizShift, cY + vertShift);
    if (timeCountLeft == 10000000)
      timeCountDown = 0;
    else
      timeCountDown++;
  } 
  triangle(aX, aY, bX, bY, cX, cY);
}

String middleButtonStatus() {
  if (showFaceNames)
    return "ON";
  return "OFF";
}

int timeCountMiddle = 0;
boolean middleIconGrow = false;

void drawMiddleButtonIcon () {
  if (timeCountMiddle % 40 == 0)
    middleIconGrow = !middleIconGrow;
  fill (orange);
  stroke(black);
  strokeWeight(3.62);
  float x = (left.buttonX + left.buttonLength + right.buttonX) / 2.0, y = (up.buttonY + up.buttonLength + down.buttonY) / 2.0;
  circle (x, y, middle.buttonLength);
  if (showFaceNames)
    fill (yellow);
  float k = 0.65;
  if (middle.insideButton() && middleIconGrow)
    k = 0.75;
  circle (x, y, k * middle.buttonLength);
  fill(black);
  textSize(0.30 * titleTextSize);
  text(middleButtonStatus(), x - textWidth (middleButtonStatus()) / 2.0, y + textHeight (middleButtonStatus()) / 2.0);
  if (timeCountMiddle == 100000)
    timeCountMiddle = 0;
  else
    timeCountMiddle++;
}


void showFaceNames() {
  if (!showFaceNames) 
    return;
  fill(emerald);
  showFaceNames("F");
  rotateX((float)(Math.PI/2));
  showFaceNames("U");
  rotateX((float)(-Math.PI));
  showFaceNames("D");
  rotateX((float)(Math.PI/2));
  rotateY((float)(Math.PI/2));
  showFaceNames("R");
  rotateY((float)(Math.PI/2));
  showFaceNames("B");
  rotateY((float)(Math.PI/2));
  showFaceNames("L");
}

void showFaceNames(String faceName) {
  float d = 3.25;
  push();
  textSize(0.025 * titleTextSize);
  text(faceName, - (textWidth(faceName) / 2.0), textHeight(faceName) / 4.0, d);
  pop();
}
