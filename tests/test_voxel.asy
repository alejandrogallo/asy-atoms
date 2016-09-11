import atoms;

unitsize(1cm);

//settings.prc       = false;
//settings.batchView = true;
//settings.render    = -1; //quality
//settings.outformat = "pdf"; //output 

triple vector;
Voxel V;
real l = 1.23;

CARTESIAN.draw();

write("Testing orthogonal basis...");
//////////////////////////////////////////////

V = Voxel(1, (1,1,1), l=l);
dot(Label("$V_1$"), (1,1,1));

V.draw();



write("Testing length automatic definiton...");
//////////////////////////////////////////////

assert(V.lx == l, "lx failed");
assert(V.ly == l, "ly failed");
assert(V.lz == l, "lz failed");


write("Testing length specific definiton...");
//////////////////////////////////////////////

real lx, ly, lz;
V = Voxel(1, (1,1,1), lx=1*l, ly=2*l, lz=3*l);
assert(V.lx == 1*l, "lx failed");
assert(V.ly == 2*l, "ly failed");
assert(V.lz == 3*l, "lz failed");


write("Testing non-orthogonal basis");
//////////////////////////////////////////////

Basis NonOrthogonal = Basis((1,0,2),(.2,1,3),(-1,-1,-1));

NonOrthogonal.origin = (1,1,1);
V = Voxel(1, (.1,.1,.1), NonOrthogonal, lx=1*l, ly=2*l, lz=3*l);

V.draw();

NonOrthogonal.draw();



//vim-run: asy -V %
//vim-run: asy -f pdf %
