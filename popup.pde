void createGUI() {
  mostrarButton = new GButton(this, 150, 400, 100, 40); // Inicializar mostrarButton aquí
  mostrarButton.setText("Manual juego");
  mostrarButton.addEventHandler(this, "handleButtonEvents");

  closeButton = new GButton(this, 50, 400, 100, 40);
  closeButton.setText("Cerrar");
  closeButton.setVisible(false);
  closeButton.addEventHandler(this, "handleButtonEvents");
}

void handleButtonEvents(GButton button, GEvent event) {
  if (button == mostrarButton && event == GEvent.CLICKED) {
    mostrarPopup = true;
    closeButton.setVisible(true);
  } else if (button == closeButton && event == GEvent.CLICKED) {
    mostrarPopup = false;
    closeButton.setVisible(false);
  }
}

void drawPopup() {
  fill(255);
  rect(0, 0, 400, 400);
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(12);
  text("Manual de Usuario - Juego de Cubo Rubik\n" +
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
    "¡Diviértete jugando el Cubo Rubik en Processing!", 0, 0, 400, 400);
}
