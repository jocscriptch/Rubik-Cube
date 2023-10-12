import peasy.*;
import javax.swing.JOptionPane;
import controlP5.*;
import g4p_controls.*;

PeasyCam cam;
PImage bgImage;
ControlP5 cp5;
Boton boton1, boton2;
GButton mostrarButton;
GButton closeButton;
boolean startScreen = true;
boolean start = false;
boolean optionPane = false;
boolean optionPanePartida = false;
boolean mostrarPopup = false;
String nombre = "", partida = "";

float speed = 0.15;
int dim = 3;
int count = 0;
Cubie[] cube = new Cubie[dim*dim*dim]; // Matriz tridimensional 3x3

/*Arreglo con los movimientos del cubo segun el sentido del reloj antihorario y
 horario, se representan las letras mayusculas como giros antihorarios y las minusculas
 como giros horarios */
Move[] allMoves = new Move []
  {
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

Move move = allMoves[0];

public void setup()
{
  size(700, 650, P3D);
  cam = new PeasyCam(this, 400);
  cam.setActive(false);
  bgImage = loadImage("C:\\Users\\JOCSAN\\Desktop\\Rubik-Cube\\cub.jpg");
  cp5 = new ControlP5(this);
  int buttonX = width / 2 - 20;
  int buttonY1 = 580 ;
  int buttonX2 =  440;
  int buttonY2 = 580 ;

  createGUI();
  // Crear botón Jugar
  boton1 = new Boton(cp5, buttonX, buttonY1, "Jugar", new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      startScreen = false;
      optionPane = true;
      start = true;
    }
  }
  );

  // Crear botón Cargar Partida
  boton2 = new Boton(cp5, buttonX2, buttonY2, "Cargar Partida", new CallbackListener() {
    public void controlEvent(CallbackEvent theEvent) {
      startScreen = false;
      optionPanePartida = true;
      start = true;
    }
  }
  );

  // Establecer colores para los botones (opcional)
  boton1.setColor(color(#7177cc), color(#e1e7ff), color(#0c0e72));
  boton2.setColor(color(#7177cc), color(#e1e7ff), color(#0c0e72));

  int i = 0;
  for (int x = -1; x <= 1; x++)
  {
    for (int y = -1; y <= 1; y++)
    {
      for (int z = -1; z <= 1; z++)
      {
        PMatrix3D matrix = new PMatrix3D();
        matrix.translate(x, y, z);
        cube[i] = new Cubie(matrix, x, y, z);
        i++;
      }
    }
  }
}

public void draw()
{
  if (startScreen ) {
    background(0); // pantalla de inicio
    image(bgImage, 0, 0, width, height);
    fill(255); // Texto b  lanco
    textSize(32);
    if (mostrarPopup) {
      drawPopup();
    }
  } else if (optionPane) {
    nombre = JOptionPane.showInputDialog("Nombre de jugador:");
    optionPane = false;
    start = true;
  } else if (optionPanePartida) {
    partida = JOptionPane.showInputDialog("Ingrese el nombre del jugador:");
    optionPanePartida = false;
    start = true;
  } else {
    mostrarButton.setVisible(false);
    cam.setActive(true);
    boton1.setVisible(false);
    boton2.setVisible(false);
    background(#151515); // Establecer el fondo de la ventana
    fill(255); // Texto blanco
    textSize(32);
    text(count, 100, 100);
    rotateX(-0.5);
    rotateY(0.4);
    rotateZ(0.1);

    move.update();

    scale(50);
    for (int i = 0; i < cube.length; i++)
    {
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
