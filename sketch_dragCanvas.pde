int offsetX = 0;
int offsetY = 0;
int startX = 0;
int startY = 0;
int rows = 10;
int cols = 10;

void setup() {
  size(800,800);
}

void draw() {
  if(frameCount % 60 == 0) {
    println("offsets: X=" + offsetX + ", Y=" + offsetY);
  }
  background(255);
  stroke(0);
  for(int i = 0; i < rows + 1; i++) {
    line(0, i * height/rows + offsetY % (height/rows), width, i * height/rows + offsetY % (height/rows));
  }
  for(int i = 0; i < cols + 1; i++) {
    line(i * width/cols + offsetX % (width/cols), 0, i * width/cols + offsetX % (width/cols), height);
  }
}

void mousePressed() {
  if(mouseButton == LEFT) {
    startX = mouseX - offsetX;
    startY = mouseY - offsetY;
  }
}

void mouseDragged() {
  if(mouseButton == LEFT) {
    offsetX = mouseX - startX;
    offsetY = mouseY - startY;
  }
}
