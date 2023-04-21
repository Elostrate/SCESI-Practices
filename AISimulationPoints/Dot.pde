class Dot{
  PVector pos;
  PVector vel;
  PVector acc;
  Brain brain;

  boolean dead = false;
  boolean reachedGoal = false;
  boolean isBest = false;

  float fitness = 0;

  Dot(){
    brain = new Brain(400);

    pos = new PVector(width/2, height - 30);
    vel = new PVector(0,0);
    acc = new PVector(0,0);
  }

  void show(){
    if(isBest){
      fill(0,255,0);
      ellipse(pos.x, pos.y, 8, 8);
      
    }else{
      fill(0);
      ellipse(pos.x, pos.y, 4, 4);
    }
  }

  void move(){
    if(brain.directions.length > brain.step){
      acc = brain.directions[brain.step];
      brain.step++;
    }else {
      dead = true;
    }

    vel.add(acc);
    vel.limit(5);
    pos.add(vel);
  }

  void update(){
    if(!dead && !reachedGoal){
      move();
      if(pos.x < 2 || pos.y < 2 || pos.x > width - 2 || pos.y > height - 2){
        dead = true;
        
      }else if(dist(pos.x, pos.y, goal.x, goal.y) < 5){
        reachedGoal = true;
        
      //x = posX + tamX, y = posY + tamY, x = posX, y = posY  
      }else if(pos.x < 500 && pos.y < 710 && pos.x > 0 && pos.y > 700){//Añadir colision de obstaculos
        dead = true;
      }else if(pos.x < 800 && pos.y < 610 && pos.x > 500 && pos.y > 600){//Añadir colision de obstaculos
        dead = true;
      }else if(pos.x < 310 && pos.y < 600 && pos.x > 300 && pos.y > 100){//Añadir colision de obstaculos
        dead = true;
      }else if(pos.x < 410 && pos.y < 510 && pos.x > 310 && pos.y > 500){//Añadir colision de obstaculos
        dead = true;
      }else if(pos.x < 600 && pos.y < 410 && pos.x > 400 && pos.y > 400){//Añadir colision de obstaculos
        dead = true;
      }
  
  fill(0, 0, 255);
  rect(310, 500, 100, 10);
  
  fill(0, 0, 255);
  rect(400, 400, 200, 10);
    }
  }
    
  void calculateFitness(){
    if(reachedGoal){
      fitness = 1.0/16.0 + 10000.0/(float)(brain.step * brain.step);
    }else{
      float distanceToGoal = dist(pos.x, pos.y, goal.x, goal.y);
      fitness = 1.0/(distanceToGoal * distanceToGoal);
    }
      
  }
  
  Dot gimmeBaby(){
    Dot baby = new Dot();
    baby.brain = brain.clone();
    return baby;
    
  }
}
