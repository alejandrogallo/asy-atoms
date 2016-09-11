import three;
import version;

include db;

/**
  \brief A nice light for viewing atoms

  It is basically modified from the White light
  defined in three_light.asy.

 */
light AtomLight=light(
  new pen[] {
    rgb(0.38,0.38,0.45),
    rgb(0.6,0.6,0.67),
    rgb(0.5,0.5,0.57)
  },
  specularfactor=3,
  new triple[] {
    (-2,-1.5,-0.5),
    (2,1.1,-2.5),
    (-0.5,0,2)
  },
  viewport=true
);

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
  Label a_label = Label("a",1); ///< Label for vector a
  Label b_label = Label("b",1); ///< Label for vector b
  Label c_label = Label("c",1); ///< Label for vector c
  triple origin = (0,0,0); ///< Origin point for drawing
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
  real[][] getMatrix (){
    real[][] matrix = {
      {a.x, b.x, c.x},
      {a.y, b.y, c.y},
      {a.z, b.z, c.z}
    };
    return matrix;
  };
  /**
   * Returns true if the basis spans \f$\mathbf R^3\f$.
   */
  bool isComplete (){ return determinant(getMatrix())!=0?true:false; };
  /**
   * Get usual cartesian coordinates from a vector
   * in the basis coordinates.
   * @param coordinates of a vector expressed
   *    in cartesian (canonical coordinates).
   * @returns Coordinates of the vector expressed in the
   *    basis.
   */
  triple getCoordinates(triple coordinates){
    real[][] matrix = getMatrix();
    real[] realCoords = {coordinates.x, coordinates.y, coordinates.z};
    real[] result = inverse(matrix)*realCoords;
    //write(matrix);
    //write(inverse(matrix));
    //write(matrix*inverse(matrix));
    return (result[0], result[1], result[2]);
  };
  /**
   * Get usual cartesian coordinates from a vector
   * in the basis coordinates.
   * @param coordinates Generic vector expressed
   *    in the coordinates of the basis.
   */
  triple getCartesian(triple coordinates){
    real[] realCoords = {coordinates.x, coordinates.y, coordinates.z};
    real[] result = getMatrix()*realCoords;
    return (result[0], result[1], result[2]);
  };
  /**
   * \brief Draw a "repere"
   *
   */
  void draw(bool unit_vectors = false, bool draw_label = true){
    triple a_end=a, b_end=b, c_end=c;
    Label labelA="", labelB="", labelC="";
    if (unit_vectors) {
      a_end = dir(a); b_end = dir(b); c_end = dir(c);
    }
    if (draw_label) {
      labelA = a_label; labelB = b_label; labelC = c_label;
    }
    draw(labelA,origin--shift(origin)*a_end, red, Arrow3);
    draw(labelB,origin--shift(origin)*b_end, blue, Arrow3);
    draw(labelC,origin--shift(origin)*c_end, green, Arrow3);
  };
}

Basis CARTESIAN = Basis((1,0,0), (0,1,0), (0,0,1));

/**
 * \struct Atom
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
  triple getCartesian(){ return basis.getCartesian(coordinates); };
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

struct Voxel {
  real value;
  pen color = red;
  triple coordinates;
  Basis basis;
  real lx,ly,lz;
  void setBasis ( Basis b ){ basis = b; };
  void setCoordinates ( triple coords ){ coordinates = coords; };
  triple getCartesian(){ return basis.getCartesian(coordinates); };
  void draw() {
    surface[] voxelSurface; 
    path3[]   voxelLayout;
    triple origin,a,b,c;
    Basis     vbasis; //Voxel basis
    origin = getCartesian();
    a = lx*dir(basis.a);
    b = ly*dir(basis.b);
    c = lz*dir(basis.c);
    vbasis = Basis(a,b,c);
    voxelLayout[0] = origin + vbasis.getCartesian((0,0,0))
                  -- origin + vbasis.getCartesian((1,0,0))
                  -- origin + vbasis.getCartesian((1,1,0))
                  -- origin + vbasis.getCartesian((0,1,0))
                  -- cycle;
    draw(surface(voxelLayout[0]), color);
  };
  /**
   * \brief Constructor of a voxel element
   * @param element    Symbol for the Atom (e.g. C, N .. )
   * @param coordinate Coordinate in respect to the basis "basis"
   * @param basis      Basis for the coordinates of the atom
   * @param l          Voxel length (if set, then it sets lx, ly and lz)
   * @param lx         Voxel x length
   * @param ly         Voyel y length
   * @param lz         Vozel z length
   */
  void operator init(real value , triple coordinates, Basis basis=CARTESIAN,
      real l=0, real lx=0, real ly=0, real lz=0){
    if (l != 0) {
      this.lx = l; this.ly = l; this.lz = l;
    }
    else {
      this.lx = lx; this.ly = ly; this.lz = lz;
    }
    this.value       = value;
    this.coordinates = coordinates;
    this.basis       = basis;
  };
};

/**
 * \struct VolumetricData
 * \brief General structure to store and draw volumetric data
 */
struct VolumetricData {
  // data must be an array of [value, coordinates] values
  real[][] data;
  int      nx;
  int      ny;
  int      nz;
  Basis    basis;
  /**
   * \brief Constructor for Volumetric data
   *
   * @param data          Volumetric data in Cube file format
   * @param basis         Base type structure for rendering correctly the voxels
   * @param nx            How many points in x-direction
   * @param ny            How many points in y-direction
   * @param nz            How many points in z-direction
   */
  void operator init(real[][] data, int nx, int ny, int nz, Basis basis){
    this.data  = data;
    this.nx    = nx;
    this.ny    = ny;
    this.nz    = nz;
    this.basis = basis;
  };
  void draw (real isovalue=1){
     // TODO
  };
};

/**
 * \struct Bond
 * \brief Structure with the bond information needed to render an atomic bond
 */
struct Bond {
  Atom a1,a2;
  void operator init(Atom atom_1, Atom atom_2){
    this.a1 = atom_1;
    this.a2 = atom_2;
  };
  void draw (real max_dist = 100000 , real min_dist = 0, real radius=.15, light l = currentlight){
    real dist = length( a1.getCartesian()- a2.getCartesian());
    triple direction = a1.getCartesian() - a2.getCartesian();
    real height;
    triple midway;
    if ( min_dist <= dist  && dist <= max_dist ) {
      midway = direction/2 + a2.getCartesian();
      height = length( a1.getCartesian() - midway);
      draw(midway -- a2.getCartesian(), a2.color+linewidth(radius),l);
      draw(midway -- a1.getCartesian(), a1.color+linewidth(radius),l);
    }
  };
}
