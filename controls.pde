import java.util.Queue;
import java.util.LinkedList;
import java.util.HashMap;
import java.util.Map;
import java.util.Stack;

Stack<Character> pilaTeclas = new Stack<Character>();
// Crear e inicializar el mapa para almacenar las teclas
Map<Character, Character> mapTeclas = new HashMap<Character, Character>() {
  {
    put('d', 'd');
    put('D', 'D');
    put('u', 'u');
    put('U', 'U');
    put('r', 'r');
    put('R', 'R');
    put('l', 'l');
    put('L', 'L');
    put('f', 'f');
    put('F', 'F');
    put('b', 'b');
    put('B', 'B');
  }
};

public void keyPressed() {
  if (mapTeclas.containsKey(key)) {
    pilaTeclas.push(key);
    switch (key) {
    case 'd':
      move = new Move(0, 1, 0, -1); // Giro horario de la cara down
      move.start();
      fillStack();
      count++;
      break;
    case 'D':
      move = new Move(0, 1, 0, 1); // Giro antihorario de la cara down
      move.start();
      fillStack();
      count++;
      break;
    case 'u':
      move = new Move(0, -1, 0, 1);// Giro horario de la cara up
      move.start();
      fillStack();
      count++;
      break;
    case 'U':
      move = new Move(0, -1, 0, -1); // Giro antihorario de la cara up
      move.start();
      fillStack();
      count++;
      break;
    case 'r':
      move = new Move(1, 0, 0, 1); // Giro horario de la cara right
      move.start();
      fillStack();
      count++;
      break;
    case 'R':
      move = new Move(1, 0, 0, -1); // Giro antihorario de la cara right
      move.start();
      fillStack();
      count++;
      break;
    case 'l':
      move = new Move(-1, 0, 0, -1); // Giro horario de la cara left
      move.start();
      fillStack();
      count++;
      break;
    case 'L':
      move = new Move(-1, 0, 0, 1); // Giro antihorario de la cara left
      move.start();
      fillStack();
      count++;
      break;
    case 'f':
      move = new Move(0, 0, 1, 1); // Giro horario de la cara front
      move.start();
      fillStack();
      count++;
      break;
    case 'F':
      move = new Move(0, 0, 1, -1); // Giro antihorario de la cara front
      move.start();
      fillStack();
      count++;
      break;
    case 'b':
      move = new Move(0, 0, -1, -1); // Giro horario de la cara back
      move.start();
      fillStack();
      count++;
      break;
    case 'B':
      move = new Move(0, 0, -1, 1); // Giro antihorario de la cara back
      move.start();
      fillStack();
      count++;
      break;
    default:
      return;
    }
  }
  if (key == 'S' || key == 's') {
    ejecutarMovimientos();
    printStack();
  }
}

public void printStack() {
  System.out.println("Contenido de la pila: " + pilaTeclas.toString());
}

public void fillStack() {
  printStack();
}

public void ejecutarMovimientos() {
  if (!pilaTeclas.isEmpty()) {
    char tecla = pilaTeclas.pop(); // Sacar la última tecla presionada de la pila
    System.out.println("Con");
    if (mapTeclas.containsKey(tecla)) {
      System.out.println("dentr");
      switch (tecla) {
      case 'd':
        move = new Move(0, 1, 0, 1); // Giro horario de la cara down
        move.start();
        count--;
        break;
      case 'D':
        move = new Move(0, 1, 0, -1); // Giro antihorario de la cara down
        move.start();
        count--;
        break;
      case 'u':
        System.out.println("u");
        move = new Move(0, -1, 0, -1);// Giro horario de la cara up
        move.start();
        count--;
        break;
      case 'U':
        move = new Move(0, -1, 0, 1); // Giro antihorario de la cara up
        move.start();
        count--;
        break;
      case 'r':
        move = new Move(1, 0, 0, -1); // Giro horario de la cara right
        move.start();
        count--;
        break;
      case 'R':
        move = new Move(1, 0, 0, 1); // Giro antihorario de la cara right
        move.start();
        count--;
        break;
      case 'l':
        move = new Move(-1, 0, 0, 1); // Giro horario de la cara left
        move.start();
        count--;
        break;
      case 'L':
        move = new Move(-1, 0, 0, -1); // Giro antihorario de la cara left
        move.start();
        count--;
        break;
      case 'f':
        move = new Move(0, 0, 1, -1); // Giro horario de la cara front
        move.start();
        count--;
        break;
      case 'F':
        move = new Move(0, 0, 1, 1); // Giro antihorario de la cara front
        move.start();
        count--;
        break;
      case 'b':
        move = new Move(0, 0, -1, 1); // Giro horario de la cara back
        move.start();
        count--;
        break;
      case 'B':
        move = new Move(0, 0, -1, -1); // Giro antihorario de la cara back
        move.start();
        count--;
        break;
      default:
        return;
      }
    }
  }
}
