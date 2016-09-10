import atoms;


triple vector;
Voxel V;
real l = 1.23;

write("Testing orthogonal basis...");
//////////////////////////////////////////////

V = Voxel(1, (1,1,1), l=l);


vector = C.getCartesian();




write("Testing length automatic definiton...");
//////////////////////////////////////////////

assert(V.lx == l, "lx failed");
assert(V.ly == l, "ly failed");
assert(V.lz == l, "lz failed");


write("Testing length specific definiton...");
//////////////////////////////////////////////

V = Voxel(1, (1,1,1), lx=l);
assert(V.lx == 1, "lx failed");
assert(V.ly == 2, "ly failed");
assert(V.lz == 3, "lz failed");


write("Testing non-orthogonal basis");
//////////////////////////////////////////////

Basis NonOrthogonal = Basis((1,0,2),(.2,1,3),(-1,-1,-1));



