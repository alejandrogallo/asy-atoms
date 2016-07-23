import three;

include db;


real distance ( triple a, triple b ){
  return sqrt( (a.x-b.x)^2 + (a.y-b.y)^2 + (a.z-b.z)^2 );
};
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
  void draw (bool draw_label = false, real radius_scale=1.0){
    draw(shift(position)*scale3(radius_scale*radius)*unitsphere, color);
    if ( draw_label ) {
      //TODO DRAW LABELS
      //label("pepepe",position+radius*(2,0,0));
    }
    //label(scale3(2)*"pepepe",position+(10,0,0));
    //draw(L=Label("$x$", position=Relative(0.8), align=N), position, blue, Arrow3);
  };
};

struct VolumetricData {
  // data must be an array of [value, position] values
  real[][] data;
  void operator init(real[][] data){
    this.data = data;
  };
  void draw (real isovalue=1){
    write("hwllo");
  };
};

struct Bond {
  Atom a1,a2;
  void operator init(Atom atom_1, Atom atom_2){
    this.a1 = atom_1;
    this.a2 = atom_2;
  };
  void draw (real max_dist = 100000 , real min_dist = 0, real radius=.15){
    real dist = distance( a1.position, a2.position);
    triple direction = a1.position - a2.position;
    real height;
    triple midway;
    if ( min_dist <= dist  && dist <= max_dist ) {
      midway = direction/2 + a2.position;
      height = distance( a1.position, midway);
      //draw(cylinder(a2.position,r=radius,h=height,direction), a2.color+linewidth(radius));
      //draw(cylinder(a1.position,r=radius,h=height,-direction), a1.color+linewidth(radius));
      draw(midway -- a2.position, a2.color+linewidth(radius),currentlight);
      draw(midway -- a1.position, a1.color+linewidth(radius),currentlight);
    }
  };
}
