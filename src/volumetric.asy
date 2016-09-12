
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
    voxelLayout[1] = origin + vbasis.getCartesian((0,0,0))
                  -- origin + vbasis.getCartesian((0,1,0))
                  -- origin + vbasis.getCartesian((0,1,1))
                  -- origin + vbasis.getCartesian((0,0,1))
                  -- cycle;
    voxelLayout[2] = origin + vbasis.getCartesian((1,0,0))
                  -- origin + vbasis.getCartesian((1,1,0))
                  -- origin + vbasis.getCartesian((1,1,1))
                  -- origin + vbasis.getCartesian((1,0,1))
                  -- cycle;
    voxelLayout[3] = origin + vbasis.getCartesian((0,0,0))
                  -- origin + vbasis.getCartesian((1,0,0))
                  -- origin + vbasis.getCartesian((1,0,1))
                  -- origin + vbasis.getCartesian((0,0,1))
                  -- cycle;
    voxelLayout[4] = origin + vbasis.getCartesian((0,1,0))
                  -- origin + vbasis.getCartesian((1,1,0))
                  -- origin + vbasis.getCartesian((1,1,1))
                  -- origin + vbasis.getCartesian((0,1,1))
                  -- cycle;
    voxelLayout[5] = origin + vbasis.getCartesian((0,0,1))
                  -- origin + vbasis.getCartesian((1,0,1))
                  -- origin + vbasis.getCartesian((1,1,1))
                  -- origin + vbasis.getCartesian((0,1,1))
                  -- cycle;
    draw(surface(voxelLayout[0]), color);
    draw(surface(voxelLayout[1]), color);
    draw(surface(voxelLayout[2]), color);
    draw(surface(voxelLayout[3]), color);
    draw(surface(voxelLayout[4]), color);
    draw(surface(voxelLayout[5]), color);
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


struct Vertex {
  real value;
  triple coords;
  Basis basis;
  Vertex next;
};

bool operator == (Vertex v1 , Vertex v2){
  if ( v1.value == v2.value && v1.coords == v2.coords ) {
    return true;
  }
  return false;
};

struct Mcube {
  Vertex start;
  void draw ( real isovalue ){
    Vertex current, next;
    int count=0, count_max;
    current = start;
    next    = start.next;
  };
};

/**
 * \struct VolumetricData
 * \brief General structure to store and draw volumetric data
 */
