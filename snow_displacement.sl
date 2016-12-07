displacement snow_displacement(output varying float elevation = 0.0) {

  // Specify a coordinate space for the 3D texture coordinates.
  point Ptex = transform("shader", P);
    
  // Create the shape with noise.
  elevation = 2.5*(noise(Ptex)-0.5);
  elevation = smoothstep(-0.2, 0.2, elevation)-1.06;

  // Add a fractal sum of Perlin noise to create a rough surface.
  float freq;
  for (freq=1.0; freq<256.0; freq*=2.0) {
    elevation += 0.3/freq*(noise(Ptex*4.0*freq)-0.9);
  }

  // Displace along normal, and recompute normal.
  P += N * 0.2 * float noise(1.5*Ptex) * elevation;
  N = calculatenormal(P);
}