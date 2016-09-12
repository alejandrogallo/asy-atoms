import three;
import version;
import contour3;

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

include basis;
include atoms;
include volumetric;
