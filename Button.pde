class Button {
  int x, y, width, height;
  String label;

  Button(int x, int y, int width, int height, String label) {
    this.x = x;
    this.y = y;
    this.width = width;
    this.height = height;
    this.label = label;
  }

  void display() {
    // Dibujar el botón en la pantalla
    fill(150);
    rect(x, y, width, height);
    fill(0);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(label, x + width/2, y + height/2);
  }
}
