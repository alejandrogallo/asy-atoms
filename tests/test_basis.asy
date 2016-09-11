import atoms;

triple vector;

triple round ( triple vector ){ return (round(vector.x), round(vector.y),round(vector.z)); };

write("Testing cartesian basis...");
////////////////////////////////////

vector = CARTESIAN.getCartesian((1,2,3));

assert(vector.x == 1, "Component x failed");
assert(vector.y == 2, "Component y failed");
assert(vector.z == 3, "Component z failed");

write("Testing cartesian completeness");
//////////////////////////////////////////////////
assert(CARTESIAN.isComplete(), "Cartesian basis is not complete");

write("Testing cartesian inverse transformation");
//////////////////////////////////////////////////

assert((1,0,0) == CARTESIAN.getCoordinates(CARTESIAN.a), "Inverse not working for cartesian basis");
assert((0,1,0) == CARTESIAN.getCoordinates(CARTESIAN.b), "Inverse not working for cartesian basis");
assert((0,0,1) == CARTESIAN.getCoordinates(CARTESIAN.c), "Inverse not working for cartesian basis");

write("Testing non-orthogonal basis");
//////////////////////////////////////

triple a = (1,0,2);
triple b = (3,1,2);
triple c = (-1,-1,-1);
Basis NonOrthogonal = Basis(a,b,c);

write("Testing non-orthogonal completeness");
//////////////////////////////////////////////////
assert(NonOrthogonal.isComplete(), "Complete basis is not complete");
assert(Basis(a,a,b).isComplete() == false, "Non-complete basis is complete");

triple cartesianCoords, localCoords = (1,-1,0);

cartesianCoords = NonOrthogonal.getCartesian(localCoords);

assert(cartesianCoords.x ==
localCoords.x*a.x + localCoords.y*b.x + localCoords.z*c.x
, "Component x failed");
assert(cartesianCoords.y ==
localCoords.x*a.y + localCoords.y*b.y + localCoords.z*c.y
, "Component y failed");
assert(cartesianCoords.z ==
localCoords.x*a.z + localCoords.y*b.z + localCoords.z*c.z
, "Component z failed");


write("Testing non-orthogonal inverse transformation");
///////////////////////////////////////////////////////

triple newLocalCoord;

newLocalCoord = NonOrthogonal.getCoordinates(cartesianCoords);
//write(cartesianCoords);
//write(round(newLocalCoord));
//write(localCoords);

assert((1,0,0) == round(NonOrthogonal.getCoordinates(NonOrthogonal.a)), "Inverse not working for basis");
assert((0,1,0) == round(NonOrthogonal.getCoordinates(NonOrthogonal.b)), "Inverse not working for basis");
assert((0,0,1) == round(NonOrthogonal.getCoordinates(NonOrthogonal.c)), "Inverse not working for basis");
assert(localCoords == round(newLocalCoord), "Inverse transformation not working");

//vim-run: make dist ; cd $(dirname %); asy $(basename %)
//vim-run: asy -batchView %
