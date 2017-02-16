class Render
{
  
  String toDoAction;
  int a;
  float len;
  float theta;
  
  Render(String s, float len_, float theta_)
  {
    toDoAction = s;
    len = len_;
    theta = theta_;
  }

  void render()
  {
    stroke(0, 175);
    for(int i = 0; i < toDoAction.length(); i++)
    {
      char c = toDoAction.charAt(i);
      if(c == 'F' || c == 'G')
      {
        line(0,0,0,len);
        translate(0,len);
      } else if (c == '+') {
        rotate(theta);
      } else if (c == '-') {
        rotate(-theta);
      } else if (c == '[') {
        pushMatrix();
      } else if (c == ']') {
        popMatrix();
      }
    }
  }
  
   void setLen(float l) {
    len = l;
  } 

  void changeLen(float percent) {
    len *= percent;
  }

  void setToDo(String s) {
    toDoAction = s;
  }
  
}