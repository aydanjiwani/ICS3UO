
void settings()

{
size(400, 800);

}
  
void setup()

{
    
}
  
void draw()

{
  background(255);
  colorMode(HSB,255,255,255);
  noStroke();
int j = 0;
    
    while(j< mouseX)
    {
      int l = 0;
     j+=10;
   for(int k = l; k < mouseY; k+=10)
   {
     fill((j*k)%255,255,255);
     ellipse(j,k,10,10);
     
   } 
    }
    


}

  
  