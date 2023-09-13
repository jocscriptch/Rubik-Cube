public void keyPressed() {

  switch(key) {

    /* Giros de caras minusculas giros positivos sentido del reloj, mayusculas
     giros negativos contrario del reloj
     
     -SENTIDO RELOJ-                         -CONTRARIO RELOJ-
     f: front / cara frontal positiva        F: Front / cara frontal negativa
     b: back / cara atras positiva           B: Back / cara atras negativa
     u: up / cara arriba positiva            U: Up / cara arriba negativa
     d: down / cara abajo positiva           D: Down / cara abajo negativa
     l: left / cara izqda positiva           L: Left / cara izqda negativa
     r: right / cara derc positiva           R: Right / cara derc negativa
                 
                 y
                 |
                3|
                2| 
            *   1|    *
  <------------------------------------------------>x 
     -2    -1    |    1    2    3 `                 
            *  -1|    *
               -2|
                 |
     */
  case 'f':
    turnZ(1, 1);
    break;

  case 'F':
    turnZ(1, -1);
    break;

 case 'b':
    turnZ(-1, -1);
    break;
    
  case 'B':
    turnZ(-1, 1);
    break;

   case 'u':
    turnY(-1, 1);
    break;

  case 'U':
    turnY(-1, -1);
    break;

  case 'd':
    turnY(1, -1);
    break;

  case 'D':
    turnY(1, 1);
    break;

  case 'l':
    turnX(-1, -1);
    break;
    
  case 'L':
    turnX(-1, 1);
    break;

  case 'r':
    turnX(1, 1);
    break;
  
  case 'R':
    turnX(1, -1);
    break;
  }
}
