//import processing.javafx.*;

// set the parameters of the functions
PImage startscreen; // import library image 'startscreen'
PFont font; // import library font 'font'
int stage; // // Declare variable 'stage' of type int
//import java.util.Random; // import java random class to generate a stream of pseudorandom numbers
//import javafx.scene.paint.Color; // import java color class to encapsulate colors in the default sRGB color space
//import java.awt.Robot; // import java class robot to help with mouse and keyboard control
boolean TF=true; // Declare variable 'TF' of type boolean and assigns it as true
float x; // Declare variable 'x' of type float
float y; // Declare variable 'y' of type float
int sens=1; // Declare variable 'sens' of type int and assigns it the value of 1
import processing.sound.*; // import processing sound library
SoundFile mySound; // Soundfile is called mySound
int maxrandvel = 3; // Declare variable 'maxrandvel' of type int and assigns it the value of 3
int fadetime = 10; // Declare variable 'fadetime' of type int and assigns it the value of 10
particle[] particles = new particle [100]; // declares a new public class named 'particle' and tells it to spawn 100 of them
int time; // Declare variable 'time' of type int

void setup(){ // defines properties of my functions
  stage = 1; // function starts out as stage 1
  size(1280,720); // makes the size of the screen 1280 by 720
  time = millis(); // sets the time to be counted in milliseconds
  startscreen = loadImage("environment.jpg"); // the startscreen image that gets loaded in is "environment.jpg" from my data foler
  image(startscreen, 0, 0,1280,720); // the startscreen image is loaded in at (0,0) and is 1280 pixels wide and 720 pixels tall
  font = loadFont("font.vlw"); // this loads in the font named "font.vlw" from my data folder
  textFont(font); // this makes my text be in the font that was just loaded in
  fill(255, 255, 255); // makes my text the color white
  for(int o = 0;o < particles.length; o ++){  // fills array. for loop declares variable 'o' of type int and assigns it the value of 0, if o is less than particle.lenght, increase the value of integer o by 1
  particles[o] = new particle(); // when particles[o] array runs, it creates a new particle
}
  mySound = new SoundFile(this, "zodiac.wav"); // my sound is the soundfile "zodiac.wav" in my data folder
  mySound.rate(1.2); // makes the playback speed of the sound at 1.2
  mySound.play(); // plays the sound
}

public int change(){ // changing the value of variables through a method of public int change
     float a = random(200); // this variable is to set the first value of the color as random
     float p = random(200); // this variable is to set the second value of the color as random
     float h = random(200); // this variable is to set the third value of the color as random
     color alive = color(a,p,h); // color for active, or alive, cells is in color(a,p,h)
     return alive; // return the alive colors from the function
    }

void draw(){ // executes the following lines of code
  if(stage == 1){ // this makes sure that the following code only runs during stage 1
    noCursor(); // hides the cursor from view
    textAlign(CENTER); // aligns the the text to the center in relation of its x and y coordinates
    textSize(55); // makes the size of the text 55
    text("Interstellar Dimension", 700, 150); // the text printed is "Interstellar Dimension" and it's printed at (700,150)
    textSize(30); // makes the size of the next text 30
    text("press spacebar to close your eyes", 740, 185); // the text printed is "press spacebar to close your eyes" and it's printed at (740,185)
    if(keyPressed == true){ // if any key is pressed,
      stage = 2; // then the draw function will run stage 2
    }
  }
  if(stage == 2){ // this makes sure that the following code only runs during stage 2
   fill(0,fadetime);  // fancy fade rendering (transparent background)
   rect(-2,-2,width+2,height+2); // draw transparent background
   noCursor(); // hides the cursor from view
     float a = random(100,256); // declares variable of float 'a' as a random value between 100 and 256
     float p = random(100,256); // declares variable of float 'p' as a random value between 100 and 256
     float h = random(100,256); // declares variable of float 'h' as a random value between 100 and 256
     color alive = color(a,p,h); // color for active, or alive, cells is in color(a,p,h)
   for (int i=-70; i<1000;i+=70) { // for loop declares variable 'i' of type int and assigns it the value of -70, if i is less than 1000, then i = i + 70
    for (int j=-70; j<1000;j+=70) { // for loop declares variable 'j' of type int and assigns it the value of -70, if j is less than 1000, then j = j + 70
      noFill(); // no fill color on the following objects
      stroke(alive); // calls the stroke of the objects to be alive for active cells
      strokeWeight(1); // stroke weight of objects is 1
      if (TF) { // if TF is true (it was set as true in the parameters in the beginning)
        x=mouseX; // x-value is x-location of the mouse
        y=mouseY; // y-value is y-location of the mouse
      }
      ellipse(i*2+70,j*2+70,abs(sens*(x-250)),abs(sens*(y-250))); // draws an ellipse at (i-value*2+70,j-value*2+70) with the dimensions of: absolute value (magnitude) of sense*(x-250) for height by absolute value (magnitude) of sens*(y-250) for width
      ellipse(i*2+70,j*2+70,abs(sens*(y-250)),abs(sens*(x-250))); // draws an ellipse at (i-value*2+70,j-value*2+70) with the dimensions of: absolute value (magnitude) of sense*(y-250) for height by absolute value (magnitude) of sens*(x-250) for width
      sens=max(sens-1,1); // the value of sens is the maximum value of either sens-1 or 1
    }
     }
   for (int o = 0; o < particles.length; o++){  // for loop fufills the life of a particle. declares variable 'o' of type int and assigns it the value of 0, if o is less than particle.lenght, increase the value of integer o by 1
    particles[o].simulate(); // runs the particle class simulate function
    particles[o].display(); // runs the particle class display function
    particles[o].updateMe(); // runs the particle class update me function
  }
  if( millis() < time + 5000){ // if the millis is less than time + 5000 milliseconds (or less than 5 seconds have gone by)
    fill(150,150,150); // the fill of the following text is in gray
     textSize(40); // the text size is 40
    text("move cursor around", 640, 425); // displays text 'move cursor around' at (640,425)
  }
  }
  
}
