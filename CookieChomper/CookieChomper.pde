Cookie cookie[] = new Cookie[20];

void setup()
{
  size(1000,800);
  for( int i = 0; i < cookie.length; i++ )
    cookie[i] = new Cookie();
}

void draw()
{
  background(0);
  moveAndDrawCookies();
  
  for( int i = 0; i < cookie.length; i++)
    println(cookie[i].type);
  println();
}

void moveAndDrawCookies()
{
  for( Cookie c: cookie )
  {
    c.move();
    c.drawCookie();
  }
}
