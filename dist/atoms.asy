import three;
import version;

pen getPenFromHex ( string color ){
  real R, G, B, r, g, b;
  R = hex(substr(color, 1,2));
  G = hex(substr(color, 3,2));
  B = hex(substr(color, 5,2));
  r = R/255;
  g = G/255;
  b = B/255;
  return rgb(r,g,b);
};

/**
\brief Structure for storing atomic information.

This structure should be used to store all relevant information related to an
atomic symbol.
*/

struct AtomInfo {
  string element; ///< Atomic symbol of the element
  real   atomic_radius; ///< Atomic radius of the element
  real   atomic_number; ///< Atomic number of the element
  pen    color; ///< Style of the atom (color, etc...)
  /**
  \brief Constructor for AtomInfo
  @param element        Atomic symbol, C, N, etc...
  @param atomic_radius  Atomic radius of the Element in Angstrom
  @param color          Color in html notation (e.g. #ffffff)
  @param atomic_number  Atomic number
  */
  void operator init(string element, real atomic_radius, string color, int atomic_number){
    real main_color = atomic_radius/3;
    this.color         = getPenFromHex(color);
    this.element       = element;
    this.atomic_radius = atomic_radius;
    this.atomic_number = atomic_number;
  }
}


AtomInfo[] ATOMS_INFO = {
  AtomInfo(
    "H",
     0.53,
     "#ffffff",
     1
  ),
  AtomInfo(
    "He",
     0.31,
     "#ffc0cb",
     2
  ),
  AtomInfo(
    "Li",
     1.67,
     "#b22121",
     3
  ),
  AtomInfo(
    "Be",
     1.12,
     "#ff1493",
     4
  ),
  AtomInfo(
    "B",
     0.87,
     "#00ff00",
     5
  ),
  AtomInfo(
    "C",
     0.67,
     "#d3d3d3",
     6
  ),
  AtomInfo(
    "N",
     0.56,
     "#87cee6",
     7
  ),
  AtomInfo(
    "O",
     0.48,
     "#ff0000",
     8
  ),
  AtomInfo(
    "F",
     0.42,
     "#daa520",
     9
  ),
  AtomInfo(
    "Ne",
     0.38,
     "#ff1493",
     10
  ),
  AtomInfo(
    "Na",
     1.90,
     "#0000ff",
     11
  ),
  AtomInfo(
    "Mg",
     1.45,
     "#228b22",
     12
  ),
  AtomInfo(
    "Al",
     1.18,
     "#696969",
     13
  ),
  AtomInfo(
    "Si",
     1.11,
     "#daa520",
     14
  ),
  AtomInfo(
    "P",
     0.98,
     "#ffaa00",
     15
  ),
  AtomInfo(
    "S",
     0.88,
     "#ffff00",
     16
  ),
  AtomInfo(
    "Cl",
     0.79,
     "#00ff00",
     17
  ),
  AtomInfo(
    "Ar",
     0.71,
     "#ff1493",
     18
  ),
  AtomInfo(
    "K",
     2.43,
     "#ff1493",
     19
  ),
  AtomInfo(
    "Ca",
     1.94,
     "#696969",
     20
  ),
  AtomInfo(
    "Sc",
     1.84,
     "#ff1493",
     21
  ),
  AtomInfo(
    "Ti",
     1.76,
     "#696969",
     22
  ),
  AtomInfo(
    "V",
     1.71,
     "#ff1493",
     23
  ),
  AtomInfo(
    "Cr",
     1.66,
     "#696969",
     24
  ),
  AtomInfo(
    "Mn",
     1.61,
     "#696969",
     25
  ),
  AtomInfo(
    "Fe",
     1.56,
     "#ffaa00",
     26
  ),
  AtomInfo(
    "Co",
     1.52,
     "#ff1493",
     27
  ),
  AtomInfo(
    "Ni",
     1.49,
     "#802828",
     28
  ),
  AtomInfo(
    "Cu",
     1.45,
     "#802828",
     29
  ),
  AtomInfo(
    "Zn",
     0.74,
     "#802828",
     30
  ),
  AtomInfo(
    "Ga",
     1.36,
     "#ff1493",
     31
  ),
  AtomInfo(
    "Ge",
     1.25,
     "#ff1493",
     32
  ),
  AtomInfo(
    "As",
     1.14,
     "#ff1493",
     33
  ),
  AtomInfo(
    "Se",
     1.03,
     "#ff1493",
     34
  ),
  AtomInfo(
    "Br",
     0.94,
     "#802828",
     35
  ),
  AtomInfo(
    "Kr",
     0.88,
     "#ff1493",
     36
  ),
  AtomInfo(
    "Rb",
     2.65,
     "#ff1493",
     37
  ),
  AtomInfo(
    "Sr",
     2.19,
     "#ff1493",
     38
  ),
  AtomInfo(
    "Y",
     2.12,
     "#ff1493",
     39
  ),
  AtomInfo(
    "Zr",
     2.06,
     "#ff1493",
     40
  ),
  AtomInfo(
    "Nb",
     1.98,
     "#ff1493",
     41
  ),
  AtomInfo(
    "Mo",
     1.90,
     "#ff1493",
     42
  ),
  AtomInfo(
    "Tc",
     1.83,
     "#ff1493",
     43
  ),
  AtomInfo(
    "Ru",
     1.78,
     "#ff1493",
     44
  ),
  AtomInfo(
    "Rh",
     1.73,
     "#ff1493",
     45
  ),
  AtomInfo(
    "Pd",
     1.69,
     "#ff1493",
     46
  ),
  AtomInfo(
    "Ag",
     1.65,
     "#696969",
     47
  ),
  AtomInfo(
    "Cd",
     1.61,
     "#ff1493",
     48
  ),
  AtomInfo(
    "In",
     1.56,
     "#ff1493",
     49
  ),
  AtomInfo(
    "Sn",
     1.45,
     "#ff1493",
     50
  ),
  AtomInfo(
    "Sb",
     1.33,
     "#ff1493",
     51
  ),
  AtomInfo(
    "Te",
     1.23,
     "#ff1493",
     52
  ),
  AtomInfo(
    "I",
     1.15,
     "#a020f0",
     53
  ),
  AtomInfo(
    "Xe",
     1.08,
     "#ff1493",
     54
  ),
  AtomInfo(
    "Cs",
     2.98,
     "#ff1493",
     55
  ),
  AtomInfo(
    "Ba",
     2.53,
     "#ffaa00",
     56
  ),
  AtomInfo(
    "La",
     1.95,
     "#ff1493",
     57
  ),
  AtomInfo(
    "Ce",
     1.85,
     "#ff1493",
     58
  ),
  AtomInfo(
    "Pr",
     2.47,
     "#ff1493",
     59
  ),
  AtomInfo(
    "Nd",
     2.06,
     "#ff1493",
     60
  ),
  AtomInfo(
    "Pm",
     2.05,
     "#ff1493",
     61
  ),
  AtomInfo(
    "Sm",
     2.38,
     "#ff1493",
     62
  ),
  AtomInfo(
    "Eu",
     2.31,
     "#ff1493",
     63
  ),
  AtomInfo(
    "Gd",
     2.33,
     "#ff1493",
     64
  ),
  AtomInfo(
    "Tb",
     2.25,
     "#ff1493",
     65
  ),
  AtomInfo(
    "Dy",
     2.28,
     "#ff1493",
     66
  ),
  AtomInfo(
    "Ho",
     2.26,
     "#ff1493",
     67
  ),
  AtomInfo(
    "Er",
     2.26,
     "#ff1493",
     68
  ),
  AtomInfo(
    "Tm",
     2.22,
     "#ff1493",
     69
  ),
  AtomInfo(
    "Yb",
     2.22,
     "#ff1493",
     70
  ),
  AtomInfo(
    "Lu",
     2.17,
     "#ff1493",
     71
  ),
  AtomInfo(
    "Hf",
     2.08,
     "#ff1493",
     72
  ),
  AtomInfo(
    "Ta",
     2.00,
     "#ff1493",
     73
  ),
  AtomInfo(
    "W",
     1.93,
     "#ff1493",
     74
  ),
  AtomInfo(
    "Re",
     1.88,
     "#ff1493",
     75
  ),
  AtomInfo(
    "Os",
     1.85,
     "#ff1493",
     76
  ),
  AtomInfo(
    "Ir",
     1.80,
     "#ff1493",
     77
  ),
  AtomInfo(
    "Pt",
     1.77,
     "#ff1493",
     78
  ),
  AtomInfo(
    "Au",
     1.74,
     "#daa520",
     79
  ),
  AtomInfo(
    "Hg",
     1.71,
     "#ff1493",
     80
  ),
  AtomInfo(
    "Tl",
     1.56,
     "#ff1493",
     81
  ),
  AtomInfo(
    "Pb",
     1.54,
     "#ff1493",
     82
  ),
  AtomInfo(
    "Bi",
     1.43,
     "#ff1493",
     83
  ),
  AtomInfo(
    "Po",
     1.35,
     "#ff1493",
     84
  ),
  AtomInfo(
    "At",
     1.27,
     "#ff1493",
     85
  ),
  AtomInfo(
    "Rn",
     1.20,
     "#ff1493",
     86
  ),
  AtomInfo(
    "Ac",
     1.95,
     "#ff1493",
     89
  ),
  AtomInfo(
    "Th",
     1.80,
     "#ff1493",
     90
  ),
  AtomInfo(
    "Pa",
     1.80,
     "#ff1493",
     91
  ),
  AtomInfo(
    "U",
     1.75,
     "#ff1493",
     92
  ),
  AtomInfo(
    "Np",
     1.75,
     "#ff1493",
     93
  ),
  AtomInfo(
    "Pu",
     1.75,
     "#ff1493",
     94
  ),
  AtomInfo(
    "Am",
     1.75,
     "#ff1493",
     95
  )
};


