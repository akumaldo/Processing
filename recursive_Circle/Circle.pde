class Circle
{


  Circle()
  {

  }
  
  void run(float x, float y,float d)
  {
    

    if(d>1)
    {
      stroke(255);
      noFill();
      ellipse(x,y,d,d); 
      run(x+d/2,y,d/2);
      run(x-d/2,y,d/2);
      run(x,y-d/2,d/2);
    }
   }
  
}