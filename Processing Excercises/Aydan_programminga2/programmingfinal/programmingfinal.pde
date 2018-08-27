//initializing variables
import javax.swing.JOptionPane;

String stringinput;
String sentenceToCheck;
String sentenceToCheck2;
String sentenceToCheck3;
String sentenceToCheck4;
String sentenceToCheck5;
String sentenceToCheck6;
PImage img;
int user = 0;
int screen = 1;
String alphabet2 = "abcdefghijklmnopqrstuvwxyz";
char [] alphabet = alphabet2.toCharArray();
String alphabetcaps2 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
char [] alphabetcaps = alphabetcaps2.toCharArray();
int j = 0;

String user1;
String pass1;
String user2;
String pass2;
String user3;
String pass3;
int ex5 = 0;
int linebottom = 0; 
float [] ex9 = new float[50]; 

//excercise 10-12 functions
int numberOfVowels(String sentenceToCheck) {
  int VowelNumber = 0;
  char [] letters = sentenceToCheck.toCharArray();
  for (int i = 0; i < letters.length; i++) {
    if (letters[i] == 'a' || letters[i] == 'A' || letters[i] == 'e' || letters[i] == 'E' || letters[i] == 'i' || letters[i] == 'I' || letters[i] == 'o' || letters[i] == 'O' || letters[i] == 'U' || letters[i] == 'u') {
      VowelNumber += 1;
    }
  }
  return VowelNumber;
}


int findLength(String sentenceToCheck) {
  int SentenceLength = sentenceToCheck.length(); 
  return SentenceLength;
}

int numberOfCapitals(String sentenceToCheck) {
  int CapsNumber = 0;
  char [] letters = sentenceToCheck.toCharArray();
  for (int i = 0; i < letters.length; i++) {
    if (str(letters[i]).matches("[A-Z]"))
    {
      CapsNumber += 1;
    }
  }
  return CapsNumber;
}

int numberOfWords(String sentenceToCheck) {


  String [] sentenceWords = split(sentenceToCheck, " ");
  return sentenceWords.length;
}

int numberOfMarks(String sentenceToCheck) {
  int MarkNumber = 0;
  char [] letters = sentenceToCheck.toCharArray();
  for (int i = 0; i < letters.length; i++) {
    if (str(letters[i]).matches("[':;.,!?]"))
    {
      MarkNumber += 1;
    }
  }
  return MarkNumber;
}

String mostcommonletter(String sentenceToCheck) {
  int [] counters = new int[26];
  char [] letters = sentenceToCheck.toCharArray();
  char [] alphabetchars = alphabet2.toCharArray();
  char [] alphabetcapchars = alphabetcaps2.toCharArray();
  for (int i = 0; i < letters.length; i++) {
    for (int j = 0; j < alphabetchars.length; j++)
    {
      if (letters[i] == alphabetchars[j] || letters[i] == alphabetcapchars[j])
      {
        counters[j] += 1;
      }
    }
  }
  int maxcounter = max(counters);
  int maxplace = 0;
  for (int k = 0; k < alphabet2.length(); k++)
  {
    if (maxcounter == counters[k])
    {
      maxplace = k;
      break;
    }
  }
  return str(alphabetchars[maxplace]) + ": appears " + str(maxcounter) + " times.";
}
//switching between excercises w/arrow keys
void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      background(255);

      screen-=1;
      if (screen <= 0)
      {
        if (user == 1)
        {
          screen = 6;
        }
        if (user == 0)
        {
          screen = 12;
        }
      }
      if (screen <= 5 && user == 2)
      {
        screen = 12;
      }
      println("excercise " + screen);
    }
    if (keyCode == RIGHT)
    {
      background(255);

      screen++;
      if (screen >= 7 && user == 1)
      {
        screen = 1;
      }
      if (screen >= 13)
      {
        if (user == 2)
        {
          screen =6;
        }
        if (user == 0)
        {
          screen = 1;
        }
      }
      println("excercise " + screen);
    }
  }
}

//password decryption
String decrypt(String input)
{
  int cipher = 0;
  String dab = "";
  char [] password = input.toCharArray();
  String newpassword = "";
  for (int i = 0; i < input.length(); i++)
  {
    if (str(password[i]).matches("[a-z]"))
    {

      if (i%2==0)
      {
        cipher = alphabet2.indexOf(str(password[i]))+2;
      }

      if (i%2==1)
      {
        cipher = alphabet2.indexOf(str(password[i]))-2;
      }
      dab = str(alphabet[cipher]);
      newpassword += dab;
    }
 
    if (str(password[i]).matches("[A-Z]"))
    {

      if (i%2==0)
      {
        cipher = alphabetcaps2.indexOf(str(password[i]))+2;
      }

      if (i%2==1)
      {
        cipher = alphabetcaps2.indexOf(str(password[i]))-2;
      }
      dab = str(alphabetcaps[cipher]);
      newpassword += dab;
    }
    
     if(!(str(password[i]).matches("[a-zA-Z]")))
    {
     newpassword+= str(password[i]); 
    }
   
  }
  return newpassword;
}
void settings() {
  size(800, 600);
}
//loading files for read/write
void setup() {
  img = loadImage("test.png");
  String[] userinfo = loadStrings("passwords.txt");

  user1 = userinfo[0];
  pass1 = userinfo[1];
  user2 = userinfo[2];
  pass2 = userinfo[3];
  user3 = userinfo[4];
  pass3 = userinfo[5];
  
  //value generation for ex 9
  for (int i = 0; i <50; i++)
  {
    ex9[i] = random(0, 600);
  }
  //login screen
  String usernameinput;
  usernameinput = JOptionPane.showInputDialog("enter username");
  
  String passwordinput;
  passwordinput = JOptionPane.showInputDialog("enter password");
  if(usernameinput.equals(user1) && passwordinput.equals(decrypt(pass1)))
  {
   JOptionPane.showMessageDialog(null, "user 1 signed in");
   user = 1; 
  }
  if(usernameinput.equals(user2) && passwordinput.equals(decrypt(pass2)))
  {
   JOptionPane.showMessageDialog(null, "user 2 signed in");
   user = 2; 
  }
  if(usernameinput.equals(user3) && passwordinput.equals(decrypt(pass3)))
  {
   JOptionPane.showMessageDialog(null, "super user signed in");
  }
  else
  {
     JOptionPane.showMessageDialog(null, "incorrect user/pass");
     exit();
  }
}

