class Cells
{
  float x;
  float y;
  
  int w;
  
  int state, previous;
  
  
  Cells(float x_, float y_, int w_)
  {
    x = x_;
    y = y_;
    w = w_;
    
   state = int(random(2));
   previous = state;
  
  }
  
  void savePrevious()
  {
    previous = state;
  }
  
  void newState(int s)
  {
    state = s;
  }
  
  void display()
  {
    if(previous == 0 && state == 1) fill(0,0,255);
    else if(state == 1) fill(0);
    else if(previous == 1 && state == 0) fill(255,0,0);
    else fill(255);
    stroke(0);
    strokeWeight(1); 
    rect(x,y,w,w);
  }
  
  
}