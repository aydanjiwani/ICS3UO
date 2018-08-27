PImage img;
int j = 0;
void settings()

{
size(400, 800);

}
  
void setup()

{
    background(0);
}
  
void draw()

{

  noStroke();
  colorMode(HSB);

j++;
   fill((j*8)%360,255,255);
  ellipse(200,2*j,j/2,j/2);
  fill((j*4)%360,255, 255);
  ellipse(j,400,j/4,j/4);
 


}

  
  