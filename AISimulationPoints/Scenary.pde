Population test;
PVector goal = new PVector(400, 10);

void setup(){
  size(800, 800);
  test = new Population(1000);
}

void draw(){
  background(255);
  fill(255, 0, 0);
  ellipse(goal.x, goal.y, 10, 10);
  textSize(24);
  text("Generation: " + test.gen, 10, 30);
  text("Minimun steps: " + test.minStep, 10, 60);

//--------Obstacles---------
  //rotate(radians(45));
  fill(0, 0, 255);
  rect(0, 700, 500, 10);
  //resetMatrix();
  fill(0, 0, 255);
  rect(500, 600, 300, 10);
  
  fill(0, 0, 255);
  rect(300, 100, 10, 500);
  
  fill(0, 0, 255);
  rect(310, 500, 100, 10);
  
  fill(0, 0, 255);
  rect(400, 400, 200, 10);
  
//----------------------------

  if(test.allDotsDead()){
    test.calculateFitness();
    test.naturalSelection();
    test.mutateDemBabies();
    
  }else{
    test.update();
    test.show();
  }
  

}
