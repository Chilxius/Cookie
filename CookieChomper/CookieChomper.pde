Cookie cookie[] = new Cookie[20];
Monster monster;

void setup()
{
  size(1000,800);
  for( int i = 0; i < cookie.length; i++ )
    cookie[i] = new Cookie();
  monster = new Monster();
  rectMode(CENTER);
}

void draw()
{
  background(0);
  moveAndDrawMonster();
  moveAndDrawCookies();
  checkForChomp();
}

void moveAndDrawMonster()
{
  monster.move();
  monster.drawMonster();
}

void moveAndDrawCookies()
{
  for( Cookie c: cookie )
  {
    c.move();
    c.drawCookie();
  }
}

void checkForChomp()
{
  if( dist(monster.xPos,monster.yPos,cookie[monster.target].xPos,cookie[monster.target].yPos) < 20 )
    cookie[monster.target] = new Cookie();
}
