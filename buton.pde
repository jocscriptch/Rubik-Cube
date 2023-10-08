import controlP5.*;

class Boton {
  ControlP5 cp5;
  Button boton;

  Boton(ControlP5 cp5, int x, int y, String label, CallbackListener callback) {
    this.cp5 = cp5;
    this.boton = cp5.addButton(label)
                 .setPosition(x, y)
                 .setSize(80, 40)
                 .setLabel(label)
                 .onClick(callback);
  }

  void setVisible(boolean visible) {
    boton.setVisible(visible);
  }
}
