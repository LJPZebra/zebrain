// open; file > save as > image sequence > JPEG, layer, 3 digits; ok
// or set the __PATH__ in the script below
open("/__PATH__/Ref20131120pt14pl2.nrrd");
run("Image Sequence... ", "format=JPEG name=layer save=/__PATH__/JPEG/layer000.jpeg");
