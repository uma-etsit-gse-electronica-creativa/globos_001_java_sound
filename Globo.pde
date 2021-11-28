import processing.sound.*;

// Copiada la idea del ejemplo de la librería Sound/Sampler 
// Crea un array de valores que representan las octavas. 1.0 velocidad normal, 0.5 is la mitad y 
// por tanto una octava más abajo 2.0 es el doble, o sea una octava más arriba.
float [] octave = {0.25, 0.5, 1.0, 2.0, 4.0};

// Número de sonidos 
int numsounds = 5;

class GloboSonoro
{
  float _d, _x, _y, _vx, _vy;
  color _col;
  PApplet _p;
  SoundFile f;
  float _octava;
  GloboSonoro(PApplet p, float diametro, color col, float x, float y, float vx, float vy)
  {
    _p=p;
    _d = diametro;
    _col = col;
    _x = x;
    _y = y;
    _vx = vx;
    _vy = vy;
    
    // Cargar uno de los cinco sonidos (1.aif, 2.aif, 3.aif...)
    f = new SoundFile(p,(int)random(1,numsounds+1) + ".aif");
    
    // Y reproducirlo a una velocidad aleatoria de las del array octave[]
    _octava = octave[int(random(0, 5))];
    f.play(_octava,1.0); // El 1.0 es máximo volumen. 
  }
  void update()
  {
    _vy -= random(0.02, 0.05);
    _vx += random(-0.1, 0.1);
    _x = _x + _vx;
    _y = _y + _vy;
  }
  void draw()
  {
    // Parte visual. 
    push();
    fill(_col);
    translate(_x, _y);
    ellipse(0, 0, _d,_d);
    translate(0,_d/2+5);
    triangle(0,-5,-5,0,5,0);
    pop();
    
    // Parte sonora: si ya dejó de sonar, que empiece de nuevo. 
    if (!f.isPlaying()) {
          f.play(_octava,1.0);
    }  
  }
  
  boolean visible()
  {
    return (_y + _d + 5) > 0;
  }
}
