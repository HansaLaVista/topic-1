class flower {

  float pos;
  float size;

  flower() {
    pos = 0;
    size = 50;
  }


  void RenderFlower() {
    fill(255, 192, 10);
    ellipse(pos, pos, size, size);
  }
}
