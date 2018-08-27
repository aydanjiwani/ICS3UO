
void settings()

{
size(300, 600);

}
  
void setup()

{
    
}
  
void draw()

{
  float q = 0;
background(255);
 colorMode(HSB,255,255,255);
 
for(float i = 0; i < 300; i += 18.75)
{
  for(float j = 0; j < 300; j += 18.75)
  {
    float l = i*255/300;
    float m = j*255/300; 
    q = 16*l+m;
    stroke(10);
    fill(q%255,255,255);
 ellipse(i%300+5,j%300+5,18.75,18.75);
  }
}

for(int k = 255; k > 0; k -=1)
{
  noStroke();
  fill(k,255,255);
ellipse(width/2,(height/4)*3,k,k);  
}

}

  
  