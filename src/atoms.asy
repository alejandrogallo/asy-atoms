import three;

import db;


struct Atom {
  triple position;
  real radius;
  string element;
  string label;
  pen color;
  void operator init(string element, triple position){
    for ( AtomInfo info : ATOMS_INFO ) {
      if ( info.element == element ) {
        this.element = info.element;
        this.color = info.color;
        this.position = position;
        this.radius  = info.atomic_radius;
      }
    }
  };
  void draw (){
    draw(shift(position)*scale3(radius)*unitsphere, color);
  };
};


currentprojection = perspective(-1,0,0);
int separation = 8;
int columns = 10,row=-1;
int atomsNumber = ATOMS_INFO.length;
//int atomsNumber = 20;
for ( int i = 0; i < atomsNumber; i+=1 ) {
  if (i%columns == 0) ++row;
  string element = ATOMS_INFO[i].element;
  if (element == "He") i=columns - 1;
  triple pos = (separation*(i%columns),0,-separation*row);
  Atom atom = Atom(element, pos);
  atom.draw();
  label(scale(0.2)*atom.element, atom.position+(0,0,separation/2));
  label(scale(0.2)*hex(atom.color), atom.position+(0,0,1));
}
//draw(L=Label("$x$", position=Relative(0.8), align=N), O--X*10, blue, Arrow3);
//draw(O--Y*10,green,Arrow3);
//draw(O--Z*10,red,Arrow3);
