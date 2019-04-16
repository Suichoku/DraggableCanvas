int offsetX = 0; // how much initial X position has moved
int offsetY = 0; // how much initial Y position has moved
int startX = 0; // starting X position for drag
int startY = 0; // starting Y position for drag
int rows = 10; // how many rows (tiles)
int cols = 10; // how many columns (tiles)

void setup() {
  size(800,800);
}

void draw() {
  if(frameCount % 60 == 0) { // debugging
    println("offsets: X=" + offsetX + ", Y=" + offsetY);
  }
  background(255);
  stroke(0);
  // offsetY adds offset to Y position, modulo makes it so that "new" lines are drawn
  for(int i = 0; i < rows + 1; i++) { // draw rows
    line(0, i * height/rows + offsetY % (height/rows), width, i * height/rows + offsetY % (height/rows));
  }
  for(int i = 0; i < cols + 1; i++) { // draw columns
    line(i * width/cols + offsetX % (width/cols), 0, i * width/cols + offsetX % (width/cols), height);
  }
}

void mousePressed() {
  if(mouseButton == LEFT) {
    startX = mouseX - offsetX; // set starting X position
    startY = mouseY - offsetY; // set starting Y position
  }
}

void mouseDragged() {
  if(mouseButton == LEFT) {
    offsetX = mouseX - startX; // offset X position
    offsetY = mouseY - startY; // offset Y position
  }
}
