import processing.sound.*;

Cookie cookie[] = new Cookie[20];
Monster monster;
SoundFile crunch[] = new SoundFile[4];

void setup()
{
  size(1000,800);
  for( int i = 0; i < cookie.length; i++ )
    cookie[i] = new Cookie();
  monster = new Monster();
  rectMode(CENTER);
  
  crunch[0] = new SoundFile(this, "crunch.wav");
  crunch[1] = new SoundFile(this, "02.wav");
  crunch[2] = new SoundFile(this, "03.wav");
  crunch[3] = new SoundFile(this, "04.wav");
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
  {
    crunch[int(random(1,3))].play();

    cookie[monster.target] = new Cookie();
  }
}
