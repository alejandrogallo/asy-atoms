

/**
 * \struct Atom
 * \brief Structure with the atomic information needed to render an atom.
 */
struct Atom {
  triple   coordinates;
  real     radius;
  string   element;
  static  Atom [] ALL_ATOMS_LIST;
  Label    label_name;
  triple   label_position;
  pen      color;
  Basis    basis;
  AtomInfo info;
  triple getCartesian(){ return basis.getCartesian(coordinates); };
  Atom setBasis ( Basis b ){ basis = b; return this; };
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
    this.label_name = Label(element, E) ;
    this.label_position = getCartesian()+this.radius*dir(currentprojection.camera);
    ALL_ATOMS_LIST.push(this);
  };
  Atom setColor ( pen c ){ color = c; return this; };
  Atom setCoordinates ( triple c ){ coordinates = c; return this; };
  triple getCoordinates ( ){ return coordinates; };
  Atom setRadius ( real r ){ radius = r; return this; };
  Atom scaleRadius ( real r ){ radius = r*radius; return this; };
  Atom setLabel ( Label l ){ label_name = l; return this; };
  Atom setLabelPosition ( triple pos ){ label_position = pos; return this; };
  Atom resetLabelPosition (){
    this.label_position = getCartesian()+this.radius*dir(currentprojection.camera);
    return this;
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
  Atom draw (bool draw_label = false, real radius_scale=1.0, light l = currentlight){
    draw(shift(getCartesian())*scale3(radius_scale*radius)*unitsphere, color, l);
    if ( draw_label ) {
      if ( (real) VERSION >= 2.21 ) {
        label(label_name, label_position);
      }
    }
    return this;
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


/**
 * \struct AtomCollection
 * \brief Collection of atoms to treat them together
 */
struct AtomCollection {
  Atom[] atoms;
  AtomCollection add ( Atom atom ){
    atoms.push(atom);
    return this;
  };
  void operator init(Atom[] atoms){
    this.atoms = atoms;
  };
  AtomCollection drawAtom (string element="", real radius_scale=1, bool draw_label = false){
    for ( Atom atom : atoms ) {
      if ( atom.element == element || length(element) == 0 ) {
        atom.draw(radius_scale = radius_scale, draw_label = draw_label);
      }
    }
    return this;
  };
  AtomCollection drawBond ( string element1, string element2, real bond_radius, real max_dist ){
    for ( Atom atom : atoms ) {
      if ( atom.element == element1 ) {
        for ( Atom atom_other : atoms ) {
          if ( atom_other.element == element2 ) {
            Bond(atom, atom_other).draw(radius=bond_radius, max_dist=max_dist);
          }
        }
      }
    }
  return this;
  };
};

AtomCollection ALL_ATOMS = AtomCollection(Atom.ALL_ATOMS_LIST);

void write ( AtomCollection atoms ){
  for ( Atom atom : atoms.atoms ) {
    write(atom.element);
  }
};

int length ( AtomCollection atoms ){
  int count = 0;
  for ( Atom atom : atoms.atoms ) {
    count = count+1;
  }
  return count;
};

// vim:set et sw=2 ts=2:
