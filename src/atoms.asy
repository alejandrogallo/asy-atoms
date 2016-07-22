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


struct Bond {
  Atom a1,a2;
  void operator init(Atom atom_1, Atom atom_2){
    this.a1 = atom_1;
    this.a2 = atom_2;
  };
  void draw (real max_dist = 100000 , real min_dist = 0){
    real dist = distance( a1.position, a2.position);
    if ( min_dist <= dist  && dist <= max_dist ) {
      triple midway = (a1.position - a2.position)/2 + a2.position;
      draw(midway -- a2.position, a2.color);
      draw(midway -- a1.position, a1.color);
    }
  };
}