/**
\struct Basis
\brief Vector basis object

This structure is used to define a Basis from 3 vectors. These
vectors needn't be orthogonal.

 */

struct Basis {
  triple a; ///< Vector 1
  triple b; ///< Vector 2
  triple c; ///< Vector 3
  /**
   * Constructor of the Basis structure.
   * @param a The first vector
   * @param b The second vector
   * @param c The third vector
   */
  void operator init(triple a, triple b, triple c){
    this.a = a;
    this.b = b;
    this.c = c;
  };
  /**
   * Get usual cartesian coordinates from a vector.
   * @param coordinates Generic vector expressed
   *    in the coordinates of the basis.
   */
  triple getCartesian(triple coordinates){
    return coordinates.x*a + coordinates.y*b + coordinates.z*c;
  };
}

Basis CARTESIAN = Basis((1,0,0), (0,1,0), (0,0,1));

real distance ( triple a, triple b ){
  return sqrt( (a.x-b.x)^2 + (a.y-b.y)^2 + (a.z-b.z)^2 );
};

/**
 * \struct Main atom structure
 * \brief Structure with the atomic information needed to render an atom.
 */

struct Atom {
  triple   coordinates;
  real     radius;
  string   element;
  Label    label;
  pen      color;
  Basis    basis;
  void setBasis ( Basis b ){ basis = b; };
  triple getCartesian(){
    return basis.getCartesian(coordinates);
  };
  /**
   * \brief Constructor of the Basis structure.
   * @param element    Symbol for the Atom (e.g. C, N .. )
   * @param coordinate Coordinate in respect to the basis "basis"
   * @param basis      Basis for the coordinates of the atom
   */
  void operator init(string element, triple coordinates, Basis basis=CARTESIAN){
    this.coordinates = coordinates;
    this.basis       = basis;
    for ( AtomInfo info : ATOMS_INFO ) {
      if ( info.element == element ) {
        this.element     = info.element;
        this.color       = info.color;
        this.radius      = info.atomic_radius;
      }
    }
    this.label = Label(element) ;
  };
  /**
   * \brief Draw the atom
   *
   * Old versions of asymptote are not able to print labels.
   *
   * @param draw_label    Wheter or not to draw the label
   * @param radius_scale  Scaling factor for the radius
   * @param l             Light to be used in the scene for the Atom
   */
  void draw (bool draw_label = false, real radius_scale=1.0, light l = currentlight){
    draw(shift(getCartesian())*scale3(radius_scale*radius)*unitsphere, color, l);
    if ( draw_label ) {
      if ( (real) VERSION >= 2.21 ) {
        draw(label, getCartesian()+radius*(1,0,0));
      }
    }
  };
};

struct VolumetricData {
  // data must be an array of [value, coordinates] values
  real[][] data;
  void operator init(real[][] data){
    this.data = data;
  };
  void draw (real isovalue=1){
     // TODO
  };
};

/**
 * \struct General simple bond
 * \brief Structure with the bond information needed to render an atomic bond
 */
struct Bond {
  Atom a1,a2;
  void operator init(Atom atom_1, Atom atom_2){
    this.a1 = atom_1;
    this.a2 = atom_2;
  };
  void draw (real max_dist = 100000 , real min_dist = 0, real radius=.15, light l = currentlight){
    real dist = distance( a1.getCartesian(), a2.getCartesian());
    triple direction = a1.getCartesian() - a2.getCartesian();
    real height;
    triple midway;
    if ( min_dist <= dist  && dist <= max_dist ) {
      midway = direction/2 + a2.getCartesian();
      height = distance( a1.getCartesian(), midway);
      draw(midway -- a2.getCartesian(), a2.color+linewidth(radius),l);
      draw(midway -- a1.getCartesian(), a1.color+linewidth(radius),l);
    }
  };
}
