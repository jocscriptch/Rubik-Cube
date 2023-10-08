public void keyPressed()
{
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
