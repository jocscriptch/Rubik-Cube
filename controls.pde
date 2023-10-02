public void keyPressed() {
  if (key == 'd') {
    move = new Move(0, 1, 0, -1); // Giro horario de la cara down
    move.start();
  } else if (key == 'D') {
    move = new Move(0, 1, 0, 1); // Giro antihorario de la cara down
    move.start();
  } else if (key == 'u') {
    move = new Move(0, -1, 0, 1);// Giro horario de la cara up
    move.start();
  } else if (key == 'U') {
    move = new Move(0, -1, 0, -1);; // Giro antihorario de la cara up
    move.start();
  } else if (key == 'r') {
    move = new Move(1, 0, 0, 1); // Giro horario de la cara right
    move.start();
  } else if (key == 'R') {
    move = new Move(1, 0, 0, -1); // Giro antihorario de la cara right
    move.start();
  } else if (key == 'l') {
    move = new Move(-1, 0, 0, -1); // Giro horario de la cara left
    move.start();
  } else if (key == 'L') {
    move = new Move(-1, 0, 0, 1); // Giro antihorario de la cara left
    move.start();
  } else if (key == 'f') {
    move = new Move(0, 0, 1, 1); // Giro horario de la cara front
    move.start();
  } else if (key == 'F') {
    move = new Move(0, 0, 1, -1); // Giro antihorario de la cara front
    move.start();
  } else if (key == 'b') {
    move = new Move(0, 0, -1, -1); // Giro horario de la cara back
    move.start();
  } else if (key == 'B') {
    move = new Move(0, 0, -1, 1); // Giro antihorario de la cara back
    move.start();
  }
}

//public void applyMove(char move) {

//  switch(move) {

//    /* Giros de caras minusculas giros positivos sentido del reloj, mayusculas
//     giros negativos contrario del reloj
     
//     -SENTIDO RELOJ-                         -CONTRARIO RELOJ-
//     f: front / cara frontal positiva        F: Front / cara frontal negativa
//     b: back / cara atras positiva           B: Back / cara atras negativa
//     u: up / cara arriba positiva            U: Up / cara arriba negativa
//     d: down / cara abajo positiva           D: Down / cara abajo negativa
//     l: left / cara izqda positiva           L: Left / cara izqda negativa
//     r: right / cara derc positiva           R: Right / cara derc negativa
                 
//                 y
//                 |
//                3|
//                2| 
//            *   1|    *
//  <------------------------------------------------>x 
//     -2    -1    |    1    2    3 `                 
//            *  -1|    *
//               -2|
//                 |
//     */
//  case 'f':
//    turnZ(1, 1);
//    break;

//  case 'F':
//    turnZ(1, -1);
//    break;

// case 'b':
//    turnZ(-1, -1);
//    break;
    
//  case 'B':
//    turnZ(-1, 1);
//    break;

//   case 'u':
//    turnY(-1, 1);
//    break;

//  case 'U':
//    turnY(-1, -1);
//    break;

//  case 'd':
//    turnY(1, -1);
//    break;

//  case 'D':
//    turnY(1, 1);
//    break;

//  case 'l':
//    turnX(-1, -1);
//    break;
    
//  case 'L':
//    turnX(-1, 1);
//    break;

//  case 'r':
//    turnX(1, 1);
//    break;
  
//  case 'R':
//    turnX(1, -1);
//    break;
//  }
//}
