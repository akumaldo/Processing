class Vehicles
{
  final float MAXSPEED = 6.0;
  
  final float MAXFORCE = 1.0;
  
  float sides = 3;
  
  PVector vel,pos,acc;
  
  DNA dna;
  
  float fitness;
  
  boolean dead;
  
  int finish;
  
  boolean stopped;
  
  float recordDist;
  
  
  
  Vehicles(PVector origin, DNA dna)
  {
   pos = origin.get();
   vel = new PVector();
   acc = new PVector();
   
   this.dna = dna;
   
   dead = false;
   
   finish = 10000;
   
   stopped = false;
   
   recordDist = width;

  }
  
  float getFitness() {
    return fitness;
  }

  DNA getDNA() {
    return dna;
  }

  
   // FITNESS FUNCTION 
  // distance = distance from target
  // finish = what order did i finish (first, second, etc. . .)
  // f(distance,finish) =   (1.0f / finish^1.5) * (1.0f / distance^6);
  // a lower finish is rewarded (exponentially) and/or shorter distance to target (exponetially)
 
  void calcFitness() {
    float d = recordDist;
    if (d < diam/2) {
      d = 1.0;
    }
    // Reward finishing faster and getting closer
    fitness = (1/pow(finish,1.5)) * (1/pow(d,6));
    
    //if (dead) fitness = 0;
  }
  
 void setFinish(int f) {
    finish = f;
  }
  

  boolean stopped() {
    return stopped;
  }
  
  boolean borders() {
  if ((pos.x < 0) || (pos.y < 0) || (pos.x > width) || (pos.y > height)) {
      return true;
    } else {
      return false;
    }
  }
 
  void run(ArrayList<Obstacle> o) {
    if (!stopped) {
       update();
      // If I hit an edge or an obstacle
      if ((borders()) || (obstacles(o))) {
        stopped = true;
        dead = true;
      }
    }
    // Draw me!
    display();
  }

  
  boolean obstacles(ArrayList<Obstacle> o) {
    for (Obstacle obs : o) {
      if (obs.contains(pos)) {
        return true;
      }
    }
    return false;
  }
  
  boolean finished() {
    float d = dist(pos.x,pos.y,target.r.x,target.r.y);
    if (d < recordDist) {
      recordDist = d;
    }
    if (target.contains(pos)) {
      stopped = true;
      return true;
    }
    return false;
  }

  void display()
  {
    float theta = vel.heading2D() + PI/2;
    fill(175,100);
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(theta);
    beginShape(TRIANGLES);
    vertex(0, -sides*2);
    vertex(-sides, sides*2);
    vertex(sides, sides*2);
    endShape(CLOSE);
    popMatrix();

  }
    
  void update()
  {
   if (!finished()) {
      // Where are we?  Our position will tell us what steering vector to look up in our DNA;
      int x = (int) pos.x/gridscale;
      int y = (int) pos.y/gridscale;
      x = constrain(x,0,width/gridscale-1);  // Make sure we are not off the edge
      y = constrain(y,0,height/gridscale-1); // Make sure we are not off the edge

      // Get the steering vector out of our genes in the right spot
      // A little Reynolds steering here
      PVector desired = dna.genes[x+y*(width/gridscale)].get();
      desired.mult(MAXSPEED);
      PVector steer = PVector.sub(desired,vel);
      acc.add(steer);
      acc.limit(MAXFORCE);
      
      vel.add(acc);
      vel.limit(MAXSPEED);
      pos.add(vel);
      acc.mult(0);
      }
  }
  

}
  
  