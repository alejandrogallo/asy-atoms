import three;
import version;

include db;

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
  AtomInfo info;
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
        this.info        = info;
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
