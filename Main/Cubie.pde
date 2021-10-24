class Cubie {

  PMatrix3D matrix;
  int x, y, z;
  Face[] faces = new Face[6];
  float f = (float)Math.pow(10, -14);

  Cubie(PMatrix3D m, int x, int y, int z) {
    matrix = m;
    this.x = x;
    this.y = y;
    this.z = z;
    faces[0] = new Face(new PVector(0, 0, 0.25), baseColor); //Front
    faces[1] = new Face(new PVector(0, 0, -0.25), baseColor); //Back
    faces[2] = new Face(new PVector(0, f, 0.25), baseColor); // Up
    faces[3] = new Face(new PVector(0, f, -0.25), baseColor); // Down
    faces[4] = new Face(new PVector(f, 0, -0.25), baseColor); // Left
    faces[5] = new Face(new PVector(f, 0, 0.25), baseColor); // Right
    addInputColors();
  }

  void addInputColors() {
    int i = -1;
    switch(""+x+y+z) {
    case "-1-11" : // Cube A
      i = 0; 
      faces[0] = new Face(new PVector(0, 0, 0.25), correspondingColor(input.Cubes()[i].faceColors()[1])); 
      faces[2] = new Face(new PVector(0, f, 0.25), correspondingColor(input.Cubes()[i].faceColors()[0]));  
      faces[4] = new Face(new PVector(f, 0, -0.25), correspondingColor(input.Cubes()[i].faceColors()[2]));
      break;
    case "1-11" : // Cube B
      i = 1;
      faces[0] = new Face(new PVector(0, 0, 0.25), correspondingColor(input.Cubes()[i].faceColors()[1])); 
      faces[2] = new Face(new PVector(0, f, 0.25), correspondingColor(input.Cubes()[i].faceColors()[0]));  
      faces[5] = new Face(new PVector(f, 0, 0.25), correspondingColor(input.Cubes()[i].faceColors()[2]));
      break;
    case "-1-1-1" : // Cube C
      i = 2;
      faces[1] = new Face(new PVector(0, 0, -0.25), correspondingColor(input.Cubes()[i].faceColors()[1])); 
      faces[2] = new Face(new PVector(0, f, 0.25), correspondingColor(input.Cubes()[i].faceColors()[0]));  
      faces[4] = new Face(new PVector(f, 0, -0.25), correspondingColor(input.Cubes()[i].faceColors()[2]));
      break;
    case "1-1-1" :   // Cube D
      i = 3;
      faces[1] = new Face(new PVector(0, 0, -0.25), correspondingColor(input.Cubes()[i].faceColors()[1])); 
      faces[2] = new Face(new PVector(0, f, 0.25), correspondingColor(input.Cubes()[i].faceColors()[0]));
      faces[5] = new Face(new PVector(f, 0, 0.25), correspondingColor(input.Cubes()[i].faceColors()[2]));
      break;
    case "-111" : // Cube E
      i = 4;
      faces[0] = new Face(new PVector(0, 0, 0.25), correspondingColor(input.Cubes()[i].faceColors()[1])); 
      faces[3] = new Face(new PVector(0, f, -0.25), correspondingColor(input.Cubes()[i].faceColors()[0]));  
      faces[4] = new Face(new PVector(f, 0, -0.25), correspondingColor(input.Cubes()[i].faceColors()[2]));
      break;
    case "111" : // Cube F
      i = 5;
      faces[0] = new Face(new PVector(0, 0, 0.25), correspondingColor(input.Cubes()[i].faceColors()[1])); 
      faces[3] = new Face(new PVector(0, f, -0.25), correspondingColor(input.Cubes()[i].faceColors()[0]));  
      faces[5] = new Face(new PVector(f, 0, 0.25), correspondingColor(input.Cubes()[i].faceColors()[2]));
      break;
    case "-11-1" : // Cube G
      i = 6; 
      faces[1] = new Face(new PVector(0, 0, -0.25), correspondingColor(input.Cubes()[i].faceColors()[1])); 
      faces[3] = new Face(new PVector(0, f, -0.25), correspondingColor(input.Cubes()[i].faceColors()[0]));  
      faces[4] = new Face(new PVector(f, 0, -0.25), correspondingColor(input.Cubes()[i].faceColors()[2]));
      break;
    case "11-1" : // Cube H
      i = 7;
      faces[1] = new Face(new PVector(0, 0, -0.25), correspondingColor(input.Cubes()[i].faceColors()[1])); 
      faces[3] = new Face(new PVector(0, f, -0.25), correspondingColor(input.Cubes()[i].faceColors()[0]));  
      faces[5] = new Face(new PVector(f, 0, 0.25), correspondingColor(input.Cubes()[i].faceColors()[2]));
      break;
    }
  }

  void addSolvedColors() {
    switch(""+x+y+z) {
    case "-1-11" : // Cube A
      faces[0] = new Face(new PVector(0, 0, 0.25), blue); 
      faces[2] = new Face(new PVector(0, f, 0.25), white);  
      faces[4] = new Face(new PVector(f, 0, -0.25), red); 
      break;
    case "1-11" : // Cube B
      faces[0] = new Face(new PVector(0, 0, 0.25), blue); 
      faces[2] = new Face(new PVector(0, f, 0.25), white);
      faces[5] = new Face(new PVector(f, 0, 0.25), purple);
      break;
    case "-1-1-1" : // Cube C
      faces[1] = new Face(new PVector(0, 0, -0.25), green);
      faces[2] = new Face(new PVector(0, f, 0.25), white);  
      faces[4] = new Face(new PVector(f, 0, -0.25), red); 
      break;
    case "1-1-1" :   // Cube D
      faces[1] = new Face(new PVector(0, 0, -0.25), green); 
      faces[2] = new Face(new PVector(0, f, 0.25), white);
      faces[5] = new Face(new PVector(f, 0, 0.25), purple);
      break;
    case "-111" : // Cube E
      faces[0] = new Face(new PVector(0, 0, 0.25), blue); 
      faces[3] = new Face(new PVector(0, f, -0.25), yellow);
      faces[4] = new Face(new PVector(f, 0, -0.25), red); 
      break;
    case "111" : // Cube F
      faces[0] = new Face(new PVector(0, 0, 0.25), blue); 
      faces[3] = new Face(new PVector(0, f, -0.25), yellow);
      faces[5] = new Face(new PVector(f, 0, 0.25), purple);
      break;
    case "-11-1" : // Cube G
      faces[1] = new Face(new PVector(0, 0, -0.25), green);
      faces[3] = new Face(new PVector(0, f, -0.25), yellow); 
      faces[4] = new Face(new PVector(f, 0, -0.25), red); 
      break;
    case "11-1" : // Cube H
      faces[1] = new Face(new PVector(0, 0, -0.25), green); 
      faces[3] = new Face(new PVector(0, f, -0.25), yellow);
      faces[5] = new Face(new PVector(f, 0, 0.25), purple);
      break;
    }
  }

  color correspondingColor(String c) {
    switch(c) {
    case RubiksCube.w : 
      return white;
    case RubiksCube.y : 
      return yellow;
    case RubiksCube.g : 
      return green;
    case RubiksCube.b : 
      return blue;
    case RubiksCube.r : 
      return red;
    case RubiksCube.p : 
      return purple;
    }
    return baseColor;
  }

  void updateColorsL() {
    color[] oldColors = new color [faces.length];
    for (int i = 0; i < oldColors.length; i++)
      oldColors[i] = faces[i].c;
    this.setColor(0, oldColors[2]);
    this.setColor(1, oldColors[3]);
    this.setColor(2, oldColors[1]);
    this.setColor(3, oldColors[0]);
  }

  void updateColorsLi() {
    color[] oldColors = new color [faces.length];
    for (int i = 0; i < oldColors.length; i++)
      oldColors[i] = faces[i].c;
    this.setColor(2, oldColors[0]);
    this.setColor(3, oldColors[1]);
    this.setColor(1, oldColors[2]);
    this.setColor(0, oldColors[3]);
  }

  void updateColorsR() {
    color[] oldColors = new color [faces.length];
    for (int i = 0; i < oldColors.length; i++)
      oldColors[i] = faces[i].c;
    this.setColor(2, oldColors[0]);
    this.setColor(3, oldColors[1]);
    this.setColor(1, oldColors[2]);
    this.setColor(0, oldColors[3]);
  }

  void updateColorsRi() {
    color[] oldColors = new color [faces.length];
    for (int i = 0; i < oldColors.length; i++)
      oldColors[i] = faces[i].c;
    this.setColor(0, oldColors[2]);
    this.setColor(1, oldColors[3]);
    this.setColor(2, oldColors[1]);
    this.setColor(3, oldColors[0]);
  }

  void updateColorsD() {
    color[] oldColors = new color [faces.length];
    for (int i = 0; i < oldColors.length; i++)
      oldColors[i] = faces[i].c;
    this.setColor(5, oldColors[0]);
    this.setColor(4, oldColors[1]);
    this.setColor(0, oldColors[4]);
    this.setColor(1, oldColors[5]);
  }

  void updateColorsDi() {
    color[] oldColors = new color [faces.length];
    for (int i = 0; i < oldColors.length; i++)
      oldColors[i] = faces[i].c;
    this.setColor(0, oldColors[5]);
    this.setColor(1, oldColors[4]);
    this.setColor(4, oldColors[0]);
    this.setColor(5, oldColors[1]);
  }

  void updateColorsUi() {
    color[] oldColors = new color [faces.length];
    for (int i = 0; i < oldColors.length; i++)
      oldColors[i] = faces[i].c;
    this.setColor(5, oldColors[0]);
    this.setColor(4, oldColors[1]);
    this.setColor(0, oldColors[4]);
    this.setColor(1, oldColors[5]);
  }

  void updateColorsU() {
    color[] oldColors = new color [faces.length];
    for (int i = 0; i < oldColors.length; i++)
      oldColors[i] = faces[i].c;
    this.setColor(0, oldColors[5]);
    this.setColor(1, oldColors[4]);
    this.setColor(4, oldColors[0]);
    this.setColor(5, oldColors[1]);
  }

  void updateColorsB() {
    color[] oldColors = new color [faces.length];
    for (int i = 0; i < oldColors.length; i++)
      oldColors[i] = faces[i].c;
    this.setColor(4, oldColors[2]);
    this.setColor(5, oldColors[3]);
    this.setColor(3, oldColors[4]);
    this.setColor(2, oldColors[5]);
  }

  void updateColorsBi() {
    color[] oldColors = new color [faces.length];
    for (int i = 0; i < oldColors.length; i++)
      oldColors[i] = faces[i].c;
    this.setColor(2, oldColors[4]);
    this.setColor(3, oldColors[5]);
    this.setColor(4, oldColors[3]);
    this.setColor(5, oldColors[2]);
  }

  void updateColorsF() {
    color[] oldColors = new color [faces.length];
    for (int i = 0; i < oldColors.length; i++)
      oldColors[i] = faces[i].c;
    this.setColor(2, oldColors[4]);
    this.setColor(3, oldColors[5]);
    this.setColor(4, oldColors[3]);
    this.setColor(5, oldColors[2]);
  }

  void updateColorsFi() {
    color[] oldColors = new color [faces.length];
    for (int i = 0; i < oldColors.length; i++)
      oldColors[i] = faces[i].c;
    this.setColor(4, oldColors[2]);
    this.setColor(5, oldColors[3]);
    this.setColor(3, oldColors[4]);
    this.setColor(2, oldColors[5]);
  }

  void setColor(int index, color c) {
    this.faces[index].c = c;
  }

  void update (int x, int y, int z) {
    matrix.reset();
    matrix.translate(x, y, z);
    this.x = x;
    this.y = y;
    this.z = z;
  }

  void highlight() {
    switch(""+x+y+z) {
    case "-1-11" : // Cube A
      faces[0] = new Face(new PVector(0, 0, 0.25), highlightColor); 
      faces[2] = new Face(new PVector(0, f, 0.25), highlightColor);  
      faces[4] = new Face(new PVector(f, 0, -0.25), highlightColor);
      break;
    case "1-11" : // Cube B
      faces[0] = new Face(new PVector(0, 0, 0.25), highlightColor); 
      faces[2] = new Face(new PVector(0, f, 0.25), highlightColor);  
      faces[5] = new Face(new PVector(f, 0, 0.25), highlightColor);
      break;
    case "-1-1-1" : // Cube C
      faces[1] = new Face(new PVector(0, 0, -0.25), highlightColor); 
      faces[2] = new Face(new PVector(0, f, 0.25), highlightColor);  
      faces[4] = new Face(new PVector(f, 0, -0.25), highlightColor);
      break;
    case "1-1-1" :   // Cube D
      faces[1] = new Face(new PVector(0, 0, -0.25), highlightColor); 
      faces[2] = new Face(new PVector(0, f, 0.25), highlightColor);
      faces[5] = new Face(new PVector(f, 0, 0.25), highlightColor);
      break;
    case "-111" : // Cube E
      faces[0] = new Face(new PVector(0, 0, 0.25), highlightColor); 
      faces[3] = new Face(new PVector(0, f, -0.25), highlightColor);  
      faces[4] = new Face(new PVector(f, 0, -0.25), highlightColor);
      break;
    case "111" : // Cube F
      faces[0] = new Face(new PVector(0, 0, 0.25), highlightColor); 
      faces[3] = new Face(new PVector(0, f, -0.25), highlightColor);  
      faces[5] = new Face(new PVector(f, 0, 0.25), highlightColor);
      break;
    case "-11-1" : // Cube G
      faces[1] = new Face(new PVector(0, 0, -0.25), highlightColor); 
      faces[3] = new Face(new PVector(0, f, -0.25), highlightColor);  
      faces[4] = new Face(new PVector(f, 0, -0.25), highlightColor);
      break;
    case "11-1" : // Cube H
      faces[1] = new Face(new PVector(0, 0, -0.25), highlightColor); 
      faces[3] = new Face(new PVector(0, f, -0.25), highlightColor);  
      faces[5] = new Face(new PVector(f, 0, 0.25), highlightColor);
      break;
    }
  }

  void unhighlight() {
    switch(""+x+y+z) {
    case "-1-11" : // Cube A
      faces[0] = new Face(new PVector(0, 0, 0.25), baseColor); 
      faces[2] = new Face(new PVector(0, f, 0.25), baseColor);  
      faces[4] = new Face(new PVector(f, 0, -0.25), baseColor);
      break;
    case "1-11" : // Cube B
      faces[0] = new Face(new PVector(0, 0, 0.25), baseColor); 
      faces[2] = new Face(new PVector(0, f, 0.25), baseColor);  
      faces[5] = new Face(new PVector(f, 0, 0.25), baseColor);
      break;
    case "-1-1-1" : // Cube C
      faces[1] = new Face(new PVector(0, 0, -0.25), baseColor); 
      faces[2] = new Face(new PVector(0, f, 0.25), baseColor);  
      faces[4] = new Face(new PVector(f, 0, -0.25), baseColor);
      break;
    case "1-1-1" :   // Cube D
      faces[1] = new Face(new PVector(0, 0, -0.25), baseColor); 
      faces[2] = new Face(new PVector(0, f, 0.25), baseColor);
      faces[5] = new Face(new PVector(f, 0, 0.25), baseColor);
      break;
    case "-111" : // Cube E
      faces[0] = new Face(new PVector(0, 0, 0.25), baseColor); 
      faces[3] = new Face(new PVector(0, f, -0.25), baseColor);  
      faces[4] = new Face(new PVector(f, 0, -0.25), baseColor);
      break;
    case "111" : // Cube F
      faces[0] = new Face(new PVector(0, 0, 0.25), baseColor); 
      faces[3] = new Face(new PVector(0, f, -0.25), baseColor);  
      faces[5] = new Face(new PVector(f, 0, 0.25), baseColor);
      break;
    case "-11-1" : // Cube G
      faces[1] = new Face(new PVector(0, 0, -0.25), baseColor); 
      faces[3] = new Face(new PVector(0, f, -0.25), baseColor);  
      faces[4] = new Face(new PVector(f, 0, -0.25), baseColor);
      break;
    case "11-1" : // Cube H
      faces[1] = new Face(new PVector(0, 0, -0.25), baseColor); 
      faces[3] = new Face(new PVector(0, f, -0.25), baseColor);  
      faces[5] = new Face(new PVector(f, 0, 0.25), baseColor);
      break;
    }
  }

  void highlight (int j) {
    switch(""+x+y+z) {
    case "-1-11" : // Cube A
      if (j == 1)
        faces[0] = new Face(new PVector(0, 0, 0.25), highlightColor);
      if (j == 0)
        faces[2] = new Face(new PVector(0, f, 0.25), highlightColor);  
      if (j == 2)
        faces[4] = new Face(new PVector(f, 0, -0.25), highlightColor);
      break;
    case "1-11" : // Cube B
      if (j == 1)
        faces[0] = new Face(new PVector(0, 0, 0.25), highlightColor); 
      if (j == 0)
        faces[2] = new Face(new PVector(0, f, 0.25), highlightColor);  
      if (j == 2)
        faces[5] = new Face(new PVector(f, 0, 0.25), highlightColor);
      break;
    case "-1-1-1" : // Cube C
      if (j == 1)
        faces[1] = new Face(new PVector(0, 0, -0.25), highlightColor); 
      if (j == 0)
        faces[2] = new Face(new PVector(0, f, 0.25), highlightColor);  
      if (j == 2)
        faces[4] = new Face(new PVector(f, 0, -0.25), highlightColor);
      break;
    case "1-1-1" :   // Cube D
      if (j == 1)
        faces[1] = new Face(new PVector(0, 0, -0.25), highlightColor); 
      if (j == 0)
        faces[2] = new Face(new PVector(0, f, 0.25), highlightColor);
      if (j == 2)
        faces[5] = new Face(new PVector(f, 0, 0.25), highlightColor);
      break;
    case "-111" : // Cube E
      if (j == 1)
        faces[0] = new Face(new PVector(0, 0, 0.25), highlightColor);
      if (j == 0)
        faces[3] = new Face(new PVector(0, f, -0.25), highlightColor);  
      if (j == 2)
        faces[4] = new Face(new PVector(f, 0, -0.25), highlightColor);
      break;
    case "111" : // Cube F
      if (j == 1)
        faces[0] = new Face(new PVector(0, 0, 0.25), highlightColor); 
      if (j == 0)
        faces[3] = new Face(new PVector(0, f, -0.25), highlightColor);  
      if (j == 2)
        faces[5] = new Face(new PVector(f, 0, 0.25), highlightColor);
      break;
    case "-11-1" : // Cube G
      if (j == 1)
        faces[1] = new Face(new PVector(0, 0, -0.25), highlightColor); 
      if (j == 0)
        faces[3] = new Face(new PVector(0, f, -0.25), highlightColor);  
      if (j == 2)
        faces[4] = new Face(new PVector(f, 0, -0.25), highlightColor);
      break;
    case "11-1" : // Cube H
      if (j == 1)
        faces[1] = new Face(new PVector(0, 0, -0.25), highlightColor); 
      if (j == 0)
        faces[3] = new Face(new PVector(0, f, -0.25), highlightColor);  
      if (j == 2)
        faces[5] = new Face(new PVector(f, 0, 0.25), highlightColor);
      break;
    }
  }

  void show () {
    fill (100);
    stroke(0);
    strokeWeight(0.15);
    pushMatrix();
    applyMatrix(matrix);
    box(2);
    for (Face f : faces)
      f.show();
    popMatrix();
  }
}
