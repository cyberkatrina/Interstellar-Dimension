class particle{ // set the parameters of the class particle
  float velocityX = 0; // Declare variable 'velocityX' of type float and assigns it the value of 0
  float velocityY = 0; // Declare variable 'velocityY' of type float and assigns it the value of 0
  PVector loc; // location initializing
  PVector vel; // velocity initializing
  int xdirection = 1;  // Declare variable 'xdirection' of type int and assigns it the value of 1
  int ydirection = 1;  // Declare variable 'ydirection' of type int and assigns it the value of 1
  
  particle (){  // gives the particles' location and velocity original values
  loc = new PVector (random(width),random(height)); // gives the location a random value within box
  vel = new PVector (random(maxrandvel),random(maxrandvel)); // gives the velocity a random value between 0 and maximum random velocity
  }
  
  void simulate(){  // this is to simulate the particles
  loc.add(vel); //add velocity to location
}

  void display(){ // this is to display the particles
  fill(255); // point color is white
  strokeWeight(2); // stroke weight of particles is 2
  line(loc.x,loc.y,loc.x-vel.x,loc.y-vel.y); // drawns a line consiting of (xlocation, ylocation to xlocation-xvelocity, ylocation-yvelocity)
  }
  
  void updateMe() { // this is to update the particle loaction to wrap around the screen
  //wrap screen on X axis
  if (loc.x > width) { // if xloacation is greater than width of screen
      loc.x = 0; // xlocation becomes 0
      }
  if (loc.x < 0) { // if xlocation is less than 0
      loc.x = width; // xlocation becomes width of screen
  }
  
  //wrap screen on Y axis
  if (loc.y > height) { // if yloacation is greater than height of screen
      loc.y = 0; // ylocation becomes 0
      }
  if (loc.y < 0) { // if ylocation is less than 0
      loc.y = height; // ylocation becomes height of screen
  }
    
  }
  
}
