
float textHeight(String text) {
  float textHeight = textAscent() + textDescent();
  return textHeightMultiplier(text) * textHeight;
}

float textHeightMultiplier (String text) {
  switch (text) {
  case maxCount :
    return 0.65;
  case "ON":
  case "OFF":
    return 0.625;
  case welcomeText :
    return 1.2;
  }
  return 1;
}

final String 
  title = "The 2x2 Rubik's Cube Solver", 
  solveAlertMessage = "The Cube Is Already Solved - Try The Scramble Button", 
  controlsText = "You Can Use Your Keyboard Too!", 
  maxCount = "99", 
  welcomeText = "Welcome, Press Any Key To Begin!";
;

String[] textArr = {title, solveAlertMessage, scrambleName, controlsText, maxCount};

float 
  titleTextSize = 77.5, 
  alertTextSize = 34.5, 
  primaryButtonTextSize = 43.5, 
  controlsTextSize = 33, 
  counterTextSize = 16;

float[] textSizeArr = {titleTextSize, alertTextSize, primaryButtonTextSize, controlsTextSize, counterTextSize};

void textSizeSetup() {
  textSizeSetup(title, 0.56, displayWidth);
  textSizeSetup(solveAlertMessage, 0.475, displayWidth);
  textSizeSetup(scrambleName, 0.1, displayWidth);
  textSizeSetup(controlsText, 0.25, displayWidth);
  textSizeSetup(maxCount, 0.0527, displayWidth);
  saveTextSizes();
}

void textSizeSetup (String text, float percent, float comp) {
  int index = -1;
  float textSize = 0, min = 0.95 * percent, max = 1.05 * percent;
  for (int i = 0; i < textArr.length; i++)
    if (textArr[i].equals(text)) {
      textSize = textSizeArr[i];
      textSize(textSize);
      index = i;
    }

  boolean increaseTextSize = false;
  if (textWidth(text) < min * comp)
    increaseTextSize = true;

  if (increaseTextSize)
    while (textWidth(text) < min * comp) {
      textSize++;
      textSize(textSize);
    } else 
  while (textWidth(text) > max * comp) {
    textSize--;
    textSize(textSize);
  }

  textSizeArr[index] = textSize;
}

void setTextSize(String s) {
  float textSize = 0;
  switch(s) { 
  case scrambleName:
  case solveName:
  case inputCubeName:
  case controlsName:
  case fName:
  case fiName:
  case uName:
  case uiName:
  case rName:
  case riName:
  case lName:
  case liName:
  case dName:
  case diName:
  case bName:
  case biName:
    textSize = primaryButtonTextSize;
    break;
  case doneButtonName:
    textSize = 0.6 * primaryButtonTextSize;
    break;
  }
  textSize(textSize);
}

void saveTextSizes() {
  titleTextSize = textSizeArr[0];
  alertTextSize = textSizeArr[1];
  primaryButtonTextSize = textSizeArr[2];
  controlsTextSize = textSizeArr[3];
  counterTextSize = textSizeArr[4];
}
