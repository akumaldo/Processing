ArrayList <ParticleSystem> p;
Repeller repeller;

void setup()

{
  size(1000, 660);
  p = new ArrayList<ParticleSystem>();
  repeller = new Repeller();
  
}



void draw()

{
  background(255);
  PVector gravity = new PVector(0, 0.5);
  for(int i = 0; i < p.size(); i++)
  {
    p.get(i).run();
    p.get(i).applyForce(gravity);
    p.get(i).applyRepell(repeller);
  }
  repeller.display();
  repeller.mousePresent(mouseX,mouseY);
  repeller.drag();

}

void mousePressed()
{ 
  if(!repeller.hover(mouseX,mouseY))
  {
    p.add(new ParticleSystem(mouseX,mouseY, random(1,10)));
  }else
  {
    repeller.clicked(mouseX,mouseY);
  }

  
}


void keyPressed() {
  
  PVector wind = new PVector(2,0.0);
  
  PVector windL = new PVector(-2,0.0);
  
  
  if (keyCode == RIGHT) {
       for(int index = p.size()-1; index>=0; index--){
          p.get(index).applyForce(wind);
      }

     }else if (keyCode == LEFT) {
       for(int index = p.size()-1; index>=0; index--){
        
         p.get(index).applyForce(windL);
      }
     }
}
     
void mouseReleased()
{
  repeller.stopDragging();
}