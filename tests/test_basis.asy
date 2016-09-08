import atoms;

triple vector;

write("Testing cartesian basis...");

vector = CARTESIAN.getCartesian((1,2,3));

assert(vector.x == 1, "Component x failed");
assert(vector.y == 2, "Component y failed");
assert(vector.z == 3, "Component z failed");


write("Testing non-orthogonal basis");

Basis NonOrthogonal = Basis((1,0,2),(.2,1,3),(-1,-1,-1));

vector = NonOrthogonal.getCartesian((1,-1,0));

assert(vector.x == 0.8, "Component x failed");
assert(vector.y == -1, "Component y failed");
assert(vector.z == -1, "Component z failed");
