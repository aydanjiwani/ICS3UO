/*
  Description: This program determines the area of a regular polygon and answers yes/no questions randomly
 Author: Aydan Jiwani
 Date of last edit: Apr 23, 2018
 */
int screen = 0;
int sides = 4;
float apothem = 100;
String remark = "yeet";
boolean eightball = false;
int answer = 0;
void setup() {
  size(640, 360);
}
//with assistance from https://processing.org/examples/regularpolygon.html
void polygon(float x, float y, float radius, int npoints) { //draws a regular polygon with a center point, radius (apothem) and number of sides
  float angle = TWO_PI / npoints; //divides a circle into npoints angles
  beginShape();
  for (float a = 0; a < TWO_PI; a += angle) {
    float sx = x + cos(a) * radius; 
    float sy = y + sin(a) * radius; //creates a point at each angle along the circumference of circle, using r*cosangle and r*sinangle
    vertex(sx, sy); //adds this point as a vertex of the shape
  }
  endShape(CLOSE);
}

void keyPressed()
{
  if (key == 32)
  {
    screen = (screen+1)%2; 
    eightball = false;
  }
  if (key== 'a')
  {
    sides -= 1;
    if ( sides < 3)
    { 
      sides = 3;
    }
  }
  if (key == 'd')
  {
    sides+=1;
  }
  if (key == 'w')
  {
    apothem += 1;
  }
  if (key == 's')
  {
    apothem -= 1;
    if (apothem < 10)
    {
      apothem = 10;
    }
  }
  if (key == 'q')
  {
    eightball = true;
    answer = int(round(random(0, 7)));
  }
}

void draw() {
  background (102);

  if (screen == 0)
  {
    fill(255);
    polygon(width/2, height/2, apothem, sides);  
    float actualsidelength = apothem*(2*tan(radians(180/sides)));

    float area = apothem*0.5*actualsidelength*sides;
    textSize(12);
    text("Number of sides: " + str(sides), 10, 30); 
    text("Side length: " + str(actualsidelength), 10, 50); 
    text("Area: " + str(area), 10, 70);
  }

  if (screen == 1)
  {
    fill(0);
    ellipse(width/2, height/2, 200, 200);
    textSize(12);
    text("Visualize your question, then hit the q key", 10, 50); 
    if (eightball == true)
    {
      fill(255);
      triangle(260, 240, 320, 120, 380, 240);
      fill(0);

      switch(answer)
      {
      case 0:
        remark = " \n \n absolutely";
        break;
      case 1:
        remark = "\n without a \n doubt";
        break;
      case 2:
        remark = "     Yes";
        break;
      case 3:
        remark = "      No";
        break;
      case 4:
        remark = "  Not a \n chance";
        break;
      case 5:
        remark = "\n  unlikely";
        break;
      case 6:
        remark = "  \n Ask again \n later";
        break;
      case 7:
        remark = "  Maybe";
        break;
      }
      text(remark, 290, 170);
    }
  }
}