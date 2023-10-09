class Cubie 
{
  PMatrix3D matrix;
  int x = 0;
  int y = 0;
  int z = 0;
  color c;
  Face[] faces = new Face[6];

  Cubie(PMatrix3D m, int x, int y, int z)
  {
    this.matrix = m;
    this.x = x;
    this.y = y;
    this.z = z;
    c = color(255);

    faces[0] = new Face(new PVector(0, 0, -1), color(122, 232, 255)); //cara azul
    faces[1] = new Face(new PVector(0, 0, 1), color(135, 255, 92)); //cara verde
    faces[2] = new Face(new PVector(0, 1, 0), color(255, 255, 255)); //cara blanca
    faces[3] = new Face(new PVector(0, -1, 0), color(236, 241, 26)); //cara amarilla
    faces[4] = new Face(new PVector(1, 0, 0), color(255, 97, 13)); //cara naranja
    faces[5] = new Face(new PVector(-1, 0, 0), color(255, 44, 67)); //cara roja
  }

  public void update(int x, int y, int z) 
  {
    matrix.reset();
    matrix.translate(x, y, z);
    this.x = x;
    this.y = y;
    this.z = z;
  }

  //rotar caras Z
  public void turnFacesZ(int direction) 
  {
    for (Face f : faces) {
      f.turnZ(direction*HALF_PI);
      
    }
  }

  //caras Y
  public void turnFacesY(int direction)
  {
    for (Face f : faces) {
      f.turnY(direction*HALF_PI);
    }
  }

  //caras X
  public void turnFacesX(int direction) 
  {
    for (Face f : faces) {
      f.turnX(direction*HALF_PI);
    }
  }

  public void show() 
  {
    noFill();
    stroke(52,56,55); //borde negro
    strokeWeight(0.1); //ancho del borde
    pushMatrix(); // guarda la transformacion actual del cubo
    applyMatrix(matrix); //aplicar la transformacion
    box(1);

    for (Face f : faces) 
    {
      f.show();
    }
    popMatrix(); //restaurar la transformacion de la matriz
  }
}
