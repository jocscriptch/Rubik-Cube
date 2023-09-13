import peasy.*;

PeasyCam cam;

int dim = 3;
Cubie[] cube = new Cubie[dim*dim*dim]; // Matriz tridimensional 3x3

String[] allMoves = {"f","b","u","d","l","r"};
String sequence = "";
int count = 0;
// abdias
boolean start = false;

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
  
  for(int k = 0; k < 10;k++){
    int r = int(random(allMoves.length));
    if(random(1) < 0.5){
    sequence += allMoves[r];
  }else{
    sequence += allMoves[r].toUpperCase();
  }
 }
 
 ////regresar la sequencia para armar el cubo volver a su estado original
 //for (int n = sequence.length() - 1; n >= 0; n--){
 
 //}
 // println(sequence);
}

public void draw() {
  
  background(#151515); // Establecer el fondo de la ventana
  
  
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
    cube[i].show();
  }
}
