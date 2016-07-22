import tree;
import atoms;


Atom h_1 = Atom("H", (-1,0,0));
Atom h_2 = Atom("H", (1,0,0));

currentprojection = perspective(0,10,0);

h_1.color = red;
h_2.color = blue;

h_1.draw(true);
h_2.draw(true);


Bond(h_1,h_2).draw();


//vim-run: asy -batchView %
//vim-run: asy -f pdf %
