class Move {
  float angle = 0;
  int x = 0, y = 0, z = 0, dir;
  boolean animating = false, finished = false;

  Move (int x, int y, int z, int dir) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.dir = dir;
  }

  boolean equals (Move m) {
    if (this.x == m.x && this.y == m.y && this.z == m.z && this.dir == m.dir)
      return true;
    return false;
  }

  Move opplement() {
    if (this.equals(F))
      return B;
    if (this.equals(Fi))
      return Bi;
    if (this.equals(R))
      return L;
    if (this.equals(Ri))
      return Li;
    if (this.equals(U))
      return D;
    if (this.equals(Ui))
      return Di;
    if (this.equals(D))
      return U;
    if (this.equals(Di))
      return Ui;
    if (this.equals(L))
      return R;
    if (this.equals(Li))
      return Ri;
    if (this.equals(B))
      return F;
    if (this.equals(Bi))
      return Fi;
    return defaultMove;
  }

  Move complement() {
    if (this.equals(F))
      return Bi;
    if (this.equals(Fi))
      return B;
    if (this.equals(R))
      return Li;
    if (this.equals(Ri))
      return L;
    if (this.equals(U))
      return Di;
    if (this.equals(Ui))
      return D;
    if (this.equals(D))
      return Ui;
    if (this.equals(Di))
      return U;
    if (this.equals(L))
      return Ri;
    if (this.equals(Li))
      return R;
    if (this.equals(B))
      return Fi;
    if (this.equals(Bi))
      return F;
    return defaultMove;
  }

  Move inverse() {
    if (this.equals(F))
      return Fi;
    if (this.equals(Fi))
      return F;
    if (this.equals(R))
      return Ri;
    if (this.equals(Ri))
      return R;
    if (this.equals(U))
      return Ui;
    if (this.equals(Ui))
      return U;
    if (this.equals(D))
      return Di;
    if (this.equals(Di))
      return D;
    if (this.equals(L))
      return Li;
    if (this.equals(Li))
      return L;
    if (this.equals(B))
      return Bi;
    if (this.equals(Bi))
      return B;
    return defaultMove;
  }

  void start() {
    animating = true;
  }

  String toString() {
    if (this.equals(F))
      return "F";
    if (this.equals(Fi))
      return "Fi";
    if (this.equals(R))
      return "R";
    if (this.equals(Ri))
      return "Ri";
    if (this.equals(L))
      return "L";
    if (this.equals(Li))
      return "Li";
    if (this.equals(U))
      return "U";
    if (this.equals(Ui))
      return "Ui";
    if (this.equals(D))
      return "D";
    if (this.equals(Di))
      return "Di";
    if (this.equals(B))
      return "B";
    if (this.equals(Bi))
      return "Bi";
    return null;
  }

  void update() {
    float speed = multiplier * 0.041381275;
    if (animating) 
      angle += dir * speed;
    if (abs(angle) > HALF_PI) {
      this.angle = 0;
      animating = false;
      finished = true;
      switch (""+x+y+z+dir) {
      case "0011" : 
        F();
        break;
      case "001-1" : 
        Fi();
        break;
      case "00-1-1" : 
        B();
        break;
      case "00-11" : 
        Bi();
        break;
      case "0101" : 
        D();
        break;
      case "010-1" : 
        Di();
        break;
      case "0-101" : 
        Ui();
        break;
      case "0-10-1" : 
        U();
        break;
      case "1001" : 
        R();
        break;
      case "100-1" : 
        Ri();
        break;
      case "-1001" : 
        Li();
        break;
      case "-100-1" : 
        L();
        break;
      }
    }
  }
}
