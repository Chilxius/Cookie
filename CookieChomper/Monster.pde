class Monster
{
  float xPos, yPos;
  float xSpeed, ySpeed;
  float size, mouthSize;
  int target;
  
  public Monster()
  {
    xPos = width/2;
    yPos = height/2;
    xSpeed = 0;
    ySpeed = 0;
    target = 0;
    size = 90;
    mouthSize = size*.8;
  }
  
  void drawMonster()
  {
    float gape = max(mouthSize/2,mouthSize*(mouthSize/max(mouthSize,dist(xPos,yPos,cookie[target].xPos,cookie[target].yPos)*1.5)));
    fill(0,0,200);
    ellipse(xPos,yPos,size,size);
    fill(75,0,0);
    circle(xPos,yPos,gape);
    push();
    translate(xPos,yPos);
    for(int i = 0; i < 10; i++)
    {
      rotate(PI/5);
      fill(255);
      square(0,gape/2-4,gape/10);
    }
    pop();
    
    //eyes
    fill(0,0,200);
    ellipse(xPos-size/2.3,yPos-size/2.2,size/2,size/2);
    ellipse(xPos+size/2.3,yPos-size/2.2,size/2,size/2);
    fill(255);
    ellipse(xPos-size/2.3,yPos-size/2.2,size/3,size/3);
    ellipse(xPos+size/2.3,yPos-size/2.2,size/3,size/3);
    fill(0);
    ellipse(xPos-size/2.3,yPos-size/2.2,size/5,size/5);
    ellipse(xPos+size/2.3,yPos-size/2.2,size/4,size/4);
    
  }
  
  void move()
  {
    target = findClosestCookie();
    if( xPos < cookie[target].xPos )
      xSpeed+=.1;
    else
      xSpeed-=.1;
    if( yPos < cookie[target].yPos )
      ySpeed+=.1;
    else
      ySpeed-=.1;
      
    if( xSpeed > 2 )
      xSpeed = 2;
    if( xSpeed < -2 )
      xSpeed = -2;
    if( ySpeed > 2 )
      ySpeed = 2;
    if( ySpeed < -2 )
      ySpeed = -2;
      
    xPos += min(5,xSpeed);
    yPos += min(5,ySpeed);
  }
  
  int findClosestCookie()
  {
    int returnValue = 0;
    for( int i = 1; i < cookie.length; i++ )
    {
      if( dist( cookie[i].xPos, cookie[i].yPos, xPos, yPos ) < dist( cookie[returnValue].xPos, cookie[returnValue].yPos, xPos, yPos ) )
        returnValue = i;
    }
    return returnValue;
  }
}
