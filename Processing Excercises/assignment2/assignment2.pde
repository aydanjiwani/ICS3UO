PImage img;

void settings()

{
  size(806, 828);
}

void setup()

{
}

void draw()

{
  noFill();
  background(255, 255, 255);

  strokeWeight(30); 


  stroke(250, 128, 128);
  arc(350, 310, 400, 500, radians(85), radians(280));



  arc(550, 520, 450, 450, radians(-85), radians(95));

  stroke(215, 250, 128);

  arc(350, 310, 500, 500, radians(95), radians(275));

  arc(500, 510, 500, 500, radians(-95), radians(95));

  strokeWeight(20); 


  stroke(128, 250, 128);  


  arc(350, 310, 430, 500, radians(80), radians(280));

  arc(500, 540, 400, 500, radians(-95), radians(95));

  strokeWeight(10); 


  stroke(128, 128, 250);  

  arc(280, 260, 400, 500, radians(105), radians(280));

  arc(530, 540, 400, 500, radians(-95), radians(85));
  strokeWeight(10); 


  stroke(192, 128, 250);  


  arc(320, 310, 400, 400, radians(90), radians(270));

  arc(570, 520, 400, 400, radians(-105), radians(80));
}