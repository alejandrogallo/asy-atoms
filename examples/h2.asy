import atoms;

unitsize(1cm);
currentprojection = perspective(1,1,1);
//settings.prc       = false;
//settings.render    = 10; //quality
//settings.outformat = "png"; //output 

real bond_radius = 3.0;
real radius_scale = 0.2;

Atom h_1 = Atom("H", (-1,0,0));
Atom h_2 = Atom("H", (1,0,0));

h_1.color = red;
h_2.color = blue;

h_1.draw(true);
h_2.draw(true);

Bond(h_1,h_2).draw(radius=bond_radius);

//vim-run: clear; asy -batchView %
//vim-run: asy -f png % && mupdf h2.png
