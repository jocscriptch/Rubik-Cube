import peasy.*;

PeasyCam cam;

int dim = 3;
Cubie[] cube = new Cubie[dim*dim*dim]; // Matriz tridimensional 3x3
//String[] allMoves = {"f","b","u","d","l","r"};

/*Arreglo con los movimientos del cubo
 segun el sentido del reloj antihorario y
 horario, represar las letras mayusculas como
 giros antihorarios y las minusculas como giros
 horarios
 */
Move[] allMoves = new Move [] {
  new Move(0, 1, 0, 1), //giro Down antihorario
  new Move(0, 1, 0, -1), //giro down horario

  new Move(0, -1, 0, 1), //giro up horario
  new Move(0, -1, 0, -1), //giro Up antihorario

  new Move (1, 0, 0, 1), //giro right horario
  new Move (1, 0, 0, -1), //giro Right antihorario

  new Move (-1, 0, 0, 1), //giro Left antihorario
  new Move (-1, 0, 0, -1), //giro left horario

  new Move(0, 0, 1, 1), //giro front horario
  new Move(0, 0, 1, -1), //giro Front antihorario

  new Move(0, 0, -1, 1), //giro Back antihorario
  new Move(0, 0, -1, -1) //giro back horario
};

//String sequence = "";
//int count = 0;

boolean start = false;
Move move = allMoves[0];

public void setup() {
  size(600, 600, P3D); // Tamaño de la ventana
  cam = new PeasyCam(this, 400); // Inicializar cámara 3D
  int i = 0;
  for (int x = -1; x <= 1; x++) {
    for (int y = -1; y <= 1; y++) {
      for (int z = -1; z <= 1; z++) {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[i] = new Cubie(matrix, x, y, z);
        i++;
      }
    }
  }
  //cube[0].c = color(255, 0, 0);
  //cube[2].c = color(0, 0, 255);

  //for (int k = 0; k < 10; k++) {
  //  int r = int(random(allMoves.length));
  //  if (random(1) < 0.5) {
  //    sequence += allMoves[r];
  //  } else {
  //    sequence += allMoves[r].toUpperCase();
  //  }
  //}

  ////regresar la sequencia para armar el cubo volver a su estado original
  //for (int n = sequence.length() - 1; n >= 0; n--){

  //}
  // println(sequence);

  //move = new Move(0, 0, 1, -1); //mover f
  //move = new Move(1, 0, 0, 1); // mover r
  //move = new Move(0, 1, 0, 1); //mover D
}

public void draw() {
    background(#151515); // Establecer el fondo de la ventana
    rotateX(-0.5);
    rotateY(0.4);
    rotateZ(0.1);

    move.update();
    //if(move.finished()){
    //  turnZ.(move.z, move.dir);
    //}

    //if(start){
    //  if(frameCount % 20 == 0){
    //  if(count < sequence.length()){
    //    char move = sequence.charAt(count);
    //    applyMove(move);
    //    count++;
    //    }
    //  }
    //}
    scale(50);
    for (int i = 0; i < cube.length; i++) {
      push();
      if (abs(cube[i].z) > 0 && cube[i].z == move.z) {
        rotateZ(move.angle);
      } else if (abs(cube[i].x) > 0 && cube[i].x == move.x) {
        rotateX(move.angle);
      } else if (abs(cube[i].y) > 0 && cube[i].y == move.y) {
        rotateY(-move.angle);
      }
      cube[i].show();
      pop();
    }
}
