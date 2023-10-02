// metodos para los giros de los ejes x,y,z

//rotar Z
public void turnZ(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cubie c = cube[i];
    if (c.z == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(c.x, c.y);
      c.update(round(matrix.m02), round(matrix.m12), round(c.z));
      c.turnFacesZ(dir);
    }
  }
}

//rotar Y
public void turnY(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cubie c = cube[i];
    if (c.y == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(c.x, c.z);
      c.update(round(matrix.m02), c.y, round(matrix.m12));
      c.turnFacesY(dir);
    }
  }
}

//rotar X
public void turnX(int index, int dir) {
  for (int i = 0; i < cube.length; i++) {
    Cubie c = cube[i];
    if (c.x == index) {
      PMatrix2D matrix = new PMatrix2D();
      matrix.rotate(dir*HALF_PI);
      matrix.translate(c.y, c.z);
      c.update(c.x, round(matrix.m02), round(matrix.m12));
      c.turnFacesX(dir);
    }
  }
}
