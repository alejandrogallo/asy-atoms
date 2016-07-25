import three;

pen getPenFromHex ( string color ){
  real R, G, B, r, g, b;
  R = hex(substr(color, 1,2));
  G = hex(substr(color, 3,2));
  B = hex(substr(color, 5,2));
  r = R/255;
  g = G/255;
  b = B/255;
  //write(r,g,b);
  return rgb(r,g,b);
};

struct AtomInfo {
  string element;
  real atomic_radius;
  pen color;
  void operator init(string element, real atomic_radius, string color){
    real main_color = atomic_radius/3;
    this.color         = getPenFromHex(color);
    this.element       = element;
    this.atomic_radius = atomic_radius;
  }
}


AtomInfo[] ATOMS_INFO = {
  AtomInfo("H", 0.53, "#ffffff"),
  AtomInfo("He", 0.31, "#ffc0cb"),
  AtomInfo("Li", 1.67, "#b22121"),
  AtomInfo("Be", 1.12, "#ff1493"),
  AtomInfo("B", 0.87, "#00ff00"),
  AtomInfo("C", 0.67, "#d3d3d3"),
  AtomInfo("N", 0.56, "#87cee6"),
  AtomInfo("O", 0.48, "#ff0000"),
  AtomInfo("F", 0.42, "#daa520"),
  AtomInfo("Ne", 0.38, "#ff1493"),
  AtomInfo("Na", 1.90, "#0000ff"),
  AtomInfo("Mg", 1.45, "#228b22"),
  AtomInfo("Al", 1.18, "#696969"),
  AtomInfo("Si", 1.11, "#daa520"),
  AtomInfo("P", 0.98, "#ffaa00"),
  AtomInfo("S", 0.88, "#ffff00"),
  AtomInfo("Cl", 0.79, "#00ff00"),
  AtomInfo("Ar", 0.71, "#ff1493"),
  AtomInfo("K", 2.43, "#ff1493"),
  AtomInfo("Ca", 1.94, "#696969"),
  AtomInfo("Sc", 1.84, "#ff1493"),
  AtomInfo("Ti", 1.76, "#696969"),
  AtomInfo("V", 1.71, "#ff1493"),
  AtomInfo("Cr", 1.66, "#696969"),
  AtomInfo("Mn", 1.61, "#696969"),
  AtomInfo("Fe", 1.56, "#ffaa00"),
  AtomInfo("Co", 1.52, "#ff1493"),
  AtomInfo("Ni", 1.49, "#802828"),
  AtomInfo("Cu", 1.45, "#802828"),
  AtomInfo("Zn", 0.74, "#802828"),
  AtomInfo("Ga", 1.36, "#ff1493"),
  AtomInfo("Ge", 1.25, "#ff1493"),
  AtomInfo("As", 1.14, "#ff1493"),
  AtomInfo("Se", 1.03, "#ff1493"),
  AtomInfo("Br", 0.94, "#802828"),
  AtomInfo("Kr", 0.88, "#ff1493"),
  AtomInfo("Rb", 2.65, "#ff1493"),
  AtomInfo("Sr", 2.19, "#ff1493"),
  AtomInfo("Y", 2.12, "#ff1493"),
  AtomInfo("Zr", 2.06, "#ff1493"),
  AtomInfo("Nb", 1.98, "#ff1493"),
  AtomInfo("Mo", 1.90, "#ff1493"),
  AtomInfo("Tc", 1.83, "#ff1493"),
  AtomInfo("Ru", 1.78, "#ff1493"),
  AtomInfo("Rh", 1.73, "#ff1493"),
  AtomInfo("Pd", 1.69, "#ff1493"),
  AtomInfo("Ag", 1.65, "#696969"),
  AtomInfo("Cd", 1.61, "#ff1493"),
  AtomInfo("In", 1.56, "#ff1493"),
  AtomInfo("Sn", 1.45, "#ff1493"),
  AtomInfo("Sb", 1.33, "#ff1493"),
  AtomInfo("Te", 1.23, "#ff1493"),
  AtomInfo("I", 1.15, "#a020f0"),
  AtomInfo("Xe", 1.08, "#ff1493"),
  AtomInfo("Cs", 2.98, "#ff1493"),
  AtomInfo("Ba", 2.53, "#ffaa00"),
  AtomInfo("La", 1.95, "#ff1493"),
  AtomInfo("Ce", 1.85, "#ff1493"),
  AtomInfo("Pr", 2.47, "#ff1493"),
  AtomInfo("Nd", 2.06, "#ff1493"),
  AtomInfo("Pm", 2.05, "#ff1493"),
  AtomInfo("Sm", 2.38, "#ff1493"),
  AtomInfo("Eu", 2.31, "#ff1493"),
  AtomInfo("Gd", 2.33, "#ff1493"),
  AtomInfo("Tb", 2.25, "#ff1493"),
  AtomInfo("Dy", 2.28, "#ff1493"),
  AtomInfo("Ho", 2.26, "#ff1493"),
  AtomInfo("Er", 2.26, "#ff1493"),
  AtomInfo("Tm", 2.22, "#ff1493"),
  AtomInfo("Yb", 2.22, "#ff1493"),
  AtomInfo("Lu", 2.17, "#ff1493"),
  AtomInfo("Hf", 2.08, "#ff1493"),
  AtomInfo("Ta", 2.00, "#ff1493"),
  AtomInfo("W", 1.93, "#ff1493"),
  AtomInfo("Re", 1.88, "#ff1493"),
  AtomInfo("Os", 1.85, "#ff1493"),
  AtomInfo("Ir", 1.80, "#ff1493"),
  AtomInfo("Pt", 1.77, "#ff1493"),
  AtomInfo("Au", 1.74, "#daa520"),
  AtomInfo("Hg", 1.71, "#ff1493"),
  AtomInfo("Tl", 1.56, "#ff1493"),
  AtomInfo("Pb", 1.54, "#ff1493"),
  AtomInfo("Bi", 1.43, "#ff1493"),
  AtomInfo("Po", 1.35, "#ff1493"),
  AtomInfo("At", 1.27, "#ff1493"),
  AtomInfo("Rn", 1.20, "#ff1493"),
  AtomInfo("Ac", 1.95, "#ff1493"),
  AtomInfo("Th", 1.80, "#ff1493"),
  AtomInfo("Pa", 1.80, "#ff1493"),
  AtomInfo("U", 1.75, "#ff1493"),
  AtomInfo("Np", 1.75, "#ff1493"),
  AtomInfo("Pu", 1.75, "#ff1493"),
  AtomInfo("Am", 1.75, "#ff1493")
};



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
