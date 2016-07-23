import tree;
import atoms;

currentprojection = perspective(0,1000,0);
int separation = 8;
int columns = 10,row=-1;
int atomsNumber = ATOMS_INFO.length;
//int atomsNumber = 20;
for ( int i = 0; i < 80; i+=1 ) {
  if (i%columns == 0) ++row;
  string element = ATOMS_INFO[i].element;
  if (element == "He") i=columns - 1;
  triple pos = (separation*(i%columns),0,-separation*row);
  Atom atom = Atom(element, pos);
  atom.draw(true);
  //label(scale(0.2)*atom.element, atom.position+(0,0,separation/2));
  //label(scale(0.2)*hex(atom.color), atom.position+(0,0,1));
}

//draw(L=Label("$x$", position=Relative(0.8), align=N), O--X*10, blue, Arrow3);
//draw(O--Y*10,green,Arrow3);
//draw(O--Z*10,red,Arrow3);

//vim-run: asy -batchView %
//vim-run: asy -f pdf %
