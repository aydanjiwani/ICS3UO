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

 
  colorMode(HSB,360,255,255);

j++;
int k = j%800;
   fill(k%360,255,255);
  ellipse(j/5,(4*j)%800,100,100);

 


}

  
  