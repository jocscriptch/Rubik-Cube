//Clase para el movimiento de las caras del cubo
class Move {

  float angle = 0;
  int x =0;
  int y = 0;
  int z=0;
  int dir;
  boolean animating  = false;
  boolean finished  = false;

  Move (int x, int y, int z, int dir) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.dir = dir;
  }

  public void start() {
    animating = true;
  }

  boolean finished() {
    return finished;
  }

  public void update() {
    if (animating) {
      angle += dir * 0.1;
      if (abs(angle) > HALF_PI) {
        angle = 0;
        animating = false;
        finished = true;

        if (abs(z) > 0) {
          turnZ(z, dir);
        } else if (abs(x) > 0) {
          turnX(x, dir);
        } else if (abs(y) > 0) {
          turnY(y, dir);
        }
      }
    }
  }
}