struct VolumetricData {
  // data must be an array of [value, coordinates] values
  real[] data;
  real     isovalue=1;
  int      nx;
  int      ny;
  int      nz;
  real     lx;
  real     ly;
  real     lz;
  pen      color = red;
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
  void operator init(real[] data, int nx, int ny, int nz, real lx, real ly, real lz, Basis basis){
    this.data  = data;
    this.nx    = nx;
    this.ny    = ny;
    this.nz    = nz;
    this.lx    = lx;
    this.ly    = ly;
    this.lz    = lz;
    this.basis = basis;
    this.basis.normalise(); //Normalise for security
  };
  bool dimensionCheck (){ return data.length == nx*ny*nz ? true : false; };
  void getEverythingReal ( real isovalue = this.isovalue){
    real[][][] values   = new real[nx][ny][nz];
    int  pnx, pny, pnz, index=-1;
    real xstep = lx/nx, ystep = ly/ny, zstep = lz/nz;
    triple point;
    for ( int k = 0; k < nz; k+=1 ) {
      for ( int j = 0; j < ny; j+=1 ) {
        for ( int i = 0; i < nx; i+=1 ) {
          //write("Points["+string(index)+"]:   "+string(i)+"-"+string(j)+"-"+string(k));
          index+=1;
          point = basis.getCartesian((xstep*i,ystep*j,zstep*k) );
          values[i][j][k] = data[index]-isovalue ;
        }
      }
    }
    draw(surface(contour3(values, (0,0,0), (7,7,7))), red);
  };
  void getEverything ( real isovalue = this.isovalue){
    triple[][][] points = new triple[nx][ny][nz];
    real[][][] values   = new real[nx][ny][nz];
    int  pnx, pny, pnz, index=-1;
    real xstep = lx/nx, ystep = ly/ny, zstep = lz/nz;
    for ( int k = 0; k < nz; k+=1 ) {
      for ( int j = 0; j < ny; j+=1 ) {
        for ( int i = 0; i < nx; i+=1 ) {
          //write("Points["+string(index)+"]:   "+string(i)+"-"+string(j)+"-"+string(k));
          index+=1;
          points[i][j][k] = basis.getCartesian((xstep*i,ystep*j,zstep*k) );
          values[i][j][k] = data[index]-isovalue ;
        }
      }
    }
    draw(surface(contour3(points, values)), red);
    //for ( i = 0; i < nx*ny*nz; i=i+1 ) {
      //pnx = (i)%(nx-1);
      //pny = ( i-nx  ) % (ny-1);
      //pnz = ( i-pnx-pny) % (nz-1);
      //write("Points["+string(i)+"]:   "+string(pnx)+"-"+string(pny)+"-"+string(pnz));
      //write(string(i)+"-"+string(pnx)+"="+string( i - pnx));
      //write(pny);
      //write(pnz);
      //points[pnx][pny][pnz] = basis.getCartesian((xstep*pnx,ystep*pny,zstep*pnz) );
      //values[pnx][pny][pnz] = data[i]-isovalue ;
    //}
    //draw(surface(contour3(points, values)), red);
  };
  real getValue ( real x, real y, real z ){
    triple localcoords;
    real xstep = lx/nx, ystep = ly/ny, zstep = lz/nz;
    int  pnx, pny, pnz;
    int index;
    localcoords = basis.getCoordinates((x,y,z));
    //localcoords = (x,y,z);
    pnx = floor(localcoords.x/xstep);
    pny = floor(localcoords.y/ystep);
    pnz = floor(localcoords.z/zstep);
    index =  pnx%(nx-1) + pny%(ny-1) + pnz%(nz-1) ;
    index =  pnx*pny*pnz;
    index =  (pnx)*(pny)*(pnz);
    //write("Points:   "+string(pnx)+"-"+string(pny)+"-"+string(pnz));
    //if ( pnx > nx || pny > ny || pnz > nz ) return 0;
    //write(index);
    if ( index == nx*ny*nz ) {
      //write("OVerflow");
      index = 0;
    }
    return data[index];
  };

  void draw_marching ( real isovalue = this.isovalue ){
    real[][][] values   = new real[nx][ny][nz];
    int  pnx, pny, pnz, index=-1;
    real xstep = lx/nx, ystep = ly/ny, zstep = lz/nz;
    triple point;
    for ( int k = 0; k < nz; k+=1 ) {
      for ( int j = 0; j < ny; j+=1 ) {
        for ( int i = 0; i < nx; i+=1 ) {
          //write("Points["+string(index)+"]:   "+string(i)+"-"+string(j)+"-"+string(k));
          index+=1;
          point = basis.getCartesian((xstep*i,ystep*j,zstep*k) );
          values[i][j][k] = data[index]-isovalue ;
        }
      }
    }
  };
  real kernel (real x, real y, real z){
    return getValue(x,y,z) - isovalue;
  };
  void draw (real isovalue=this.isovalue, pen color = this.color){
    this.isovalue = isovalue;
    draw(
        surface(
          contour3(
            kernel,
            (0,0,0),
            (1*lx,1*ly,1*lz),
            10
            )
          ),
        color,
        render(merge=true)
        );
  };
  void draw_voxel (real isovalue=this.isovalue, pen color = this.color){
    Voxel V;
    triple position;
    real value;
    real xstep = lx/nx, ystep = ly/ny, zstep = lz/nz;
    int index = -1;
    for ( int k = 0; k < nz; k+=1 ) {
      for ( int j = 0; j < ny; j+=1 ) {
        for ( int i = 0; i < nx; i+=1 ) {
          index += 1;
          value = data[index];
          if ( value <= isovalue+0.01 && value >= isovalue - 0.01 ) {
          //if ( value == isovalue ) {
            V = Voxel(value, (i*xstep,j*ystep,k*zstep), basis, lx = xstep, ly = ystep, lz = zstep);
            //write(value, j,j,k);
            V.color = color+opacity(0.3);
            V.draw();
          }
        }
      }
    }
  };
};

