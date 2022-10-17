class Cookie
{
  float xPos, yPos;
  float xSpeed, ySpeed;
  float size;
  
  int type;
  color frostColor = color( random(120,255), random(120,255), random(120,255) );
  
  public Cookie()
  {
    size = 75;
    xPos = random(size/2,width-size/2);
    yPos = height - size/2;
    xSpeed = random(-5,5);
    ySpeed = random(-5,5);
    
    type = int(random(1,4));
  }
  
  void move()
  {
    xPos += xSpeed;
    yPos += ySpeed;
    
    if( xPos > width-size/2 || xPos < size/2 )
      xSpeed = -xSpeed;
    if( yPos > height+size/2 || yPos < size/2 )
      ySpeed = -ySpeed;
  }
  
  void drawCookie()
  {
    noStroke();
    fill(190,170,130);
    ellipse(xPos,yPos,size,size);
    
    //topping
    switch(type)
    {
      case 1:
        push();
        translate(xPos,yPos);
        rotate(PI/xSpeed);
        fill(0);
        for(int i = 0; i < 6; i++)
        {
          square(0,10+5*(i%3),10);
          rotate(PI/3);
        }
        pop();
        break;
      case 2:
        push();
        translate(xPos,yPos);
        rotate(PI/ySpeed);
        stroke(170,150,110);
        strokeWeight(3);
        line(0,size/3,0,-size/3);
        line(size/5,size/3.5,size/5,-size/3.5);
        line(-size/5,size/3.5,-size/5,-size/3.5);
        pop();
        break;
      case 3:
        push();
        translate(xPos,yPos);
        fill( frostColor );
        for( int i = 0; i < 5; i++ )
        {
          ellipse(0,size/5,size/2,size/2);
          rotate(TWO_PI/5);
        }
        pop();
        break;
      default:
        fill(200,0,0);
        ellipse(xPos,yPos,size,size);
    }
  }
}
