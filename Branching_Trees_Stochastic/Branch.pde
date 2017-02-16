class Branch
{
  
  float len;
  
  PVector start;
  
  Branch(PVector begin)
  {
    start = begin.get();
  }
  
  void generate(int len_)
  {
    float angle = random(0,PI/3);
    
    float thickness = map(len_,1,120,1,10);
    stroke(255);
    strokeWeight(thickness);
    
    line(0,0,0,-len_);
    
    translate(0,-len_);
    
    
    len_ *= 0.70;
    
    if(len_ > 2)
    {
      pushMatrix();
      rotate(angle);
      generate(len_);
      if(len_>=2)
      {
        generate(len_);
        fill(255,0,0);
        ellipse(0,0, 2,2);
      }
      popMatrix();
      pushMatrix();
      rotate(-angle);
      if(len_>=2)
      {
        generate(len_);
        fill(255,0,0);
        ellipse(0,0, 1,1);
      }
      popMatrix();
    }
    
  }
}