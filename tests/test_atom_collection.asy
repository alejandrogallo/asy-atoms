import atoms;



write("Testing structure ALL_ATOMS");
///////////////////////////

Atom ATOM_1   = Atom("C", (0.0, 0.0, 0.0)).setLabel("1");
Atom ATOM_2   = Atom("C", (0.5, 0.5, 0.5)).setLabel("2");
Atom ATOM_3   = Atom("C", (1.0, 0.0, 1.0)).setLabel("3");
Atom ATOM_4   = Atom("C", (1.5, 0.5, 1.5)).setLabel("4");
Atom ATOM_5   = Atom("C", (0.0, 1.0, 1.0)).setLabel("5");

//write(ALL_ATOMS);
assert(length(ALL_ATOMS) == 5, "ALL_ATOMS is not well defined, dimension mismatch");




//vim-run: make dist ; cd $(dirname %); asy -V  -multipleView $(basename %)
//vim-run: make dist ; cd $(dirname %); asy $(basename %)
//vim-run: asy -f pdf %
// vim: fdm=marker
