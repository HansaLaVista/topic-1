class Flower {

  float pos;
  float size;

  Flower() {
    pos = 0;
    size = 50;
  }


  void RenderFlower() {
    fill(150, 172, 192);
    ellipse(pos, pos, size, size);
  }
}
