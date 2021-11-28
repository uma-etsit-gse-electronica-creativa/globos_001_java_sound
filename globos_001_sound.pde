// Array de globos sonoros
ArrayList<GloboSonoro> globos;

void setup()
{
  size(displayWidth, displayHeight);
  background(255, 255, 255);
  globos = new ArrayList<GloboSonoro>();
}

void draw()
{
  background(155, 226, 244);
  for (int i=globos.size()-1;i>=0; i--)
  {
    GloboSonoro g = globos.get(i);
    g.update();
    if (g.visible()) {
      g.draw();
    }
    else {
      globos.remove(i);
    }
  }
}

void mousePressed()
{
  globos.add(new GloboSonoro(this, 
                             random(100, 150), 
                             color(random(255),random(255),random(255)),
                             mouseX, 
                             mouseY, 
                             0.0, 
                             0.0
                             )
             );
    println(globos.size());
}
