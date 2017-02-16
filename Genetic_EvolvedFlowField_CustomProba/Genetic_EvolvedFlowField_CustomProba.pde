import java.awt.Rectangle;

int gridscale = 10;              // Scale of grid is 1/24 of screen size

// DNA needs one vector for every spot on the grid 
// (it's like a pixel array, but with vectors instead of colors)
int dnasize;

int lifetime;  // How long should each generation live

Population population;  // Population
int lifecycle;          // Timer for cycle of generation
int recordtime;         // Fastest time to target
Obstacle target;        // Target position
Obstacle start;         // Start position
int diam = 24;          // Size of target


Rectangle newObstacle = null;

ArrayList<Obstacle> obs;

void setup()
{
  size(1000,800,P2D);
  smooth();
  dnasize = (width/gridscale) * (height/gridscale);
  
  lifetime = width/2;
  
  int popmax = 2000;
  float mutationRate = 0.04;
  lifecycle = 0;
  recordtime = lifetime;
  
  target = new Obstacle(width-diam-diam/2,height/2-diam/2,diam,diam);//setting the target at the end of the screen
  start = new Obstacle(diam/2,height/2-diam/2,diam,diam);//setting the beggining, where all vehicles are born
  
  obs = new ArrayList<Obstacle>();
  
  population = new Population(popmax, mutationRate);
}

void draw()
{
  background(255);
  
  target.display();
  
  for(Obstacle o : obs)
    o.display();
    
  if(lifecycle < lifetime)
  {
    population.live(obs);
    if(population.targetReached() && lifecycle < recordtime)
    {
      recordtime = lifecycle;
    }
  lifecycle++;
  }
  else
  {
    lifecycle = 0;
    
    population.calcFitness();
    
    population.generate();
    
      
  }
  
   // Display some info
   textAlign(RIGHT);
   stroke(0,80);
   fill(0);
   text("Generation #:" + population.getGenerations(),width-10,18);
   text("Cycles left:" + ((lifetime-lifecycle)),width-10,36);
   text("Record cycles: " + recordtime,width-10,54);
   text("Mutation rate: " + nf(population.getMutationRate(),0,2), width-10,74);
   text("Average fitness: " + population.getAverageFitness(), width-10, 94);
   fill(175,40);
   if (newObstacle != null) {
     rect(newObstacle.x,newObstacle.y,newObstacle.width,newObstacle.height); 
   }
    
}


void mousePressed()
{
  newObstacle = new Rectangle(mouseX,mouseY,0,0);
}

void mouseDragged()
{
  newObstacle.width = mouseX - newObstacle.x;
  newObstacle.height = mouseY - newObstacle.y;
}

void mouseReleased()
{
  obs.add(new Obstacle(newObstacle));
  newObstacle = null;
}
  