// File produced automatically by chuchu program
// https://github.com/alejandrogallo/chuchu

// include asy_atoms from a specific path
//include "atom.asy";
// or import it from your system
import atoms;

unitsize(1cm);

//currentprojection  = perspective(1,1,1);
settings.prc         = false;
settings.render      = 10; //quality
//settings.outformat = "png";



real bond_radius   = 5.9;
real radius_scale  = 1.2;
real max_bond_dist = 2;
real min_bond_dist = 0;
currentlight       = AtomLight;
currentlight       = Headlamp;
currentlight       = Viewport;

currentprojection=perspective(
camera=(6.30636776368933,-12.5769800974906,10.1121122738873),
up=(-0.0061465058883311,0.0122549259004855,0.0325047513677092),
target=(-0.431319987783552,6.45511985365232,1.66257180630823),
zoom=0.746215396636627,
angle=24.4612021769686,
viewportshift=(-0.0650324996245379,0.167083213899803),
autoadjust=false);




Basis basis = Basis(
    (4.084, 0, 0), (0, 4.084, 0), (0, 0, 4.084)
); //This basis has been already scaled up



Atom Li1 = Atom("Li", (0.0, 0.0, 0.0), basis = basis);
Atom Li2 = Atom("Li", (-0.5, 0.5, 0.0), basis = basis);
Atom Li3 = Atom("Li", (-1.0, 1.0, 0.0), basis = basis);
Atom Li4 = Atom("Li", (-1.5, 1.5, 0.0), basis = basis);
Atom Li5 = Atom("Li", (0.5, 0.5, 0.0), basis = basis);
Atom Li6 = Atom("Li", (0.0, 1.0, 0.0), basis = basis);
Atom Li7 = Atom("Li", (-0.5, 1.5, 0.0), basis = basis);
Atom Li8 = Atom("Li", (-1.0, 2.0, 0.0), basis = basis);
Atom Li9 = Atom("Li", (1.0, 1.0, 0.0), basis = basis);
Atom Li10 = Atom("Li", (0.5, 1.5, 0.0), basis = basis);
Atom Li11 = Atom("Li", (0.0, 2.0, 0.0), basis = basis);
Atom Li12 = Atom("Li", (-0.5, 2.5, 0.0), basis = basis);
Atom Li13 = Atom("Li", (1.5, 1.5, 0.0), basis = basis);
Atom Li14 = Atom("Li", (1.0, 2.0, 0.0), basis = basis);
Atom Li15 = Atom("Li", (0.5, 2.5, 0.0), basis = basis);
Atom Li16 = Atom("Li", (0.0, 3.0, 0.0), basis = basis);
Atom Li17 = Atom("Li", (0.0, 0.5, 0.5), basis = basis);
Atom Li18 = Atom("Li", (-0.5, 1.0, 0.5), basis = basis);
Atom Li19 = Atom("Li", (-1.0, 1.5, 0.5), basis = basis);
Atom Li20 = Atom("Li", (-1.5, 2.0, 0.5), basis = basis);
Atom Li21 = Atom("Li", (0.5, 1.0, 0.5), basis = basis);
Atom Li22 = Atom("Li", (0.0, 1.5, 0.5), basis = basis);
Atom Li23 = Atom("Li", (-0.5, 2.0, 0.5), basis = basis);
Atom Li24 = Atom("Li", (-1.0, 2.5, 0.5), basis = basis);
Atom Li25 = Atom("Li", (1.0, 1.5, 0.5), basis = basis);
Atom Li26 = Atom("Li", (0.5, 2.0, 0.5), basis = basis);
Atom Li27 = Atom("Li", (0.0, 2.5, 0.5), basis = basis);
Atom Li28 = Atom("Li", (-0.5, 3.0, 0.5), basis = basis);
Atom Li29 = Atom("Li", (1.5, 2.0, 0.5), basis = basis);
Atom Li30 = Atom("Li", (1.0, 2.5, 0.5), basis = basis);
Atom Li31 = Atom("Li", (0.5, 3.0, 0.5), basis = basis);
Atom Li32 = Atom("Li", (0.0, 3.5, 0.5), basis = basis);
Atom H33 = Atom("H", (0.0, 0.5, 0.0), basis = basis);
Atom H34 = Atom("H", (-0.5, 1.0, 0.0), basis = basis);
Atom H35 = Atom("H", (-1.0, 1.5, 0.0), basis = basis);
Atom H36 = Atom("H", (-1.5, 2.0, 0.0), basis = basis);
Atom H37 = Atom("H", (0.5, 1.0, 0.0), basis = basis);
Atom H38 = Atom("H", (0.0, 1.5, 0.0), basis = basis);
Atom H39 = Atom("H", (-0.5, 2.0, 0.0), basis = basis);
Atom H40 = Atom("H", (-1.0, 2.5, 0.0), basis = basis);
Atom H41 = Atom("H", (1.0, 1.5, 0.0), basis = basis);
Atom H42 = Atom("H", (0.5, 2.0, 0.0), basis = basis);
Atom H43 = Atom("H", (0.0, 2.5, 0.0), basis = basis);
Atom H44 = Atom("H", (-0.5, 3.0, 0.0), basis = basis);
Atom H45 = Atom("H", (1.5, 2.0, 0.0), basis = basis);
Atom H46 = Atom("H", (1.0, 2.5, 0.0), basis = basis);
Atom H47 = Atom("H", (0.5, 3.0, 0.0), basis = basis);
Atom H48 = Atom("H", (0.0, 3.5, 0.0), basis = basis);
Atom H49 = Atom("H", (0.0, 0.0, 0.5), basis = basis);
Atom H50 = Atom("H", (-0.5, 0.5, 0.5), basis = basis);
Atom H51 = Atom("H", (-1.0, 1.0, 0.5), basis = basis);
Atom H52 = Atom("H", (-1.5, 1.5, 0.5), basis = basis);
Atom H53 = Atom("H", (0.5, 0.5, 0.5), basis = basis);
Atom H54 = Atom("H", (0.0, 1.0, 0.5), basis = basis);
Atom H55 = Atom("H", (-0.5, 1.5, 0.5), basis = basis);
Atom H56 = Atom("H", (-1.0, 2.0, 0.5), basis = basis);
Atom H57 = Atom("H", (1.0, 1.0, 0.5), basis = basis);
Atom H58 = Atom("H", (0.5, 1.5, 0.5), basis = basis);
Atom H59 = Atom("H", (0.0, 2.0, 0.5), basis = basis);
Atom H60 = Atom("H", (-0.5, 2.5, 0.5), basis = basis);
Atom H61 = Atom("H", (1.5, 1.5, 0.5), basis = basis);
Atom H62 = Atom("H", (1.0, 2.0, 0.5), basis = basis);
Atom H63 = Atom("H", (0.5, 2.5, 0.5), basis = basis);
Atom H64 = Atom("H", (0.0, 3.0, 0.5), basis = basis);
Atom H65 = Atom("H", (0.2515546107, 0.485091026, 1.0014206832), basis = basis);
Atom H66 = Atom("H", (-0.014908974, 0.7515546107, 1.0014206832), basis = basis);
Atom O67 = Atom("O", (0.0153759035, 0.5153759035, 1.0267559133), basis = basis);



ALL_ATOMS.drawAtom("Li", draw_label = false, radius_scale = 0.5*radius_scale);
ALL_ATOMS.drawAtom("H", draw_label = false, radius_scale = 0.8*radius_scale);
ALL_ATOMS.drawAtom("O", draw_label = false, radius_scale = 1.2*radius_scale);



//ALL_ATOMS.drawBond("Li", "Li", bond_radius = bond_radius,max_dist = max_bond_dist);
//ALL_ATOMS.drawBond("H", "Li", bond_radius = bond_radius,max_dist = max_bond_dist);
//ALL_ATOMS.drawBond("H", "H", bond_radius = bond_radius,max_dist = max_bond_dist);
//ALL_ATOMS.drawBond("O", "Li", bond_radius = bond_radius,max_dist = max_bond_dist);
//ALL_ATOMS.drawBond("O", "H", bond_radius = bond_radius,max_dist = max_bond_dist);
//ALL_ATOMS.drawBond("O", "O", bond_radius = bond_radius,max_dist = max_bond_dist);



//vim-run: asy -batchView %
//vim-run: asy -f pdf %
