
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
  /**
   * Normalise the basis
   *
   * This function changes the basis vectors into unit vectors
   * along the same direction
   */
  void normalise  (){
    a = dir(a);
    b = dir(b);
    c = dir(c);
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
