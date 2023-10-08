import peasy.*;

import controlP5.*;

ControlP5 cp5;
Button boton;
Button bt2;

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
boolean startScreen = true; // Variable para controlar la pantalla de inicio
boolean start = false;
boolean showManual = false;

Move move = allMoves[0];

public void setup() {
  size(600, 600, P3D); 
  cam = new PeasyCam(this, 400); 
  cam.setActive(false);
  // Inicializa ControlP5
  cp5 = new ControlP5(this);

  // Crea un botón llamado 'btn' en la posición (100,100) con tamaño de 80x40
  boton = cp5.addButton("btn")
     .setPosition(100,100)
     .setSize(80,40)
     .setLabel("Jugar")
     .onClick(new CallbackListener() {
        public void controlEvent(CallbackEvent theEvent) {
          startScreen = false;
           start = true;
       }
     });
   bt2 = cp5.addButton("btnManual")
     .setPosition(200,100)
     .setSize(80,40)
     .setLabel("Manual")
     .onClick(new CallbackListener() {
       public void controlEvent(CallbackEvent theEvent) {
         startScreen = false;
         start = false;
         showManual = !showManual;
         }
     });
     
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
}


public void draw() {
  if (startScreen) {
    background(0); // pantalla de inicio
    fill(255); // Texto b  lanco
    textSize(32);
    
   } else if (showManual) {
    bt2.setVisible(false);
    boton.setVisible(false);
    background(0); // pantalla del manual
    fill(255); // Texto blanco
    textSize(16);
    text("Aquí va el manual del juego...", width/2, height/2);
  } else {
    cam.setActive(true);
    boton.setVisible(false);
    bt2.setVisible(false);
    background(#151515); // Establecer el fondo de la ventana
    rotateX(-0.5);
    rotateY(0.4);
    rotateZ(0.1);

    move.update();

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
}
