class Repeller {
  
  float mass;    // Mass, tied to size
  float G;       // Gravitational Constant
  PVector position;   // position
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  PVector dragOffset;  // holds the offset for when object is clicked on

  Repeller() {
    position = new PVector(width/2,height/2);
    mass = 30;
    G = 2.2;
    dragOffset = new PVector(0.0,0.0);
  }

  PVector repell(Particles p) {
    PVector force = PVector.sub(position,p.loc);   // Calculate direction of force
    float d = force.mag();                              // Distance between objects
    //d = constrain(d,5.0,25.0);                          // Limiting the distance to eliminate "extreme" results for very close or very far objects
    force.normalize();                                  // Normalize vector (distance doesn't matter here, we just want this vector for direction)
    float strength = -(G * mass * mass) / (d * d);     // Calculate gravitional force magnitude
    force.mult(strength);     // Get force vector --> magnitude * direction
    return force;
  }

  // Method to display
  void display() {
    ellipseMode(CENTER);
    strokeWeight(1);
    stroke(0);
    if (dragging) fill (50);
    else if (rollover) fill(100);
    else fill(175,200);
    ellipse(position.x,position.y,mass*2,mass*2);
  }

  // The methods below are for mouse interaction
  void clicked(int mx, int my) {
    float d = dist(mx,my,position.x,position.y);
    if (d < mass) {
      dragging = true;
      dragOffset.x = position.x-mx;
      dragOffset.y = position.y-my;
    }
  }

  boolean hover(int mx, int my) {
    float d = dist(mx,my,position.x,position.y);
    if (d < mass) {
      rollover = true;
      return true;
    } 
    else {
      rollover = false;
      return false;
    }
  }
  
  void mousePresent(int mx, int my) {
    float d = dist(mx,my,position.x,position.y);
    if (d < mass) {
      rollover = true;
      
    } 
    else {
      rollover = false;
     
    }
  }

  void stopDragging() {
    dragging = false;
  }



  void drag() {
    if (dragging) {
      position.x = mouseX + dragOffset.x;
      position.y = mouseY + dragOffset.y;
    }
  }

}