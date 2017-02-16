import toxi.physics2d.constraints.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.*;

import toxi.geom.*;


VerletPhysics2D physics;

float GRAVITY_ = 0;
ArrayList<Cluster> cluster;

boolean showParticles = true, showPhysics = true;

int NumCluster = 8;



void setup()
{
  
  size(600,600,P2D);
  
  smooth();
  frameRate(30);
  
  
  physics = new VerletPhysics2D();
   
  physics.addBehavior(new GravityBehavior2D(new Vec2D(0,GRAVITY_)));
  
  physics.setWorldBounds(new Rect(0,0,width,height));
  
  cluster = new ArrayList<Cluster>();
  
  for(int i = 0; i <= NumCluster; i++)
  {
    cluster.add(new Cluster((int)random(3,40), (int)random(10,100), new Vec2D(width/2,height/2)));
  }
  
  for(int i = 0; i < cluster.size()-1; i++)
  {
    for(int j = i+ 1; j < cluster.size(); j++)
    { 
      Cluster ci = (Cluster) cluster.get(i); 
      Cluster cj = (Cluster) cluster.get(j);
      ci.connect(cj);
    }
  }
}
  

void draw()
{
  background(255);
  
  physics.update();
  
  if(showPhysics)
  {
    for(int i = 0; i < cluster.size()-1; i++)
      { 
       Cluster ci = (Cluster) cluster.get(i);
       ci.clusterConnection();
       for(int j = i+ 1; j < cluster.size(); j++)
        { 
          Cluster cj = (Cluster) cluster.get(j);
          cj.clusterConnection();
          ci.displayConnection(cj);
        }
      }
  }
  
  if(showParticles)
  {
    for(Cluster c : cluster)
    c.displayNodes();
  }
  
}
  
 
  
void newGraph() {

  // Clear physics
  physics.clear();

  // Create new ArrayList (clears old one)
  cluster = new ArrayList();

  // Create 8 random clusters
  for (int i = 0; i < NumCluster; i++) {
    Vec2D center = new Vec2D(width/2,height/2);
    cluster.add(new Cluster((int) random(3,40),(int)random(20,100),center));
  }

  //  All clusters connect to all clusters  
  for (int i = 0; i < cluster.size(); i++) {
    for (int j = i+1; j < cluster.size(); j++) {
      Cluster ci = (Cluster) cluster.get(i);
      Cluster cj = (Cluster) cluster.get(j);
      ci.connect(cj);
    }
  }

}

void keyPressed() {
  if (key == 'c') {
    showPhysics = !showPhysics;
    if (!showPhysics) showParticles = true;
  } 
  else if (key == 'p') {
    showParticles = !showParticles;
    if (!showParticles) showPhysics = true;
  } 
  else if (key == 'n') {
    newGraph();
  }
  
}