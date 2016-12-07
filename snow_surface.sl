surface snow_surface() {

  // Fetch the varying variable "elevation" from displacement shader.
  float elevation;
  displacement("elevation", elevation);

  // Constant RGB colors.
  color Cdirt = color(0.941176, 0.901961, 0.54902);   
  color Cwhite = color(1.0, 1.0, 1.0);  
  
  // Normalize the normal to unit length.
  vector Nn = normalize(N);

  // Dirt/Urine
  float dirtValue = 0.41*filterstep(0, N.vector(1, -1, 1));  

  // Compute illumination.
  Cdirt *= diffuse(Nn);
  Cwhite *= diffuse(Nn);

  // Mix the white and the dirt.
  Ci = mix(Cwhite, Cdirt, filterstep(0.2, dirtValue));

  // Set output opacity same as input opacity.
  Oi = Os;
}
