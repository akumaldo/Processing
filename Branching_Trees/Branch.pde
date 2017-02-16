class Branch
{
  
  float len;
  
  PVector start;
  
  Branch(PVector begin)
  {
    start = begin.get();
  }
  
  void generate(int len_, float angle)
  {
    
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
      generate(len_,angle);
      popMatrix();
      pushMatrix();
      rotate(-angle);
      generate(len_,angle);
      popMatrix();
    }
  }
    
}