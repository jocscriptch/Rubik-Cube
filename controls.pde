import java.util.Queue;
import java.util.LinkedList;
import java.util.HashMap;
import java.util.Map;
import java.util.Stack;
import java.io.FileWriter;
import java.io.FileReader;
import java.io.BufferedWriter;
import java.io.BufferedReader;
import java.io.IOException;

Stack<Character> pilaTeclas = new Stack<Character>();
Queue<Character> colaTeclas = new LinkedList<Character>();

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
    colaTeclas.add(key); // Agregar la tecla a la cola
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
  if (key == 'G' || key == 'g') {
    guardarPartida();
  }

  if (key == 'C' || key == 'c') {
    cargarMovimientos();
    printQueue();
  }
  if (key == ' ') {
    ejecutarMovimiento();
  }
}

public void printStack() {
  System.out.println("Contenido de la pila: " + pilaTeclas.toString());
}


void printQueue() {
  System.out.print("Contenido de la cola: " + colaTeclas.toString());
}

public void fillStack() {
  printStack();
}

public void ejecutarMovimientos() {
  if (!pilaTeclas.isEmpty()) {
    char tecla = pilaTeclas.pop(); // Sacar la última tecla presionada de la pila
    if (mapTeclas.containsKey(tecla)) {
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


public void guardarPartida() {
  try {
    BufferedWriter writer = new BufferedWriter(new FileWriter("C:\\Users\\JOCSAN\\Desktop\\Rubik-Cube\\Game.txt"));
    // Escribir el nombre del jugador en el archivo
    writer.write(nombre);
    writer.newLine();

    // Escribir cada movimiento en una nueva línea
    for (Character tecla : colaTeclas) {
      writer.write(tecla);
      writer.newLine();
    }

    System.out.print("Contenido de la cola: ");
    for (Character tecla : colaTeclas) {
      System.out.print(tecla + " ");
    }
    println();

    // Cerrar el archivo
    writer.close();

    JOptionPane.showMessageDialog(null, "Partida guardada exitosamente en el archivo Game.txt");
  }
  catch (IOException e) {
    JOptionPane.showMessageDialog(null, "Error al guardar la partida: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
  }
}

public void cargarMovimientos() {
  try {
    BufferedReader reader = new BufferedReader(new FileReader("C:\\Users\\JOCSAN\\Desktop\\Rubik-Cube\\Game.txt"));
    String nombreGuardado = reader.readLine(); // Leer la primera línea del archivo (nombre)

    // Comparar el nombre guardado con el nombre ingresado
    if (nombreGuardado != null && nombreGuardado.equals(partida)) {
      String linea;
      System.out.println(nombreGuardado);
      while ((linea = reader.readLine()) != null) {
        char tecla = linea.trim().charAt(0);
        System.out.println(tecla);
        colaTeclas.add(tecla);
      }
      JOptionPane.showMessageDialog(null, "Partida cargada exitosamente!");
    } else {
      JOptionPane.showMessageDialog(null, "No se encontro el jugador: ", "Error", JOptionPane.ERROR_MESSAGE);
    }
    reader.close();
  }
  catch (IOException e) {
    JOptionPane.showMessageDialog(null, "Error al cargar los movimientos: " + e.getMessage(), "Error", JOptionPane.ERROR_MESSAGE);
  }
}

public void ejecutarMovimiento() {
  if (!colaTeclas.isEmpty()) {
    char tecla = colaTeclas.poll(); // Sacar la última tecla presionada de la COLA
    if (mapTeclas.containsKey(tecla)) {
      switch (tecla) {
      case 'd':
        move = new Move(0, 1, 0, -1); // Giro horario de la cara down
        move.start();
        count++;
        break;
      case 'D':
        move = new Move(0, 1, 0, 1); // Giro antihorario de la cara down
        move.start();
        count++;
        break;
      case 'u':
        System.out.println("u");
        move = new Move(0, -1, 0, 1);// Giro horario de la cara up
        move.start();
        count++;
        break;
      case 'U':
        move = new Move(0, -1, 0, -1); // Giro antihorario de la cara up
        move.start();
        count++;
        break;
      case 'r':
        move = new Move(1, 0, 0, 1); // Giro horario de la cara right
        move.start();
        count++;
        break;
      case 'R':
        move = new Move(1, 0, 0, -1); // Giro antihorario de la cara right
        move.start();
        count++;
        break;
      case 'l':
        move = new Move(-1, 0, 0, -1); // Giro horario de la cara left
        move.start();
        count++;
        break;
      case 'L':
        move = new Move(-1, 0, 0, 1); // Giro antihorario de la cara left
        move.start();
        count++;
        break;
      case 'f':
        move = new Move(0, 0, 1, 1); // Giro horario de la cara front
        move.start();
        count++;
        break;
      case 'F':
        move = new Move(0, 0, 1, -1); // Giro antihorario de la cara front
        move.start();
        count++;
        break;
      case 'b':
        move = new Move(0, 0, -1, -1); // Giro horario de la cara back
        move.start();
        count++;
        break;
      case 'B':
        move = new Move(0, 0, -1, 1); // Giro antihorario de la cara back
        move.start();
        count++;
        break;
      default:
        return;
      }
    }
  }
}
