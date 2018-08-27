PImage img;

void settings()

{
size(800, 600);
}
  
void setup()

{
  img = loadImage("test.png");
}
  
void draw()

{
image(img, 0, 0);
}
  
  