//switch with 1 case for each excercise, toggleable by arrow keys
void draw() {

  switch(screen) {
  default:
    image(img, 0, 0);
    if (keyPressed)
    {
      break;
    }
  case 1:

    image(img, 0, 0);

    break;

  case 2:

    noFill();
    background(255);

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

    break;

  case 3:


    fill(50+mouseX/2, 50+(mouseY/4), 250);
    ellipse(mouseX, mouseY, 50, 50);

    break;

  case 4:

    noStroke();
    colorMode(HSB, 360, 255, 255);

    j++;
    int k = j%height;

    fill(k%360, 255, 255);
    ellipse((j)%height/2, height/2, (j/4)%1800, (j/4)%1800);


    fill(4*k%360, 255, 255);
    ellipse(width/2, j%height, j%(width/2), j%(width/2));

    break;

  case 5:



    colorMode(HSB, 360, 255, 255);

    ex5++;
    int m = ex5%800;
    fill(m%360, 255, 255);
    ellipse(ex5/5, (4*j)%800, 100, 100);


    break;

  case 6: 

    background(255);
    colorMode(HSB, 255, 255, 255);
    noStroke();
    j = 0;

    while (j< mouseX)
    {
      int l = 0;
      j+=10;
      for (int q = l; q < mouseY; q+=10)
      {
        fill((j*q)%255, 255, 255);
        ellipse(j, q, 10, 10);
      }
    }

    break;
  case 7:
    float q = 0;
    background(255);
    colorMode(HSB, 255, 255, 255);

    for (float i = 0; i < 300; i += 18.75)
    {
      for (float j = 0; j < 300; j += 18.75)
      {
        float l = i*255/300;
        float m7 = j*255/300; 
        q = 16*l+m7;
        stroke(10);
        fill(q%255, 255, 255);
        ellipse(i%300+5, j%300+5, 18.75, 18.75);
      }
    }

    for (int k7 = 255; k7 > 0; k7 -=1)
    {
      noStroke();
      fill(k7, 255, 255);
      ellipse(width/2, (height/4)*3, k7, k7);
    }
    break;

  case 8:
    textSize(32);
    text("This page intentionally left blank", width/4, height/2);
    break;

  case 9:
    strokeWeight(10);
    stroke(0);
    for (int i = 0; i < 50; i++)
    {
      if (ex9[i] <= 300)
      {
        linebottom = 0;
      } else
      {
        linebottom = 600;
      }
      line(16*i, linebottom, 16*i, ex9[i]);
    }
    break;
  case 10:
    text("see console for excercise, same teststring as excercise", width/4, height/2);
    String userinput = "Whatever you put here, it must always be school appropriate.";
    println("The number of characters in this string is " + findLength(userinput ));
    println("The number of capital letters in this string is " + numberOfCapitals(userinput ));
    println("The number of vowels in this string is " + numberOfVowels(userinput ));
    println("The number of words in this string is " + numberOfWords(userinput ));
    println("The number of punctuation marks in this string is " + numberOfMarks(userinput ));
    println("The most common letter in this string is " + mostcommonletter(userinput ));
    break;
  case 11:
    text("Identical to excercise 10", width/4, height/2);
    break;
  case 12:
    text("see console for excercise (may take a while)", width/4, height/2);
    String[] othello = loadStrings("othello.txt");
    for (int i = 0; i < othello.length; i++)
    {
      sentenceToCheck += othello[i];
    }
    String[] illiad = loadStrings("illiad.txt");
    for (int i = 0; i < illiad.length; i++)
    {
      sentenceToCheck2 += illiad[i];
    }
    String[] homeo = loadStrings("romeoAndJuliet.txt");
    for (int i = 0; i < homeo.length; i++)
    {
      sentenceToCheck3 += homeo[i];
    }
    String[] odyssey = loadStrings("theOdyssey.txt");
    for (int i = 0; i < odyssey.length; i++)
    {
      sentenceToCheck4 += odyssey[i];
    }

    String[] hamlet = loadStrings("hamlet.txt");
    for (int i = 0; i < hamlet.length; i++)
    {
      sentenceToCheck5 += hamlet[i];
    }

    String[] macbeth = loadStrings("macbeth.txt");
    for (int i = 0; i < macbeth.length; i++)
    {
      sentenceToCheck6 += macbeth[i];
    }


    println("The number of characters in othello is " + findLength(sentenceToCheck));
    println("The number of capital letters in the iliad is " + numberOfCapitals(sentenceToCheck2));
    println("The number of vowels in romeo and juliet is " + numberOfVowels(sentenceToCheck3));
    println("The number of words in the Odyssey is " + numberOfWords(sentenceToCheck4));
    println("The number of punctuation marks in Hamlet is " + numberOfMarks(sentenceToCheck5));
    println("The most common letter in Macbeth is " + mostcommonletter(sentenceToCheck6));
    break;
  }
}
