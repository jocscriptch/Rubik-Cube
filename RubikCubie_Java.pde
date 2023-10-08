import peasy.*;
import javax.swing.JOptionPane;
import controlP5.*;

ControlP5 cp5;
Boton boton, bt2, bt3;
Textfield nameField;

PImage bgImage;

PeasyCam cam;

String manual = "Manual de Usuario - Juego de Cubo Rubik\n" +
"Controles:\n" +
"Para comenzar el juego desde la pantalla de inicio, presiona el boton de jugar.\n" +
"Una vez en el juego, puedes realizar los movimientos del cubo utilizando las siguientes teclas:\n" +
"-Tecla d: Gira la cara inferior (Down) en el sentido horario.\n" +
"-Tecla D: Gira la cara inferior (Down) en el sentido antihorario.\n"+
"-Tecla u: Gira la cara superior (Up) en el sentido horario.\n"+
"-Tecla U: Gira la cara superior (Up) en el sentido antihorario.\n"+
"-Tecla r: Gira la cara derecha (Right) en el sentido horario.\n"+
"-Tecla R: Gira la cara derecha (Right) en el sentido antihorario.\n"+
"-Tecla l: Gira la cara izquierda (Left) en el sentido horario.\n"+
"-Tecla L: Gira la cara izquierda (Left) en el sentido antihorario.\n"+
"-Tecla f: Gira la cara frontal (Front) en el sentido horario.\n"+
"-Tecla F: Gira la cara frontal (Front) en el sentido antihorario.\n"+
"-Tecla b: Gira la cara trasera (Back) en el sentido horario.\n"+
"-Tecla B: Gira la cara trasera (Back) en el sentido antihorario.\n"+
"¡Diviértete jugando el Cubo Rubik en Processing!";

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
boolean mostrarPopup = false;
String nombre = "";

Move move = allMoves[0];

public void setup() {
  size(600, 600, P3D); 
  cam = new PeasyCam(this, 400); 
  cam.setActive(false);
  bgImage = loadImage("C:\\Users\\yeikoag\\Desktop\\EstructuraDeDatos\\Rubik-Cube\\cub.jpg");
  //bgImage.resize(400, 400);
  cp5 = new ControlP5(this);

  int buttonX = width / 2 - 40;
  int buttonY1 = height / 2 - 20;
  int buttonY2 = height /  2 + 20;

  boton = new Boton(cp5, buttonX, buttonY1, "Jugar", new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      startScreen = false;
       mostrarPopup = true;
      start = true;
    }
  }
  );
 
 bt2 = new Boton(cp5, buttonX, buttonY2, "Manual", new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      startScreen = false;
      start = false;
      showManual = !showManual;
    }
  }
  );
    bt3 = new Boton(cp5, buttonX, buttonY2 + 220, "Regresar", new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      startScreen = true;
      start = false;
      showManual = false;
      //showManual = !showManual;
    }
  }
  );
     
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
    image(bgImage,0,0, width, height);
    fill(255); // Texto b  lanco
    textSize(32);
    bt3.setVisible(false);
   } else if (showManual) {
     cam.setActive(false);
    bt2.setVisible(false);
    boton.setVisible(false);
    background(0); 
    fill(#00F7FF); 
    textSize(16);
    text(manual, 50, 50, width - 100, height - 100);
    bt3.setVisible(true);
     } else if (mostrarPopup) {
        nombre = JOptionPane.showInputDialog("Ingrese su nombre:");
        mostrarPopup = false;
        start = true;
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
