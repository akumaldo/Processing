class Lsystem
{
  Rule[] ruleset;
  
  String sentence;

  int generation;
  
  Lsystem(String axiom_, Rule[] ruleset_)
  {
    sentence = axiom_;  
    ruleset = ruleset_;
    generation = 0;
    
  }

  void generate()
  {
  StringBuffer next = new StringBuffer();
  
  for(int i = 0; i < sentence.length(); i++)
    {
      // What is the character
      char curr = sentence.charAt(i);
      // We will replace it with itself unless it matches one of our rules
      String replace = "" + curr;
      for(int j = 0; j < ruleset.length; j++)
      {
        char a = ruleset[j].getA();
        if(a == curr)
        {
          replace = ruleset[j].getB();
          break;
        }
      }
    next.append(replace);
    }
  sentence = next.toString();
  generation++;
  }


  String getSentence()
  {
    return sentence;
  }
  
  
  int getGeneration()
  {
    return generation;
  }
  
}